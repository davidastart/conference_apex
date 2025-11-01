/*
 * Conference Session Tracker - Sample Data
 * Generated for: Building APEX Without the Builder Demo
 * Description: Realistic test data for conference management system
 * 
 * AI Model: Claude Sonnet 4.5
 * Generation Date: 2025-11-01
 */

SET SERVEROUTPUT ON
SET DEFINE OFF

PROMPT ========================================
PROMPT Loading Sample Conference Data
PROMPT ========================================

-- ============================================================================
-- Insert Rooms
-- ============================================================================
PROMPT
PROMPT Inserting conference rooms...

INSERT INTO rooms (room_name, building, floor_number, capacity, has_av_equipment, has_video_conf, room_layout)
VALUES ('Grand Ballroom A', 'Main Convention Center', 1, 500, 'Y', 'Y', 'THEATER');

INSERT INTO rooms (room_name, building, floor_number, capacity, has_av_equipment, has_video_conf, room_layout)
VALUES ('Grand Ballroom B', 'Main Convention Center', 1, 500, 'Y', 'Y', 'THEATER');

INSERT INTO rooms (room_name, building, floor_number, capacity, has_av_equipment, has_video_conf, room_layout)
VALUES ('Executive Room 201', 'Tower Building', 2, 50, 'Y', 'Y', 'CLASSROOM');

INSERT INTO rooms (room_name, building, floor_number, capacity, has_av_equipment, has_video_conf, room_layout)
VALUES ('Executive Room 202', 'Tower Building', 2, 50, 'Y', 'Y', 'CLASSROOM');

INSERT INTO rooms (room_name, building, floor_number, capacity, has_av_equipment, has_video_conf, room_layout)
VALUES ('Innovation Lab', 'Tech Wing', 3, 30, 'Y', 'Y', 'U_SHAPE');

INSERT INTO rooms (room_name, building, floor_number, capacity, has_av_equipment, has_video_conf, room_layout)
VALUES ('Boardroom 301', 'Tower Building', 3, 20, 'Y', 'Y', 'BOARDROOM');

INSERT INTO rooms (room_name, building, floor_number, capacity, has_av_equipment, has_video_conf, room_layout)
VALUES ('Workshop Space A', 'Tech Wing', 1, 40, 'Y', 'N', 'CLASSROOM');

INSERT INTO rooms (room_name, building, floor_number, capacity, has_av_equipment, has_video_conf, room_layout)
VALUES ('Workshop Space B', 'Tech Wing', 1, 40, 'Y', 'N', 'CLASSROOM');

PROMPT   ... 8 rooms inserted

-- ============================================================================
-- Insert Speakers
-- ============================================================================
PROMPT
PROMPT Inserting conference speakers...

INSERT INTO speakers (first_name, last_name, email, company, job_title, bio, twitter_handle, linkedin_url)
VALUES (
    'Sarah',
    'Chen',
    'sarah.chen@techcorp.com',
    'TechCorp Industries',
    'Chief Technology Officer',
    'Sarah Chen is a renowned expert in database architecture with over 20 years of experience. She has led digital transformation initiatives at Fortune 500 companies and is a frequent speaker at technology conferences worldwide.',
    '@sarahchen',
    'https://linkedin.com/in/sarahchen'
);

INSERT INTO speakers (first_name, last_name, email, company, job_title, bio, twitter_handle, linkedin_url)
VALUES (
    'Michael',
    'Rodriguez',
    'mrodriguez@dataexperts.io',
    'DataExperts.io',
    'Lead Database Architect',
    'Michael specializes in Oracle database optimization and performance tuning. He is the author of three books on database design and has consulted for major tech companies on scalability challenges.',
    '@mikerod',
    'https://linkedin.com/in/michaelrodriguez'
);

INSERT INTO speakers (first_name, last_name, email, company, job_title, bio, twitter_handle, linkedin_url)
VALUES (
    'Priya',
    'Patel',
    'priya.patel@cloudnative.com',
    'CloudNative Solutions',
    'VP of Engineering',
    'Priya is a pioneer in cloud-native database solutions and AI integration. She leads a team of 200+ engineers and has spoken at over 50 conferences on modern data architecture.',
    '@priyatech',
    'https://linkedin.com/in/priyapatel'
);

