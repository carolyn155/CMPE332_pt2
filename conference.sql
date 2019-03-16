-- create the database for the conference 
CREATE DATABASE conferencedb; 

-- type of attendee to categorize attendees 
CREATE TABLE AttendeeTypes (
    AttendeeType varchar(20) NOT NULL,
    AttendanceCost decimal(13,2) NOT NULL
);

-- attendee has an attendee type 
CREATE TABLE Attendees (
    ID int NOT NULL, -- PK
    FirstName varchar(20) NOT NULL,
    LastName varchar(20) NOT NULL,
    AttendeeType varchar(20), -- an attendee has a type 
    PRIMARY KEY (ID),
    FOREIGN KEY (AttendeeType) REFERENCES AttendeeTypes(AttendeeType)
);

-- students may decided to stay in a room 
CREATE TABLE RoomingArrangements (
    StudentNames varchar(20), -- multi value
    RoomNumber int NOT NULL, -- PK
    RoomCapacity int NOT NULL,
    NumberOfBeds int NOT NULL,
    PRIMARY KEY (RoomNumber)
);

-- attendees that are students 
CREATE TABLE StudentAttendees (
    ID int NOT NULL, -- FK
    FirstName varchar(20) NOT NULL, -- PK
    LastName varchar(20) NOT NULL, -- PK
    RoomNumber int, -- FK
    PRIMARY KEY (FirstName, LastName), 
    FOREIGN KEY (RoomNumber) REFERENCES RoomingArrangements(RoomNumber),
    FOREIGN KEY (ID) REFERENCES Attendees(ID)
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
    EmailsAllowed int
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
    FOREIGN KEY (SponsorLevel) REFERENCES SponsorLevels(SponsorLevel)
);
--I don't think we need this bc we have the Sponsors already attached as an attendee type
/* CREATE TABLE SponsorAttendees (
    ID int NOT NULL, -- PK
    FirstName varchar(20) NOT NULL,
    LastName varchar(20) NOT NULL,
    Company varchar(20) NOT NULL,
    PRIMARY KEY (FirstName, LastName),
    FOREIGN KEY (Company) REFERENCES Sponsors(CompanyName)
); */ 

-- speaker speaks at a session 
CREATE TABLE ScheduleInformation (
    SessionName varchar(20) NOT NULL,
    SpeakerID int NOT NULL, -- muti values 
    StartTime time(4),
    EndTime time(4),
    RoomLocation varchar(20), 
    PRIMARY KEY (SessionName),
    FOREIGN KEY (SpeakerID) REFERENCES SpeakerAttendees(ID),
    FOREIGN KEY (SessionName) REFERENCES SpeakerAttendees(SessionSpeakingAt)
);

CREATE TABLE OrganizingCommittee (
    SubCommitteeName varchar(20),
    Chair varchar(20),
    PRIMARY KEY (Chair)
);

CREATE TABLE CommitteeMember (
    FirstName varchar(20) NOT NULL,
    LastName varchar(20) NOT NULL,
    SubCommitteeName varchar(20), -- multiple entries 
    NumberOfCommittees int, -- derived from subcommittee name 
    PRIMARY KEY (FirstName, LastName)
    -- FOREIGN KEY (SubCommitteeName) REFERENCES OrganizingCommittee(SubCommitteeName)
);


delete from Attendees;
delete from SponsorLevels;
delete from StudentAttendees;
delete from SpeakerAttendees;
delete from ProfessionalAttendees;
delete from Sponsors;
delete from RoomingArrangements;
delete from AttendeeTypes;
delete from JobPostings;
delete from ScheduleInformation;
delete from OrganizationCommittee;
delete from CommitteeMember;
insert into SponsorLevels values ('Gold', '5000.0', '2' );
insert into SponsorLevels values ('Silver', '3000.0', '1');
insert into SponsorLevels values ('Platinum', '10000.0', '3');
insert into SponsorLevels values ('Bronze', '1000.0', '0');
insert into Attendees values ('20', 'Cache', 'Angus', 'StudentAttedees');
insert into Attendees values ('21', 'Carolyn', 'Day', 'ProfessionalAttendees');
insert into Attendees values ('22', 'Ted', 'Munn', 'SpeakerAttendees');
insert into Attendees values ('23', 'Shane', 'Madej', 'Sponsor');
insert into Attendees values('24', 'Teej', 'Camera', 'SpeakerAttendees');
insert into RoomingArrangements values ('Cache, Cache2, Cache3', '2', '3', '4');
insert into StudentAttendees values ('20', 'Cache', 'Angus', '2');
insert into ProfessionalAttendees values ('21', 'Carolyn', 'Day', 'Computers');
insert into SpeakerAttendees values ('22', 'Ted', 'Munn', 'QGIC');
insert into SpeakerAttendees values ('24', 'Teej', 'Camera', 'Ghosts');
insert into AttendeeTypes values ('StudentAttendees', '50.0');
insert into AttendeeTypes values ('ProfessionalAttendees', '100.0');
insert into AttendeeTypes values ('SpeakerAttendees', '0.0');
insert into AttendeeTypes values ('SponsorAttendees', '0.0');
insert into Sponsors values ('BuzzFeed Unsolved', 'Gold', 'Video Producer', '2');
insert into JobPostings values ('Buzzfeed Unsolved', 'Video Producer', '20000', 'Los Angeles', 'California');
insert into ScheduleInformation values ('QGIC', '22', '10:00:00', '11:00:00', '9');
insert into ScheduleInformation values ('Ghosts', '24', '11:00:00', '12:00:00', '13');
insert into OrganizingCommittee values ('Setup','Tom Brady');
insert into OrganizingCommittee values ('Takedown', 'Ryan Bergara');
insert into CommitteeMember values ('Tom', 'Brady', 'Setup', '1');
insert into CommitteeMember values ('Ryan', 'Bergara', 'Takedown, Setup', '2');


