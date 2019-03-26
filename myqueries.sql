
-- query 1 
select firstname, lastname 
from committeemember 
where subcommitteename = 'Logistics'

-- SET INSERT_ID = (select count(CommitteeMember.MemberID) num from OnCommittee, CommitteeMember where CommitteeMember.MemberID = OnCommittee.MemberID group by CommitteeMember.MemberID);


-- ALTER TABLE committeemember
-- ADD COLUMN NumberOfCommittees int GENERATED ALWAYS AS (select count(CommitteeMember.MemberID) num from OnCommittee, CommitteeMember where CommitteeMember.MemberID = OnCommittee.MemberID group by CommitteeMember.MemberID) STORED 

-- ALTER TABLE t2 ADD id INT AUTO_INCREMENT PRIMARY KEY;


-- update CommitteeMember, oncommittee
-- set CommitteeMember.NumberOfCommittees = 5
-- where CommitteeMember.MemberID = OnCommittee.MemberID


-- update CommitteeMember, oncommittee
-- set CommitteeMember.NumberOfCommittees = 
--  where CommitteeMember.MemberID = OnCommittee.MemberID

-- CREATE TABLE artists_and_works
--   SELECT artist.name, COUNT(work.artist_id) AS number_of_works
--   FROM artist LEFT JOIN work ON artist.id = work.artist_id
--   GROUP BY artist.id;