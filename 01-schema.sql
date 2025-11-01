/*
 * Conference Session Tracker - Database Schema
 * Generated for: Building APEX Without the Builder Demo
 * Description: Complete data model for conference management system
 * 
 * AI Model: Claude Sonnet 4.5
 * Generation Date: 2025-11-01
 */

-- Enable serveroutput for feedback
SET SERVEROUTPUT ON
SET DEFINE OFF

PROMPT ========================================
PROMPT Creating Conference Session Tracker Schema
PROMPT ========================================

-- Drop existing objects (for clean reruns)
BEGIN
    FOR i IN (SELECT table_name FROM user_tables WHERE table_name IN (
        'ATTENDEE_SESSIONS', 'SESSIONS', 'SPEAKERS', 'ROOMS', 'ATTENDEES'
    )) LOOP
        EXECUTE IMMEDIATE 'DROP TABLE ' || i.table_name || ' CASCADE CONSTRAINTS';
        DBMS_OUTPUT.PUT_LINE('Dropped table: ' || i.table_name);
    END LOOP;
END;
/

PROMPT
PROMPT Creating Tables...
PROMPT

-- Speakers table
CREATE TABLE speakers (
    speaker_id          NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name          VARCHAR2(50) NOT NULL,
    last_name           VARCHAR2(50) NOT NULL,
    email               VARCHAR2(100) NOT NULL UNIQUE,
    bio                 CLOB,
    company             VARCHAR2(100),
    job_title           VARCHAR2(100),
    twitter_handle      VARCHAR2(50),
    linkedin_url        VARCHAR2(200),
    photo_blob          BLOB,
    photo_mime_type     VARCHAR2(100),
    photo_filename      VARCHAR2(255),
    created_date        DATE DEFAULT SYSDATE NOT NULL,
    updated_date        DATE DEFAULT SYSDATE NOT NULL,
    is_active           VARCHAR2(1) DEFAULT 'Y' CHECK (is_active IN ('Y', 'N'))
);

COMMENT ON TABLE speakers IS 'Conference speakers and presenters';
COMMENT ON COLUMN speakers.speaker_id IS 'Primary key';
COMMENT ON COLUMN speakers.bio IS 'Speaker biography for program book';
COMMENT ON COLUMN speakers.photo_blob IS 'Speaker headshot photo';

-- Rooms table
CREATE TABLE rooms (
    room_id             NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    room_name           VARCHAR2(100) NOT NULL UNIQUE,
    building            VARCHAR2(50),
    floor_number        NUMBER,
    capacity            NUMBER NOT NULL,
    has_av_equipment    VARCHAR2(1) DEFAULT 'Y' CHECK (has_av_equipment IN ('Y', 'N')),
    has_video_conf      VARCHAR2(1) DEFAULT 'N' CHECK (has_video_conf IN ('Y', 'N')),
    room_layout         VARCHAR2(30), -- THEATER, CLASSROOM, BOARDROOM, U_SHAPE
    notes               VARCHAR2(500),
    is_active           VARCHAR2(1) DEFAULT 'Y' CHECK (is_active IN ('Y', 'N'))
);

COMMENT ON TABLE rooms IS 'Conference rooms and venues';
COMMENT ON COLUMN rooms.capacity IS 'Maximum seating capacity';
COMMENT ON COLUMN rooms.room_layout IS 'Physical layout type';

-- Sessions table
CREATE TABLE sessions (
    session_id          NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title               VARCHAR2(200) NOT NULL,
    description         CLOB,
    session_code        VARCHAR2(20) UNIQUE,
    session_date        DATE NOT NULL,
    start_time          TIMESTAMP NOT NULL,
    end_time            TIMESTAMP NOT NULL,
    room_id             NUMBER NOT NULL,
    speaker_id          NUMBER NOT NULL,
    track               VARCHAR2(50), -- TECHNICAL, BUSINESS, COMMUNITY
    level               VARCHAR2(20), -- BEGINNER, INTERMEDIATE, ADVANCED
    max_attendees       NUMBER,
    status              VARCHAR2(20) DEFAULT 'SCHEDULED' 
                        CHECK (status IN ('SCHEDULED', 'CONFIRMED', 'CANCELLED', 'COMPLETED')),
    qr_code_data        VARCHAR2(500),
    materials_url       VARCHAR2(500),
    recording_url       VARCHAR2(500),
    created_date        DATE DEFAULT SYSDATE NOT NULL,
    updated_date        DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT fk_session_room FOREIGN KEY (room_id) REFERENCES rooms(room_id),
    CONSTRAINT fk_session_speaker FOREIGN KEY (speaker_id) REFERENCES speakers(speaker_id),
    CONSTRAINT chk_session_times CHECK (end_time > start_time)
);

