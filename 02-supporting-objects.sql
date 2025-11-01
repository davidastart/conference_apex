/*
 * Conference Session Tracker - Supporting Objects
 * Generated for: Building APEX Without the Builder Demo
 * Description: PL/SQL packages, functions, and triggers
 * 
 * AI Model: Claude Sonnet 4.5
 * Generation Date: 2025-11-01
 */

SET SERVEROUTPUT ON
SET DEFINE OFF

PROMPT ========================================
PROMPT Creating Supporting Database Objects
PROMPT ========================================

-- ============================================================================
-- Package: CONFERENCE_PKG
-- Purpose: Business logic for conference management
-- ============================================================================

CREATE OR REPLACE PACKAGE conference_pkg AS
    
    -- Room conflict detection
    FUNCTION check_room_conflict(
        p_room_id       IN NUMBER,
        p_start_time    IN TIMESTAMP,
        p_end_time      IN TIMESTAMP,
        p_session_id    IN NUMBER DEFAULT NULL
    ) RETURN VARCHAR2;
    
    -- Calculate current session occupancy
    FUNCTION get_session_occupancy(
        p_session_id IN NUMBER
    ) RETURN NUMBER;
    
    -- Check if session is full
    FUNCTION is_session_full(
        p_session_id IN NUMBER
    ) RETURN BOOLEAN;
    
    -- Generate QR code data for session
    FUNCTION generate_session_qr(
        p_session_id IN NUMBER
    ) RETURN VARCHAR2;
    
    -- Get speaker's session count
    FUNCTION get_speaker_session_count(
        p_speaker_id IN NUMBER
    ) RETURN NUMBER;
    
    -- Register attendee for session (with validation)
    PROCEDURE register_attendee(
        p_attendee_id   IN NUMBER,
        p_session_id    IN NUMBER,
        p_success       OUT BOOLEAN,
        p_message       OUT VARCHAR2
    );
    
    -- Cancel attendee registration
    PROCEDURE cancel_registration(
        p_attendee_id   IN NUMBER,
        p_session_id    IN NUMBER
    );
    
    -- Check in attendee to session
    PROCEDURE checkin_attendee(
        p_attendee_id   IN NUMBER,
        p_session_id    IN NUMBER,
        p_success       OUT BOOLEAN,
        p_message       OUT VARCHAR2
    );
    
    -- Validate session schedule (no overlaps for same speaker)
    FUNCTION validate_speaker_schedule(
        p_speaker_id    IN NUMBER,
        p_start_time    IN TIMESTAMP,
        p_end_time      IN TIMESTAMP,
        p_session_id    IN NUMBER DEFAULT NULL
    ) RETURN VARCHAR2;
    
END conference_pkg;
/

