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

insert into StudentAttendees values ('20', '2');
insert into StudentAttendees values ('26', '2');
insert into StudentAttendees values ('27', '3');
insert into StudentAttendees values ('28', '3');

insert into ProfessionalAttendees values ('21', 'Computers');
insert into ProfessionalAttendees values ('29', 'Entertainment');
insert into ProfessionalAttendees values ('30', 'Actor');
insert into ProfessionalAttendees values ('31', 'CEO');
insert into ProfessionalAttendees values ('32', 'World Leader');

insert into Sponsors values ('BuzzFeed Unsolved', 'Gold', '2');
insert into Sponsors values ('Netflix', 'Silver', '3');
insert into Sponsors values ('Uber', 'Platinum', '5');
insert into Sponsors values ('Amazon', 'Bronze', '0');

insert into JobPostings values ('Video Producer', 'Buzzfeed Unsolved', '20000', 'Los Angeles', 'California');
insert into JobPostings values ('Senior Developer', 'Netflix', '100000', 'San Francisco', 'California');
insert into JobPostings values ('CEO', 'Uber', '2000000', 'New York City', 'New York');
insert into JobPostings values ('Human Resources', 'Amazon', '50000', 'Toronto', 'Ontario');
insert into JobPostings values ('Driver', 'Uber', '20000', 'New York City', 'New York');


insert into SponsorAttendees values ('23', 'BuzzFeed Unsolved');
insert into SponsorAttendees values ('33', 'Netflix');
insert into SponsorAttendees values ('34', 'Uber');
insert into SponsorAttendees values ('35', 'Amazon');
insert into SponsorAttendees values ('36', 'Netflix');
insert into SponsorAttendees values ('37', 'Uber');

insert into ScheduleInformation values ('QGIC', '10:00:00', '11:00:00', '9', '2020-12-24');
insert into ScheduleInformation values ('Ghosts', '11:00:00', '12:00:00', '13', '2020-12-25');

insert into SpeakerAttendees values ('22', 'QGIC');
insert into SpeakerAttendees values ('24', 'Ghosts');

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
set RoomingArrangements.RoomCapacity = (select count(ID) 
                                        from StudentAttendees 
                                        where StudentAttendees.RoomNumber = RoomingArrangements.RoomNumber 
                                        group by RoomNumber);
update RoomingArrangements 
set RoomCapacity = 0
where isnull(RoomCapacity);


-- to update the number of committees an individual committee member is apart of 
update CommitteeMember
set CommitteeMember.NumberOfCommittees = (select count(CommitteeMember.MemberID) num
                                        from OnCommittee
                                        where CommitteeMember.MemberID = OnCommittee.MemberID
                                        group by OnCommittee.MemberID);


