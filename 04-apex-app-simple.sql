/*
 * Conference Session Tracker - APEX Application (APEX 24.2 Compatible)
 * Pure API Approach - Simplified and Working
 * 
 * AI Model: Claude Sonnet 4.5
 * Generation Date: 2025-11-03
 * 
 * This script creates an APEX application using ONLY the API
 * Compatible with APEX 24.2
 */

SET SERVEROUTPUT ON
SET DEFINE OFF
SET VERIFY OFF

PROMPT ========================================
PROMPT Creating APEX Application - Pure API
PROMPT APEX 24.2 Compatible
PROMPT ========================================
PROMPT

-- Set workspace context
BEGIN
    apex_util.set_workspace('CONFERENCE');
    wwv_flow_api.set_security_group_id(
        p_security_group_id => apex_util.find_security_group_id(p_workspace => 'CONFERENCE')
    );
    DBMS_OUTPUT.PUT_LINE('✓ Workspace context set');
END;
/

-- Remove existing application if exists
DECLARE
    v_app_exists NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_app_exists 
    FROM apex_applications 
    WHERE application_id = 200;
    
    IF v_app_exists > 0 THEN
        apex_application_install.clear_all;
        wwv_flow_api.remove_flow(200);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('✓ Removed existing application 200');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('  No existing application to remove');
END;
/

-- Create application
PROMPT
PROMPT Creating application...
BEGIN
    wwv_flow_api.create_flow(
        p_id => 200,
        p_name => 'Conference Session Tracker',
        p_alias => 'CONF_TRACKER',
        p_flow_language => 'en'
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('✓ Application 200 created');
END;
/

-- =============================================================================
-- Page 1: Home Page (Dashboard)
-- =============================================================================
PROMPT
PROMPT Creating Page 1 (Home)...

BEGIN
    wwv_flow_api.create_page(
        p_id => 1,
        p_flow_id => 200,
        p_name => 'Home',
        p_alias => 'HOME',
        p_step_title => 'Conference Dashboard'
    );
    
    -- Add a simple region with SQL query
    wwv_flow_api.create_page_plug(
        p_id => wwv_flow_api.id(10),
        p_flow_id => 200,
        p_page_id => 1,
        p_plug_name => 'Today''s Sessions',
        p_plug_display_sequence => 10,
        p_plug_source_type => 'NATIVE_SQL_REPORT',
        p_plug_source => q'[
SELECT 
    s.session_code,
    s.title,
    TO_CHAR(s.start_time, 'HH24:MI') as start_time,
    sp.first_name || ' ' || sp.last_name as speaker,
    r.room_name
FROM sessions s
JOIN speakers sp ON s.speaker_id = sp.speaker_id
JOIN rooms r ON s.room_id = r.room_id
WHERE TRUNC(s.session_date) = TRUNC(SYSDATE)
AND s.status != 'CANCELLED'
ORDER BY s.start_time
        ]'
    );
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('✓ Page 1 created');
END;
/

-- =============================================================================
-- Page 2: Session List
-- =============================================================================
PROMPT Creating Page 2 (Session List)...

BEGIN
    wwv_flow_api.create_page(
        p_id => 2,
        p_flow_id => 200,
        p_name => 'Sessions',
        p_alias => 'SESSIONS',
        p_step_title => 'All Sessions'
    );
    
    -- Interactive Report
    wwv_flow_api.create_page_plug(
        p_id => wwv_flow_api.id(20),
        p_flow_id => 200,
        p_page_id => 2,
        p_plug_name => 'Session List',
        p_plug_display_sequence => 10,
        p_plug_source_type => 'NATIVE_IR',
        p_plug_source => q'[
SELECT 
    s.session_id,
    s.session_code,
    s.title,
    TO_CHAR(s.session_date, 'DD-MON-YYYY') as session_date,
    TO_CHAR(s.start_time, 'HH24:MI') || ' - ' || TO_CHAR(s.end_time, 'HH24:MI') as time_slot,
    sp.first_name || ' ' || sp.last_name as speaker,
    r.room_name,
    s.track,
    s.session_level,
    s.status
FROM sessions s
JOIN speakers sp ON s.speaker_id = sp.speaker_id
JOIN rooms r ON s.room_id = r.room_id
ORDER BY s.session_date, s.start_time
        ]'
    );
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('✓ Page 2 created');
END;
/

-- =============================================================================
-- Page 3: Session Form (Simple)
-- =============================================================================
PROMPT Creating Page 3 (Session Form)...