CREATE OR REPLACE PACKAGE BODY conference_pkg AS

    -- ========================================================================
    -- Check for room conflicts
    -- ========================================================================
    FUNCTION check_room_conflict(
        p_room_id       IN NUMBER,
        p_start_time    IN TIMESTAMP,
        p_end_time      IN TIMESTAMP,
        p_session_id    IN NUMBER DEFAULT NULL
    ) RETURN VARCHAR2
    IS
        v_conflict_count NUMBER;
        v_conflict_session VARCHAR2(200);
    BEGIN
        -- Look for overlapping sessions in the same room
        SELECT COUNT(*), MAX(title)
        INTO v_conflict_count, v_conflict_session
        FROM sessions
        WHERE room_id = p_room_id
        AND session_id != NVL(p_session_id, -1)
        AND status != 'CANCELLED'
        AND (
            -- New session starts during existing session
            (p_start_time >= start_time AND p_start_time < end_time)
            OR
            -- New session ends during existing session
            (p_end_time > start_time AND p_end_time <= end_time)
            OR
            -- New session completely encompasses existing session
            (p_start_time <= start_time AND p_end_time >= end_time)
        );
        
        IF v_conflict_count > 0 THEN
            RETURN 'CONFLICT: Room is booked for "' || v_conflict_session || '"';
        ELSE
            RETURN 'OK';
        END IF;
        
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 'ERROR: ' || SQLERRM;
    END check_room_conflict;

    -- ========================================================================
    -- Get current occupancy for a session
    -- ========================================================================
    FUNCTION get_session_occupancy(
        p_session_id IN NUMBER
    ) RETURN NUMBER
    IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM attendee_sessions
        WHERE session_id = p_session_id;
        
        RETURN v_count;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 0;
    END get_session_occupancy;

    -- ========================================================================
    -- Check if session is full
    -- ========================================================================
    FUNCTION is_session_full(
        p_session_id IN NUMBER
    ) RETURN BOOLEAN
    IS
        v_max_attendees NUMBER;
        v_current_count NUMBER;
    BEGIN
        SELECT s.max_attendees, COUNT(ats.attendee_session_id)
        INTO v_max_attendees, v_current_count
        FROM sessions s
        LEFT JOIN attendee_sessions ats ON s.session_id = ats.session_id
        WHERE s.session_id = p_session_id
        GROUP BY s.max_attendees;
        
        -- If no max set, never full
        IF v_max_attendees IS NULL THEN
            RETURN FALSE;
        END IF;
        
        RETURN v_current_count >= v_max_attendees;
        
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN FALSE;
        WHEN OTHERS THEN
            RETURN FALSE;
    END is_session_full;

    -- ========================================================================
    -- Generate QR code data for session
    -- ========================================================================
    FUNCTION generate_session_qr(
        p_session_id IN NUMBER
    ) RETURN VARCHAR2
    IS
        v_qr_data VARCHAR2(500);
    BEGIN
        -- Generate QR code data with session info
        -- Format: CONF2025|SESSION|{session_id}|{code}
        SELECT 'CONF2025|SESSION|' || session_id || '|' || session_code
        INTO v_qr_data
        FROM sessions
        WHERE session_id = p_session_id;
        
        RETURN v_qr_data;
        
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
        WHEN OTHERS THEN
            RETURN NULL;
    END generate_session_qr;

    -- ========================================================================
    -- Get speaker's session count
    -- ========================================================================
    FUNCTION get_speaker_session_count(
        p_speaker_id IN NUMBER
    ) RETURN NUMBER
    IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM sessions
        WHERE speaker_id = p_speaker_id
        AND status != 'CANCELLED';
        
        RETURN v_count;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 0;
    END get_speaker_session_count;

    -- ========================================================================
    -- Register attendee for session
    -- ========================================================================
    PROCEDURE register_attendee(
        p_attendee_id   IN NUMBER,
        p_session_id    IN NUMBER,
        p_success       OUT BOOLEAN,
        p_message       OUT VARCHAR2
    )
    IS
        v_already_registered NUMBER;
    BEGIN
        -- Check if already registered
        SELECT COUNT(*)
        INTO v_already_registered
        FROM attendee_sessions
        WHERE attendee_id = p_attendee_id
        AND session_id = p_session_id;
        
        IF v_already_registered > 0 THEN
            p_success := FALSE;
            p_message := 'Already registered for this session';
            RETURN;
        END IF;
        
        -- Check if session is full
        IF is_session_full(p_session_id) THEN
            p_success := FALSE;
            p_message := 'Session is full';
            RETURN;
        END IF;
        
        -- Register the attendee
        INSERT INTO attendee_sessions (attendee_id, session_id)
        VALUES (p_attendee_id, p_session_id);
        
        p_success := TRUE;
        p_message := 'Successfully registered';
        
        COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            p_success := FALSE;
            p_message := 'Error: ' || SQLERRM;
    END register_attendee;

    -- ========================================================================
    -- Cancel attendee registration
    -- ========================================================================
    PROCEDURE cancel_registration(
        p_attendee_id   IN NUMBER,
        p_session_id    IN NUMBER
    )
    IS
    BEGIN
        DELETE FROM attendee_sessions
        WHERE attendee_id = p_attendee_id
        AND session_id = p_session_id;
        
        COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE;
    END cancel_registration;

    -- ========================================================================
    -- Check in attendee to session
    -- ========================================================================
    PROCEDURE checkin_attendee(
        p_attendee_id   IN NUMBER,
        p_session_id    IN NUMBER,
        p_success       OUT BOOLEAN,
        p_message       OUT VARCHAR2
    )
    IS
        v_registered NUMBER;
    BEGIN
        -- Check if registered
        SELECT COUNT(*)
        INTO v_registered
        FROM attendee_sessions
        WHERE attendee_id = p_attendee_id
        AND session_id = p_session_id;
        
        IF v_registered = 0 THEN
            p_success := FALSE;
            p_message := 'Not registered for this session';
            RETURN;
        END IF;
        
        -- Update check-in status
        UPDATE attendee_sessions
        SET attended = 'Y',
            check_in_time = SYSTIMESTAMP
        WHERE attendee_id = p_attendee_id
        AND session_id = p_session_id;
        
        p_success := TRUE;
        p_message := 'Checked in successfully';
        
        COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            p_success := FALSE;
            p_message := 'Error: ' || SQLERRM;
    END checkin_attendee;

    -- ========================================================================
    -- Validate speaker schedule (no overlaps)
    -- ========================================================================
    FUNCTION validate_speaker_schedule(
        p_speaker_id    IN NUMBER,
        p_start_time    IN TIMESTAMP,
        p_end_time      IN TIMESTAMP,
        p_session_id    IN NUMBER DEFAULT NULL
    ) RETURN VARCHAR2
    IS
        v_conflict_count NUMBER;
        v_conflict_session VARCHAR2(200);
    BEGIN
        -- Check for overlapping sessions for same speaker
        SELECT COUNT(*), MAX(title)
        INTO v_conflict_count, v_conflict_session
        FROM sessions
        WHERE speaker_id = p_speaker_id
        AND session_id != NVL(p_session_id, -1)
        AND status != 'CANCELLED'
        AND (
            (p_start_time >= start_time AND p_start_time < end_time)
            OR (p_end_time > start_time AND p_end_time <= end_time)
            OR (p_start_time <= start_time AND p_end_time >= end_time)
        );
        
        IF v_conflict_count > 0 THEN
            RETURN 'CONFLICT: Speaker already has session "' || v_conflict_session || '" at this time';
        ELSE
            RETURN 'OK';
        END IF;
        
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 'ERROR: ' || SQLERRM;
    END validate_speaker_schedule;