INSERT INTO speakers (first_name, last_name, email, company, job_title, bio, twitter_handle, linkedin_url)
VALUES (
    'James',
    'O''Brien',
    'james.obrien@securedb.com',
    'SecureDB Inc',
    'Security Architect',
    'James is a cybersecurity expert with deep expertise in database security, encryption, and compliance. He holds multiple security certifications and has published numerous research papers.',
    '@jamesobrien',
    'https://linkedin.com/in/jamesobrien'
);

INSERT INTO speakers (first_name, last_name, email, company, job_title, bio, twitter_handle, linkedin_url)
VALUES (
    'Emily',
    'Washington',
    'ewashington@apexconsulting.com',
    'APEX Consulting Group',
    'Principal Consultant',
    'Emily is a leading APEX developer with 15 years of experience building enterprise applications. She specializes in low-code development strategies and has trained thousands of developers.',
    '@emilywash',
    'https://linkedin.com/in/emilywashington'
);

INSERT INTO speakers (first_name, last_name, email, company, job_title, bio, twitter_handle, linkedin_url)
VALUES (
    'David',
    'Kim',
    'david.kim@aiventures.com',
    'AI Ventures',
    'Head of AI Research',
    'David leads AI research initiatives focusing on database automation and intelligent query optimization. He has a PhD in Computer Science and numerous patents in machine learning.',
    '@davidkim',
    'https://linkedin.com/in/davidkim'
);

INSERT INTO speakers (first_name, last_name, email, company, job_title, bio, twitter_handle, linkedin_url)
VALUES (
    'Lisa',
    'Thompson',
    'lisa.thompson@devops360.com',
    'DevOps360',
    'DevOps Director',
    'Lisa is an expert in database DevOps, CI/CD pipelines, and infrastructure as code. She has implemented DevOps practices at scale for enterprise database environments.',
    '@lisadevops',
    'https://linkedin.com/in/lisathompson'
);

INSERT INTO speakers (first_name, last_name, email, company, job_title, bio, twitter_handle, linkedin_url)
VALUES (
    'Robert',
    'Martinez',
    'rmartinez@performancedb.com',
    'Performance Database Solutions',
    'Senior Performance Engineer',
    'Robert specializes in extreme database performance optimization. He has helped companies achieve 10x performance improvements and is known for his deep-dive technical sessions.',
    '@robmartinez',
    'https://linkedin.com/in/robertmartinez'
);

PROMPT   ... 8 speakers inserted

-- ============================================================================
-- Insert Sessions (spanning 3 days)
-- ============================================================================
PROMPT
PROMPT Inserting conference sessions...

