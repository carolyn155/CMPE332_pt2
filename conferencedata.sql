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
insert into Attendees values ('23', 'Shane', 'Madej', 'Sponsor');
insert into Attendees values('24', 'Teej', 'Camera', 'Speaker');
insert into Attendees values ('25', 'Miley', 'Cyrus', 'Student');
insert into Attendees values ('26', 'Justin', 'Timberlake', 'Student');
insert into Attendees values ('27', 'Kanye', 'West', 'Student');
insert into Attendees values ('28', 'Kimberley', 'Kardashian', 'Student');

insert into RoomingArrangements values ('2', '', '2');
insert into RoomingArrangements values ('3', '', '1');

insert into StudentAttendees values ('20', 'Cache', 'Angus', '2');
insert into StudentAttendees values ('25', 'Miley', 'Cyrus', '2');
insert into StudentAttendees values ('26', 'Justin', 'Timberlake', '2');
insert into StudentAttendees values ('27', 'Kanye', 'West', '3');
insert into StudentAttendees values ('28', 'Kimberley', 'Kardashian', '3');

insert into ProfessionalAttendees values ('21', 'Carolyn', 'Day', 'Computers');

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

insert into ScheduleInformation values ('QGIC', '22', '10:00:00', '11:00:00', '9');
insert into ScheduleInformation values ('Ghosts', '24', '11:00:00', '12:00:00', '13');

insert into OrganizingCommittee values ('Setup','Tom Brady');
insert into OrganizingCommittee values ('Logistics','Charlie Chaplin');
insert into OrganizingCommittee values ('Speakers','Barack Obama');
insert into OrganizingCommittee values ('Takedown', 'Ryan Bergara');

insert into CommitteeMember values ('Tom', 'Brady', 'Setup', '1');
insert into CommitteeMember values ('Ryan', 'Bergara', 'Takedown', '1');
insert into CommitteeMember values ('Barack', 'Obama', 'Speakers', '1');
insert into CommitteeMember values ('Charlie', 'Chaplin', 'Logistics', '1');
-- insert into CommitteeMember values ('Ryan', 'Bergara', 'Setup', '2');

-- to update the room capacity from the number of students staying in one room show in StudentAttendees
update RoomingArrangements 
set RoomingArrangements.RoomCapacity = (select count(ID) roomcap 
                                        from StudentAttendees 
                                        where StudentAttendees.RoomNumber = RoomingArrangements.RoomNumber 
                                        group by RoomNumber);