END conference_pkg;
/

PROMPT
PROMPT Creating Triggers...
PROMPT

-- ============================================================================
-- Trigger: Update timestamps on speakers
-- ============================================================================
CREATE OR REPLACE TRIGGER trg_speakers_timestamp
    BEFORE UPDATE ON speakers
    FOR EACH ROW
BEGIN
    :NEW.updated_date := SYSDATE;
END;
/

-- ============================================================================
-- Trigger: Update timestamps on sessions
-- ============================================================================
CREATE OR REPLACE TRIGGER trg_sessions_timestamp
    BEFORE UPDATE ON sessions
    FOR EACH ROW
BEGIN
    :NEW.updated_date := SYSDATE;
END;
/

-- ============================================================================
-- Trigger: Auto-generate QR code on session insert
-- ============================================================================
CREATE OR REPLACE TRIGGER trg_sessions_qr_code
    BEFORE INSERT ON sessions
    FOR EACH ROW
BEGIN
    -- If session_code not provided, generate one
    IF :NEW.session_code IS NULL THEN
        :NEW.session_code := 'S' || LPAD(:NEW.session_id, 4, '0');
    END IF;
    
    -- Generate QR code data
    :NEW.qr_code_data := 'CONF2025|SESSION|' || :NEW.session_id || '|' || :NEW.session_code;
END;
/