BEGIN
    wwv_flow_api.create_page(
        p_id => 3,
        p_flow_id => 200,
        p_name => 'Session',
        p_alias => 'SESSION',
        p_step_title => 'Session Details'
    );
    
    -- Form region
    wwv_flow_api.create_page_plug(
        p_id => wwv_flow_api.id(30),
        p_flow_id => 200,
        p_page_id => 3,
        p_plug_name => 'Session',
        p_plug_display_sequence => 10,
        p_plug_source_type => 'NATIVE_FORM',
        p_plug_source => 'SESSIONS'
    );
    
    -- Primary Key
    wwv_flow_api.create_page_item(
        p_id => wwv_flow_api.id(31),
        p_flow_id => 200,
        p_page_id => 3,
        p_name => 'P3_SESSION_ID',
        p_item_sequence => 10,
        p_item_plug_id => wwv_flow_api.id(30),
        p_use_cache_before_default => 'NO',
        p_source => 'SESSION_ID',
        p_source_type => 'DB_COLUMN',
        p_display_as => 'NATIVE_HIDDEN',
        p_is_persistent => 'Y',
        p_protection_level => 'S',
        p_attribute_01 => 'Y'
    );
    
    -- Title
    wwv_flow_api.create_page_item(
        p_id => wwv_flow_api.id(32),
        p_flow_id => 200,
        p_page_id => 3,
        p_name => 'P3_TITLE',
        p_item_sequence => 20,
        p_item_plug_id => wwv_flow_api.id(30),
        p_use_cache_before_default => 'NO',
        p_prompt => 'Title',
        p_source => 'TITLE',
        p_source_type => 'DB_COLUMN',
        p_display_as => 'NATIVE_TEXT_FIELD',
        p_cSize => 60,
        p_cMaxlength => 200,
        p_field_template => wwv_flow_api.id(0),
        p_item_template_options => '#DEFAULT#',
        p_is_persistent => 'Y',
        p_attribute_01 => 'N',
        p_attribute_02 => 'N',
        p_attribute_04 => 'TEXT',
        p_attribute_05 => 'BOTH'
    );
    
    -- Session Code
    wwv_flow_api.create_page_item(
        p_id => wwv_flow_api.id(33),
        p_flow_id => 200,
        p_page_id => 3,
        p_name => 'P3_SESSION_CODE',
        p_item_sequence => 30,
        p_item_plug_id => wwv_flow_api.id(30),
        p_use_cache_before_default => 'NO',
        p_prompt => 'Session Code',
        p_source => 'SESSION_CODE',
        p_source_type => 'DB_COLUMN',
        p_display_as => 'NATIVE_TEXT_FIELD',
        p_cSize => 20,
        p_cMaxlength => 20,
        p_field_template => wwv_flow_api.id(0),
        p_item_template_options => '#DEFAULT#',
        p_is_persistent => 'Y',
        p_attribute_01 => 'N',
        p_attribute_02 => 'N',
        p_attribute_04 => 'TEXT',
        p_attribute_05 => 'BOTH'
    );
    
    -- Session Date
    wwv_flow_api.create_page_item(
        p_id => wwv_flow_api.id(34),
        p_flow_id => 200,
        p_page_id => 3,
        p_name => 'P3_SESSION_DATE',
        p_item_sequence => 40,
        p_item_plug_id => wwv_flow_api.id(30),
        p_use_cache_before_default => 'NO',
        p_prompt => 'Session Date',
        p_format_mask => 'DD-MON-YYYY',
        p_source => 'SESSION_DATE',
        p_source_type => 'DB_COLUMN',
        p_display_as => 'NATIVE_DATE_PICKER_APEX',
        p_cSize => 30,
        p_field_template => wwv_flow_api.id(0),
        p_item_template_options => '#DEFAULT#',
        p_is_persistent => 'Y',
        p_attribute_01 => 'N',
        p_attribute_02 => 'POPUP',
        p_attribute_03 => 'NONE',
        p_attribute_06 => 'NONE',
        p_attribute_09 => 'N',
        p_attribute_11 => 'Y'
    );
    
    -- Room (LOV)
    wwv_flow_api.create_page_item(
        p_id => wwv_flow_api.id(35),
        p_flow_id => 200,
        p_page_id => 3,
        p_name => 'P3_ROOM_ID',
        p_item_sequence => 50,
        p_item_plug_id => wwv_flow_api.id(30),
        p_use_cache_before_default => 'NO',
        p_prompt => 'Room',
        p_source => 'ROOM_ID',
        p_source_type => 'DB_COLUMN',
        p_display_as => 'NATIVE_SELECT_LIST',
        p_lov => 'SELECT room_name d, room_id r FROM rooms ORDER BY room_name',
        p_lov_display_null => 'YES',
        p_cHeight => 1,
        p_field_template => wwv_flow_api.id(0),
        p_item_template_options => '#DEFAULT#',
        p_is_persistent => 'Y',
        p_lov_display_extra => 'YES',
        p_attribute_01 => 'NONE',
        p_attribute_02 => 'N'
    );
    
    -- Speaker (LOV)
    wwv_flow_api.create_page_item(
        p_id => wwv_flow_api.id(36),
        p_flow_id => 200,
        p_page_id => 3,
        p_name => 'P3_SPEAKER_ID',
        p_item_sequence => 60,
        p_item_plug_id => wwv_flow_api.id(30),
        p_use_cache_before_default => 'NO',
        p_prompt => 'Speaker',
        p_source => 'SPEAKER_ID',
        p_source_type => 'DB_COLUMN',
        p_display_as => 'NATIVE_SELECT_LIST',
        p_lov => 'SELECT first_name || '' '' || last_name d, speaker_id r FROM speakers ORDER BY last_name',
        p_lov_display_null => 'YES',
        p_cHeight => 1,
        p_field_template => wwv_flow_api.id(0),
        p_item_template_options => '#DEFAULT#',
        p_is_persistent => 'Y',
        p_lov_display_extra => 'YES',
        p_attribute_01 => 'NONE',
        p_attribute_02 => 'N'
    );
    
    -- Status
    wwv_flow_api.create_page_item(
        p_id => wwv_flow_api.id(37),
        p_flow_id => 200,
        p_page_id => 3,
        p_name => 'P3_STATUS',
        p_item_sequence => 70,
        p_item_plug_id => wwv_flow_api.id(30),
        p_use_cache_before_default => 'NO',
        p_item_default => 'SCHEDULED',
        p_prompt => 'Status',
        p_source => 'STATUS',
        p_source_type => 'DB_COLUMN',
        p_display_as => 'NATIVE_SELECT_LIST',
        p_lov => 'STATIC:Scheduled;SCHEDULED,Confirmed;CONFIRMED,Cancelled;CANCELLED,Completed;COMPLETED',
        p_cHeight => 1,
        p_field_template => wwv_flow_api.id(0),
        p_item_template_options => '#DEFAULT#',
        p_is_persistent => 'Y',
        p_lov_display_extra => 'NO',
        p_attribute_01 => 'NONE',
        p_attribute_02 => 'N'
    );
    
    -- Buttons
    wwv_flow_api.create_page_button(
        p_id => wwv_flow_api.id(38),
        p_flow_id => 200,
        p_page_id => 3,
        p_button_sequence => 10,
        p_button_name => 'CANCEL',
        p_button_action => 'REDIRECT_PAGE',
        p_button_template_options => '#DEFAULT#',
        p_button_template_id => wwv_flow_api.id(0),
        p_button_image_alt => 'Cancel',
        p_button_redirect_url => 'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
    );
    
    wwv_flow_api.create_page_button(
        p_id => wwv_flow_api.id(39),
        p_flow_id => 200,
        p_page_id => 3,
        p_button_sequence => 20,
        p_button_name => 'SAVE',
        p_button_action => 'SUBMIT',
        p_button_template_options => '#DEFAULT#',
        p_button_template_id => wwv_flow_api.id(0),
        p_button_is_hot => 'Y',
        p_button_image_alt => 'Save',
        p_database_action => 'UPDATE'
    );
    
    -- Process
    wwv_flow_api.create_page_process(
        p_id => wwv_flow_api.id(40),
        p_flow_id => 200,
        p_page_id => 3,
        p_process_sequence => 10,
        p_process_point => 'AFTER_SUBMIT',
        p_process_type => 'NATIVE_FORM_DML',
        p_process_name => 'Process Session',
        p_attribute_01 => 'SESSIONS',
        p_error_display_location => 'INLINE_IN_NOTIFICATION',
        p_process_success_message => 'Session saved.'
    );
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('✓ Page 3 created');
END;
/