COMMENT ON TABLE sessions IS 'Conference sessions and presentations';
COMMENT ON COLUMN sessions.session_code IS 'Unique session identifier (e.g., S101, WS205)';
COMMENT ON COLUMN sessions.track IS 'Session category/track';
COMMENT ON COLUMN sessions.qr_code_data IS 'QR code content for session check-in';

-- Attendees table
CREATE TABLE attendees (
    attendee_id         NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name          VARCHAR2(50) NOT NULL,
    last_name           VARCHAR2(50) NOT NULL,
    email               VARCHAR2(100) NOT NULL UNIQUE,
    company             VARCHAR2(100),
    job_title           VARCHAR2(100),
    phone               VARCHAR2(20),
    registration_date   DATE DEFAULT SYSDATE NOT NULL,
    badge_printed       VARCHAR2(1) DEFAULT 'N' CHECK (badge_printed IN ('Y', 'N')),
    is_speaker          VARCHAR2(1) DEFAULT 'N' CHECK (is_speaker IN ('Y', 'N')),
    dietary_restrictions VARCHAR2(200),
    status              VARCHAR2(20) DEFAULT 'REGISTERED'
                        CHECK (status IN ('REGISTERED', 'CHECKED_IN', 'CANCELLED'))
);

COMMENT ON TABLE attendees IS 'Conference attendees and registrants';

-- Attendee Sessions (many-to-many relationship)
CREATE TABLE attendee_sessions (
    attendee_session_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    attendee_id         NUMBER NOT NULL,
    session_id          NUMBER NOT NULL,
    registered_date     DATE DEFAULT SYSDATE NOT NULL,
    attended            VARCHAR2(1) DEFAULT 'N' CHECK (attended IN ('Y', 'N')),
    check_in_time       TIMESTAMP,
    CONSTRAINT fk_attsess_attendee FOREIGN KEY (attendee_id) REFERENCES attendees(attendee_id) ON DELETE CASCADE,
    CONSTRAINT fk_attsess_session FOREIGN KEY (session_id) REFERENCES sessions(session_id) ON DELETE CASCADE,
    CONSTRAINT uk_attendee_session UNIQUE (attendee_id, session_id)
);

COMMENT ON TABLE attendee_sessions IS 'Tracks which attendees registered for which sessions';

PROMPT
PROMPT Creating Indexes...
PROMPT

-- Performance indexes
CREATE INDEX idx_sessions_date ON sessions(session_date, start_time);
CREATE INDEX idx_sessions_room ON sessions(room_id, start_time);
CREATE INDEX idx_sessions_speaker ON sessions(speaker_id);
CREATE INDEX idx_sessions_status ON sessions(status);
CREATE INDEX idx_attsess_session ON attendee_sessions(session_id);
CREATE INDEX idx_attsess_attendee ON attendee_sessions(attendee_id);
CREATE INDEX idx_speakers_email ON speakers(UPPER(email));
CREATE INDEX idx_attendees_email ON attendees(UPPER(email));

PROMPT
PROMPT Creating Sequences (for backward compatibility)...
PROMPT

-- These can be useful for manual inserts or imports
CREATE SEQUENCE seq_speaker_id START WITH 1000 INCREMENT BY 1;
CREATE SEQUENCE seq_room_id START WITH 100 INCREMENT BY 1;
CREATE SEQUENCE seq_session_id START WITH 1000 INCREMENT BY 1;
CREATE SEQUENCE seq_attendee_id START WITH 10000 INCREMENT BY 1;

PROMPT
PROMPT Schema creation completed successfully!
PROMPT ========================================
PROMPT
PROMPT Next steps:
PROMPT 1. Run 02-supporting-objects.sql
PROMPT 2. Run 03-sample-data.sql
PROMPT 3. Run 04-apex-app.sql
PROMPT ========================================