-- ============================================================================
-- Trigger: Validate room conflict on insert/update
-- ============================================================================
CREATE OR REPLACE TRIGGER trg_sessions_validate
    BEFORE INSERT OR UPDATE ON sessions
    FOR EACH ROW
DECLARE
    v_conflict_check VARCHAR2(500);
    v_speaker_check VARCHAR2(500);
BEGIN
    -- Only validate if not cancelled
    IF :NEW.status != 'CANCELLED' THEN
        
        -- Check room conflicts
        v_conflict_check := conference_pkg.check_room_conflict(
            :NEW.room_id,
            :NEW.start_time,
            :NEW.end_time,
            :NEW.session_id
        );
        
        IF v_conflict_check != 'OK' THEN
            RAISE_APPLICATION_ERROR(-20001, v_conflict_check);
        END IF;
        
        -- Check speaker schedule conflicts
        v_speaker_check := conference_pkg.validate_speaker_schedule(
            :NEW.speaker_id,
            :NEW.start_time,
            :NEW.end_time,
            :NEW.session_id
        );
        
        IF v_speaker_check != 'OK' THEN
            RAISE_APPLICATION_ERROR(-20002, v_speaker_check);
        END IF;
        
    END IF;
END;
/

PROMPT
PROMPT Creating Views...
PROMPT

-- ============================================================================
-- View: Session details with all related info
-- ============================================================================
CREATE OR REPLACE VIEW v_session_details AS
SELECT 
    s.session_id,
    s.session_code,
    s.title,
    s.description,
    s.session_date,
    TO_CHAR(s.start_time, 'HH24:MI') as start_time_display,
    TO_CHAR(s.end_time, 'HH24:MI') as end_time_display,
    s.start_time,
    s.end_time,
    s.track,
    s.level,
    s.status,
    s.max_attendees,
    r.room_id,
    r.room_name,
    r.building,
    r.capacity as room_capacity,
    sp.speaker_id,
    sp.first_name || ' ' || sp.last_name as speaker_name,
    sp.company as speaker_company,
    sp.email as speaker_email,
    conference_pkg.get_session_occupancy(s.session_id) as registered_count,
    CASE 
        WHEN s.max_attendees IS NULL THEN 'OPEN'
        WHEN conference_pkg.get_session_occupancy(s.session_id) >= s.max_attendees THEN 'FULL'
        WHEN conference_pkg.get_session_occupancy(s.session_id) >= (s.max_attendees * 0.8) THEN 'NEARLY_FULL'
        ELSE 'AVAILABLE'
    END as availability_status,
    ROUND(
        CASE 
            WHEN s.max_attendees > 0 THEN 
                (conference_pkg.get_session_occupancy(s.session_id) / s.max_attendees) * 100
            ELSE 0
        END, 0
    ) as occupancy_percentage
FROM sessions s
JOIN rooms r ON s.room_id = r.room_id
JOIN speakers sp ON s.speaker_id = sp.speaker_id;

COMMENT ON VIEW v_session_details IS 'Complete session information for reports and displays';

-- ============================================================================
-- View: Today's sessions
-- ============================================================================
CREATE OR REPLACE VIEW v_todays_sessions AS
SELECT *
FROM v_session_details
WHERE TRUNC(session_date) = TRUNC(SYSDATE)
ORDER BY start_time;

COMMENT ON VIEW v_todays_sessions IS 'All sessions scheduled for today';

PROMPT
PROMPT ========================================
PROMPT Supporting objects created successfully!
PROMPT ========================================
PROMPT
PROMPT Packages:
PROMPT   - CONFERENCE_PKG (business logic)
PROMPT
PROMPT Triggers:
PROMPT   - Room conflict validation
PROMPT   - Speaker schedule validation
PROMPT   - QR code generation
PROMPT   - Timestamp updates
PROMPT
PROMPT Views:
PROMPT   - V_SESSION_DETAILS
PROMPT   - V_TODAYS_SESSIONS
PROMPT ========================================