-- =============================================================================
-- Navigation
-- =============================================================================
PROMPT
PROMPT Creating navigation...

BEGIN
    -- Create navigation bar entry
    wwv_flow_api.create_icon_bar_item(
        p_id => wwv_flow_api.id(100),
        p_flow_id => 200,
        p_icon_sequence => 100,
        p_icon_image => '',
        p_icon_subtext => 'Home',
        p_icon_target => 'f?p=&APP_ID.:1:&SESSION.',
        p_icon_image_alt => 'Home',
        p_icon_height => NULL,
        p_icon_width => NULL,
        p_icon_height2 => NULL,
        p_icon_width2 => NULL,
        p_icon_bar_disp_cond => '',
        p_icon_bar_disp_cond_type => '',
        p_begins_on_new_line => '',
        p_cell_colspan => 1
    );
    
    wwv_flow_api.create_icon_bar_item(
        p_id => wwv_flow_api.id(101),
        p_flow_id => 200,
        p_icon_sequence => 200,
        p_icon_image => '',
        p_icon_subtext => 'Sessions',
        p_icon_target => 'f?p=&APP_ID.:2:&SESSION.',
        p_icon_image_alt => 'Sessions',
        p_icon_height => NULL,
        p_icon_width => NULL,
        p_icon_height2 => NULL,
        p_icon_width2 => NULL,
        p_icon_bar_disp_cond => '',
        p_icon_bar_disp_cond_type => '',
        p_begins_on_new_line => '',
        p_cell_colspan => 1
    );
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('✓ Navigation created');
END;
/

PROMPT
PROMPT ========================================
PROMPT ✓ Application Created Successfully!
PROMPT ========================================
PROMPT
PROMPT Application ID: 200
PROMPT Application Alias: CONF_TRACKER
PROMPT Pages Created: 3
PROMPT   - Page 1: Home (Dashboard)
PROMPT   - Page 2: Sessions (Interactive Report)
PROMPT   - Page 3: Session Form
PROMPT
PROMPT *** CREATED ENTIRELY VIA API ***
PROMPT *** NO BUILDER USED ***
PROMPT
PROMPT Access: [APEX-URL]/r/conf_tracker/home
PROMPT ========================================

COMMIT;
