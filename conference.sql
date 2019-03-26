-- create the database for the conference 
CREATE DATABASE conferencedb; 
USE conferencedb;

-- type of attendee to categorize attendees 
CREATE TABLE AttendeeTypes (
    AttendeeType varchar(20) NOT NULL,
    AttendanceCost decimal(13,2) NOT NULL,
    PRIMARY KEY (AttendeeType)
);

-- attendee has an attendee type 
CREATE TABLE Attendees (
    ID int NOT NULL, -- PK
    FirstName varchar(20) NOT NULL,
    LastName varchar(20) NOT NULL,
    AttendeeType varchar(20), -- an attendee has a type 
    PRIMARY KEY (ID),
    CONSTRAINT FOREIGN KEY (AttendeeType) 
    REFERENCES AttendeeTypes (AttendeeType) 
    ON DELETE SET NULL 
);

-- students may decided to stay in a room 
CREATE TABLE RoomingArrangements (
    -- StudentID int NOT NULL, -- multi value
    RoomNumber int NOT NULL, -- PK
    RoomCapacity int, -- 1 to 3 
    NumberOfBeds int NOT NULL, -- 1 or 2 
    PRIMARY KEY (RoomNumber)
   -- FOREIGN KEY (StudentID) REFERENCES ATTENDEES(ID) ON DELETE CASCADE
);

-- attendees that are students 
CREATE TABLE StudentAttendees (
    ID int NOT NULL, -- FK
    FirstName varchar(20) NOT NULL, -- PK
    LastName varchar(20) NOT NULL, -- PK
    RoomNumber int, -- FK
    PRIMARY KEY (FirstName, LastName), 
    FOREIGN KEY (RoomNumber) REFERENCES RoomingArrangements(RoomNumber) ON DELETE SET NULL,
    FOREIGN KEY (ID) REFERENCES Attendees(ID) ON DELETE CASCADE
);

-- Professionals are attendees of conference 
CREATE TABLE ProfessionalAttendees (
    ID int NOT NULL, -- FK
    FirstName varchar(20),
    LastName varchar(20),
    Industry varchar(20), -- added info for fun 
    PRIMARY KEY (FirstName, LastName), 
    FOREIGN KEY (ID) REFERENCES Attendees(ID)
);

-- Speakers are attendees of conference 
CREATE TABLE SpeakerAttendees (
    ID int NOT NULL, -- PK
    FirstName varchar(20) NOT NULL,
    LastName varchar(20) NOT NULL,
    SessionSpeakingAt varchar(20) NOT NULL,    
    PRIMARY KEY (FirstName, LastName),
    FOREIGN KEY (ID) REFERENCES Attendees(ID)
);

-- Sponsors will have a sponsor level, ranking their sponsorship
CREATE TABLE SponsorLevels (
    SponsorLevel varchar(20) NOT NULL, 
    FinancialSupport decimal(13,2), 
    EmailsAllowed int,
    PRIMARY KEY (SponsorLevel)
);

-- sponsors are allowed to have job postings 
CREATE TABLE JobPostings (      -- for sponsors to post ads for jobs 
    CompanyName varchar(20),
    JobTitle varchar(20) NOT NULL, -- PK
    PayRatePerYear varchar(20),
    City varchar(20),
    Province varchar(20), 
    PRIMARY KEY (JobTitle)
);

-- Companies can sponsor the conference 
CREATE TABLE Sponsors (
    CompanyName varchar(20) NOT NULL, -- PK
    SponsorLevel varchar(20), -- referenced from sponsor levels
    JobPosting varchar(20), -- multivalued
    EmailsSent int, -- derived from job postings to keep track of number of emails sent
    PRIMARY KEY (CompanyName),
    FOREIGN KEY (JobPosting) REFERENCES JobPostings(JobTitle),
    FOREIGN KEY (SponsorLevel) REFERENCES SponsorLevels(SponsorLevel) on delete cascade
);
-- I don't think we need this bc we have the Sponsors already attached as an attendee type
-- CREATE TABLE SponsorAttendees (
--     ID int NOT NULL, -- PK
--     FirstName varchar(20) NOT NULL,
--     LastName varchar(20) NOT NULL,
--     Company varchar(20) NOT NULL,
--     PRIMARY KEY (FirstName, LastName),
--     FOREIGN KEY (Company) REFERENCES Sponsors(CompanyName)
-- ); 

-- speaker speaks at a session 
CREATE TABLE ScheduleInformation (
    SessionName varchar(20) NOT NULL,
    SpeakerID int NOT NULL, -- muti values 
    StartTime time,
    EndTime time,
    RoomLocation varchar(20), 
    SessionDay date, 
    PRIMARY KEY (StartTime, RoomLocation),
    FOREIGN KEY (SpeakerID) REFERENCES Attendees (ID) ON DELETE CASCADE
);

-- CREATE TABLE SpeakerAttendees (
--     SpeakerID int NOT NULL,
--     SessionName varchar(20) NOT NULL,
--     PRIMARY KEY (SpeakerID),
--     FOREIGN KEY (SpeakerID) REFERENCES Attendee (ID) ON DELETE CASCADE
-- );

CREATE TABLE OrganizingCommittee (
    SubCommitteeName varchar(20) NOT NULL,
    ChairFirstName varchar(20),
    ChairLastName varchar(20),
    PRIMARY KEY (SubCommitteeName)
);


-- switch order of committees and member table
CREATE TABLE CommitteeMember (
    MemberID int NOT NULL, 
    FirstName varchar(20) NOT NULL,
    LastName varchar(20) NOT NULL,
    NumberOfCommittees int, -- derived from subcommittee name 
    PRIMARY KEY (MemberID)
);

CREATE TABLE OnCommittee (
    MemberID int NOT NULL, 
    SubCommitteeName varchar(20), -- multiple entries 
    FOREIGN KEY (SubCommitteeName) REFERENCES OrganizingCommittee(SubCommitteeName),
    FOREIGN KEY (MemberID) REFERENCES CommitteeMember(MemberID)
);


