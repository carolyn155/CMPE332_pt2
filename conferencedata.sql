use conferencedb;

delete from Attendees;
delete from SponsorLevels;
-- delete from StudentAttendees;
-- delete from SpeakerAttendees;
delete from ProfessionalAttendees;
delete from Sponsors;
delete from RoomingArrangements;
delete from AttendeeTypes;
delete from JobPostings;
delete from ScheduleInformation;
delete from OrganizingCommittee;
delete from CommitteeMember;

insert into SponsorLevels values ('Gold', '5000.0', '4' );
insert into SponsorLevels values ('Silver', '3000.0', '3');
insert into SponsorLevels values ('Platinum', '10000.0', '5');
insert into SponsorLevels values ('Bronze', '1000.0', '0');

insert into AttendeeTypes values ('Student', '50.0');
insert into AttendeeTypes values ('Professional', '100.0');
insert into AttendeeTypes values ('Speaker', '0.0');
insert into AttendeeTypes values ('Sponsor', '0.0');

insert into Attendees values ('20', 'Cache', 'Angus', 'Student');
insert into Attendees values ('21', 'Carolyn', 'Day', 'Professional');
insert into Attendees values ('22', 'Ted', 'Munn', 'Speaker');
insert into Attendees values ('23', 'Lisa', 'Kudrow', 'Sponsor');
insert into Attendees values('24', 'Teej', 'Camera', 'Speaker');
insert into Attendees values ('25', 'Miley', 'Cyrus', 'Student');
insert into Attendees values ('26', 'Justin', 'Timberlake', 'Student');
insert into Attendees values ('27', 'Kanye', 'West', 'Student');
insert into Attendees values ('28', 'Kimberley', 'Kardashian', 'Student');
insert into Attendees values ('29', 'Chris', 'Martin', 'Professional');
insert into Attendees values ('30', 'Shia', 'LaBeouf', 'Professional');
insert into Attendees values ('31', 'Rick', 'Astley', 'Professional');
insert into Attendees values ('32', 'George', 'Michael', 'Professional');
insert into Attendees values ('33', 'Courtney', 'Cox', 'Sponsor');
insert into Attendees values ('34', 'David', 'Schwimmer', 'Sponsor');
insert into Attendees values ('35', 'Jennifer', 'Aniston', 'Sponsor');
insert into Attendees values ('36', 'Matthew', 'Perry', 'Sponsor');
insert into Attendees values ('37', 'Matt', 'LeBlanc', 'Sponsor');

insert into RoomingArrangements values ('2', '', '2');
insert into RoomingArrangements values ('3', '', '1');
insert into RoomingArrangements values ('4', '', '2');
insert into RoomingArrangements values ('5', '', '1');

insert into StudentAttendees values ('20', 'Cache', 'Angus', '2');
insert into StudentAttendees values ('26', 'Justin', 'Timberlake', '2');
insert into StudentAttendees values ('27', 'Kanye', 'West', '3');
insert into StudentAttendees values ('28', 'Kimberley', 'Kardashian', '3');

insert into ProfessionalAttendees values ('21', 'Carolyn', 'Day', 'Computers');
insert into ProfessionalAttendees values ('29', 'Chris', 'Martin', 'Entertainment');
insert into ProfessionalAttendees values ('30', 'Shia', 'LaBeouf', 'Actor');
insert into ProfessionalAttendees values ('31', 'Rick', 'Astley', 'CEO');
insert into ProfessionalAttendees values ('32', 'George', 'Michael', 'World Leader');

insert into SpeakerAttendees values ('22', 'Ted', 'Munn', 'QGIC');
insert into SpeakerAttendees values ('24', 'Teej', 'Camera', 'Ghosts');

insert into JobPostings values ('Buzzfeed Unsolved', 'Video Producer', '20000', 'Los Angeles', 'California');
insert into JobPostings values ('Netflix', 'Senior Developer', '100000', 'San Francisco', 'California');
insert into JobPostings values ('Uber', 'CEO', '2000000', 'New York City', 'New York');
insert into JobPostings values ('Amazon', 'Human Resources', '50000', 'Toronto', 'Ontario');

insert into Sponsors values ('BuzzFeed Unsolved', 'Gold', 'Video Producer', '2');
insert into Sponsors values ('Netflix', 'Silver', 'Senior Developer', '3');
insert into Sponsors values ('Uber', 'Platinum', 'CEO', '5');
insert into Sponsors values ('Amazon', 'Bronze', 'Human Resources', '0');

insert into ScheduleInformation values ('QGIC', '22', '10:00:00', '11:00:00', '9', '2020-12-24');
insert into ScheduleInformation values ('Ghosts', '24', '11:00:00', '12:00:00', '13', '2020-12-25');

insert into OrganizingCommittee values ('Setup','Tom', 'Brady');
insert into OrganizingCommittee values ('Logistics','Charlie', 'Chaplin');
insert into OrganizingCommittee values ('Speakers','Barack', 'Obama');
insert into OrganizingCommittee values ('Takedown', 'Ryan', 'Bergara');

-- insert into CommitteeMember values ('1', 'Tom', 'Brady');
-- insert into CommitteeMember values ('2', 'Ryan', 'Bergara');
-- insert into CommitteeMember values ('3', 'Barack', 'Obama');
-- insert into CommitteeMember values ('4', 'Charlie', 'Chaplin');


insert into CommitteeMember values ('1', 'Tom', 'Brady', '');
insert into CommitteeMember values ('2', 'Ryan', 'Bergara', '');
insert into CommitteeMember values ('3', 'Barack', 'Obama', '');
insert into CommitteeMember values ('4', 'Charlie', 'Chaplin', '');

insert into OnCommittee values ('1', 'Setup');
insert into OnCommittee values ('2', 'Takedown');
insert into OnCommittee values ('2', 'Setup');
insert into OnCommittee values ('3', 'Speakers');
insert into OnCommittee values ('4', 'Logistics');


-- to update the room capacity from the number of students staying in one room show in StudentAttendees
update RoomingArrangements 
set RoomingArrangements.RoomCapacity = (select count(ID) roomcap 
                                        from StudentAttendees 
                                        where StudentAttendees.RoomNumber = RoomingArrangements.RoomNumber 
                                        group by RoomNumber);

-- to update the number of committees an individual committee member is apart of 
-- update CommitteeMember
set CommitteeMember.NumberOfCommittees = (select count(MemberID) num
                                        from OnCommittee
                                        where CommitteeMember.MemberID = OnCommittee.MemberID
                                        group by MemberID);