-- DAY 1: SYSDATE (Today)
-- Keynote
INSERT INTO sessions (
    title, description, session_code, session_date, 
    start_time, end_time, room_id, speaker_id, 
    track, level, max_attendees, status
)
VALUES (
    'The Future of Database Development: AI-Powered Low-Code',
    'Opening keynote exploring how AI and low-code platforms are transforming database application development. Learn about the latest trends, case studies, and a live demonstration of AI-assisted APEX development.',
    'KEY001',
    TRUNC(SYSDATE),
    TO_TIMESTAMP(TRUNC(SYSDATE) || ' 09:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_TIMESTAMP(TRUNC(SYSDATE) || ' 10:00:00', 'DD-MON-RR HH24:MI:SS'),
    1, -- Grand Ballroom A
    1, -- Sarah Chen
    'KEYNOTE',
    'ALL',
    500,
    'CONFIRMED'
);

-- Morning Sessions - Day 1
INSERT INTO sessions (
    title, description, session_code, session_date, 
    start_time, end_time, room_id, speaker_id, 
    track, level, max_attendees, status
)
VALUES (
    'APEX Performance Tuning: From Good to Great',
    'Deep dive into APEX performance optimization techniques. Learn how to identify bottlenecks, optimize SQL queries, and implement caching strategies for enterprise-scale applications.',
    'S101',
    TRUNC(SYSDATE),
    TO_TIMESTAMP(TRUNC(SYSDATE) || ' 10:30:00', 'DD-MON-RR HH24:MI:SS'),
    TO_TIMESTAMP(TRUNC(SYSDATE) || ' 11:30:00', 'DD-MON-RR HH24:MI:SS'),
    3, -- Executive Room 201
    8, -- Robert Martinez
    'TECHNICAL',
    'ADVANCED',
    50,
    'CONFIRMED'
);

INSERT INTO sessions (
    title, description, session_code, session_date, 
    start_time, end_time, room_id, speaker_id, 
    track, level, max_attendees, status
)
VALUES (
    'Getting Started with Oracle APEX',
    'Perfect for beginners! This session covers APEX fundamentals, development environment setup, and building your first application. Hands-on exercises included.',
    'S102',
    TRUNC(SYSDATE),
    TO_TIMESTAMP(TRUNC(SYSDATE) || ' 10:30:00', 'DD-MON-RR HH24:MI:SS'),
    TO_TIMESTAMP(TRUNC(SYSDATE) || ' 11:30:00', 'DD-MON-RR HH24:MI:SS'),
    4, -- Executive Room 202
    5, -- Emily Washington
    'TECHNICAL',
    'BEGINNER',
    50,
    'CONFIRMED'
);

INSERT INTO sessions (
    title, description, session_code, session_date, 
    start_time, end_time, room_id, speaker_id, 
    track, level, max_attendees, status
)
VALUES (
    'Database Security in the Cloud Era',
    'Comprehensive overview of modern database security practices, including encryption, access controls, audit logging, and compliance requirements for cloud deployments.',
    'S103',
    TRUNC(SYSDATE),
    TO_TIMESTAMP(TRUNC(SYSDATE) || ' 10:30:00', 'DD-MON-RR HH24:MI:SS'),
    TO_TIMESTAMP(TRUNC(SYSDATE) || ' 11:30:00', 'DD-MON-RR HH24:MI:SS'),
    5, -- Innovation Lab
    4, -- James O'Brien
    'TECHNICAL',
    'INTERMEDIATE',
    30,
    'CONFIRMED'
);

-- Afternoon Sessions - Day 1
INSERT INTO sessions (
    title, description, session_code, session_date, 
    start_time, end_time, room_id, speaker_id, 
    track, level, max_attendees, status
)
VALUES (
    'AI-Powered Database Development Workshop',
    'Hands-on workshop demonstrating how to use AI coding assistants to build database applications. Participants will create a working APEX application using AI tools.',
    'WS201',
    TRUNC(SYSDATE),
    TO_TIMESTAMP(TRUNC(SYSDATE) || ' 13:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_TIMESTAMP(TRUNC(SYSDATE) || ' 15:00:00', 'DD-MON-RR HH24:MI:SS'),
    7, -- Workshop Space A
    6, -- David Kim
    'TECHNICAL',
    'INTERMEDIATE',
    40,
    'CONFIRMED'
);

INSERT INTO sessions (
    title, description, session_code, session_date, 
    start_time, end_time, room_id, speaker_id, 
    track, level, max_attendees, status
)
VALUES (
    'Building APEX Without the Builder',
    'Revolutionary approach to APEX development using code-first methodology. See how to generate production-ready applications without touching the APEX Builder interface.',
    'S204',
    TRUNC(SYSDATE),
    TO_TIMESTAMP(TRUNC(SYSDATE) || ' 13:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_TIMESTAMP(TRUNC(SYSDATE) || ' 14:00:00', 'DD-MON-RR HH24:MI:SS'),
    3, -- Executive Room 201
    5, -- Emily Washington
    'TECHNICAL',
    'ADVANCED',
    50,
    'CONFIRMED'
);

INSERT INTO sessions (
    title, description, session_code, session_date, 
    start_time, end_time, room_id, speaker_id, 
    track, level, max_attendees, status
)
VALUES (
    'DevOps for Database Developers',
    'Learn how to implement CI/CD pipelines, automated testing, and infrastructure as code for database applications. Practical examples using GitHub Actions and container technologies.',
    'S205',
    TRUNC(SYSDATE),
    TO_TIMESTAMP(TRUNC(SYSDATE) || ' 13:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_TIMESTAMP(TRUNC(SYSDATE) || ' 14:00:00', 'DD-MON-RR HH24:MI:SS'),
    4, -- Executive Room 202
    7, -- Lisa Thompson
    'TECHNICAL',
    'INTERMEDIATE',
    50,
    'CONFIRMED'
);

-- Late Afternoon - Day 1
INSERT INTO sessions (
    title, description, session_code, session_date, 
    start_time, end_time, room_id, speaker_id, 
    track, level, max_attendees, status
)
VALUES (
    'Cloud-Native Database Architecture',
    'Explore modern cloud-native database patterns, microservices integration, and scalability strategies. Real-world case studies from companies running databases at scale.',
    'S206',
    TRUNC(SYSDATE),
    TO_TIMESTAMP(TRUNC(SYSDATE) || ' 15:30:00', 'DD-MON-RR HH24:MI:SS'),
    TO_TIMESTAMP(TRUNC(SYSDATE) || ' 16:30:00', 'DD-MON-RR HH24:MI:SS'),
    3, -- Executive Room 201
    3, -- Priya Patel
    'TECHNICAL',
    'ADVANCED',
    50,
    'CONFIRMED'
);

-- DAY 2: SYSDATE + 1 (Tomorrow)
INSERT INTO sessions (
    title, description, session_code, session_date, 
    start_time, end_time, room_id, speaker_id, 
    track, level, max_attendees, status
)
VALUES (
    'Advanced SQL Techniques for APEX Developers',
    'Master advanced SQL patterns including analytic functions, recursive queries, and JSON processing. Learn optimization techniques for complex data requirements.',
    'S301',
    TRUNC(SYSDATE) + 1,
    TO_TIMESTAMP(TRUNC(SYSDATE + 1) || ' 09:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_TIMESTAMP(TRUNC(SYSDATE + 1) || ' 10:30:00', 'DD-MON-RR HH24:MI:SS'),
    3, -- Executive Room 201
    2, -- Michael Rodriguez
    'TECHNICAL',
    'ADVANCED',
    50,
    'SCHEDULED'
);

INSERT INTO sessions (
    title, description, session_code, session_date, 
    start_time, end_time, room_id, speaker_id, 
    track, level, max_attendees, status
)
VALUES (
    'APEX Mobile Development Best Practices',
    'Build responsive, mobile-first APEX applications. Progressive Web Apps (PWA), offline capabilities, and mobile-specific UI patterns.',
    'S302',
    TRUNC(SYSDATE) + 1,
    TO_TIMESTAMP(TRUNC(SYSDATE + 1) || ' 09:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_TIMESTAMP(TRUNC(SYSDATE + 1) || ' 10:30:00', 'DD-MON-RR HH24:MI:SS'),
    4, -- Executive Room 202
    5, -- Emily Washington
    'TECHNICAL',
    'INTERMEDIATE',
    50,
    'SCHEDULED'
);

-- DAY 3: SYSDATE + 2
INSERT INTO sessions (
    title, description, session_code, session_date, 
    start_time, end_time, room_id, speaker_id, 
    track, level, max_attendees, status
)
VALUES (
    'The Future is Now: Database AI Integration',
    'Closing keynote exploring AI integration with databases, machine learning in SQL, and the future of intelligent data management.',
    'KEY002',
    TRUNC(SYSDATE) + 2,
    TO_TIMESTAMP(TRUNC(SYSDATE + 2) || ' 16:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_TIMESTAMP(TRUNC(SYSDATE + 2) || ' 17:00:00', 'DD-MON-RR HH24:MI:SS'),
    1, -- Grand Ballroom A
    6, -- David Kim
    'KEYNOTE',
    'ALL',
    500,
    'SCHEDULED'
);

PROMPT   ... 12 sessions inserted

-- ============================================================================
-- Insert Sample Attendees
-- ============================================================================
PROMPT
PROMPT Inserting sample attendees...

INSERT INTO attendees (first_name, last_name, email, company, job_title, status)
VALUES ('John', 'Smith', 'john.smith@example.com', 'Acme Corp', 'Database Administrator', 'CHECKED_IN');

INSERT INTO attendees (first_name, last_name, email, company, job_title, status)
VALUES ('Maria', 'Garcia', 'maria.garcia@example.com', 'Tech Solutions Inc', 'Senior Developer', 'CHECKED_IN');

INSERT INTO attendees (first_name, last_name, email, company, job_title, status)
VALUES ('Ahmed', 'Hassan', 'ahmed.hassan@example.com', 'Global Systems', 'Application Architect', 'REGISTERED');

INSERT INTO attendees (first_name, last_name, email, company, job_title, status)
VALUES ('Jennifer', 'Lee', 'jennifer.lee@example.com', 'DataTech Solutions', 'Team Lead', 'REGISTERED');

INSERT INTO attendees (first_name, last_name, email, company, job_title, status)
VALUES ('Carlos', 'Santos', 'carlos.santos@example.com', 'Innovation Labs', 'Full Stack Developer', 'REGISTERED');

INSERT INTO attendees (first_name, last_name, email, company, job_title, status)
VALUES ('Anna', 'Kowalski', 'anna.kowalski@example.com', 'Enterprise Software Co', 'Software Engineer', 'CHECKED_IN');

INSERT INTO attendees (first_name, last_name, email, company, job_title, status)
VALUES ('Wei', 'Zhang', 'wei.zhang@example.com', 'Cloud Dynamics', 'Solutions Architect', 'REGISTERED');

INSERT INTO attendees (first_name, last_name, email, company, job_title, status)
VALUES ('Sophie', 'Dubois', 'sophie.dubois@example.com', 'Digital Ventures', 'Project Manager', 'REGISTERED');

INSERT INTO attendees (first_name, last_name, email, company, job_title, status)
VALUES ('Raj', 'Sharma', 'raj.sharma@example.com', 'Tech Innovators', 'Lead Developer', 'CHECKED_IN');

INSERT INTO attendees (first_name, last_name, email, company, job_title, status)
VALUES ('Emma', 'Johnson', 'emma.johnson@example.com', 'Software Systems Ltd', 'Business Analyst', 'REGISTERED');

PROMPT   ... 10 attendees inserted

-- ============================================================================
-- Register attendees for sessions
-- ============================================================================
PROMPT
PROMPT Registering attendees for sessions...

-- Register multiple attendees for the keynote
INSERT INTO attendee_sessions (attendee_id, session_id, attended)
SELECT a.attendee_id, s.session_id, 'Y'
FROM attendees a
CROSS JOIN sessions s
WHERE s.session_code = 'KEY001'
AND a.attendee_id <= 5;

-- Register for workshop
INSERT INTO attendee_sessions (attendee_id, session_id, attended)
VALUES (1, (SELECT session_id FROM sessions WHERE session_code = 'WS201'), 'N');

INSERT INTO attendee_sessions (attendee_id, session_id, attended)
VALUES (2, (SELECT session_id FROM sessions WHERE session_code = 'WS201'), 'N');

INSERT INTO attendee_sessions (attendee_id, session_id, attended)
VALUES (3, (SELECT session_id FROM sessions WHERE session_code = 'WS201'), 'N');

-- Register for "Building APEX Without the Builder" session
INSERT INTO attendee_sessions (attendee_id, session_id, attended)
SELECT a.attendee_id, s.session_id, 'N'
FROM attendees a
CROSS JOIN sessions s
WHERE s.session_code = 'S204'
AND a.attendee_id <= 8;

-- Register for various other sessions
INSERT INTO attendee_sessions (attendee_id, session_id, attended)
VALUES (1, (SELECT session_id FROM sessions WHERE session_code = 'S101'), 'N');

INSERT INTO attendee_sessions (attendee_id, session_id, attended)
VALUES (4, (SELECT session_id FROM sessions WHERE session_code = 'S102'), 'N');

INSERT INTO attendee_sessions (attendee_id, session_id, attended)
VALUES (5, (SELECT session_id FROM sessions WHERE session_code = 'S103'), 'N');

PROMPT   ... Attendee registrations created

COMMIT;

-- ============================================================================
-- Display Summary Statistics
-- ============================================================================
PROMPT
PROMPT ========================================
PROMPT Data Loading Summary
PROMPT ========================================

SELECT 'Speakers' as entity, COUNT(*) as count FROM speakers
UNION ALL
SELECT 'Rooms', COUNT(*) FROM rooms
UNION ALL
SELECT 'Sessions', COUNT(*) FROM sessions
UNION ALL
SELECT 'Attendees', COUNT(*) FROM attendees
UNION ALL
SELECT 'Registrations', COUNT(*) FROM attendee_sessions;

PROMPT
PROMPT Sample data loaded successfully!
PROMPT ========================================
PROMPT
PROMPT Quick checks:
PROMPT   - Today's sessions: SELECT * FROM v_todays_sessions;
PROMPT   - Session details: SELECT * FROM v_session_details;
PROMPT   - Room utilization: SELECT room_name, COUNT(*) FROM sessions s JOIN rooms r ON s.room_id = r.room_id GROUP BY room_name;
PROMPT ========================================
