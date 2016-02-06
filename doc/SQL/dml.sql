-- Empty any existing test data.
use online_test_exam_maker;

delete from test_questions;
delete from user_tests;
delete from question_choices;
delete from questions;
delete from choices;
delete from grades;
delete from test_attempts;
delete from tests;
delete from users;

-- Insert users.
insert into users values ('user1', 'name1', 'hash1');
insert into users values ('user2', 'name2', 'hash2');
insert into users values ('user3', 'name3', 'hash3');
insert into users values ('user4', 'name4', 'hash4');
insert into users values ('user5', 'name5', 'hash5');

-- Insert tests.
insert into tests values ('0403c9f1-b0ad-11e5-a708-5cf9dd3eb194', 'test1', 'this is the description of test1.');
insert into tests values ('0403c9f1-b0ad-11e5-a709-5cf9dd3eb194', 'test2', 'this is the description of test2.');
insert into tests values ('0403c9f1-b0ad-11e5-a710-5cf9dd3eb194', 'test3', 'this is the description of test3.');
insert into tests values ('0403c9f1-b0ad-11e5-a711-5cf9dd3eb194', 'test4', 'this is the description of test4.');
insert into tests values ('0403c9f1-b0ad-11e5-a712-5cf9dd3eb194', 'test5', 'this is the description of test5.');
insert into tests values ('0403c9f1-b0ad-11e5-a713-5cf9dd3eb194', 'test6', 'this is the description of test6.');
insert into tests values ('0403c9f1-b0ad-11e5-a714-5cf9dd3eb194', 'test7', 'this is the description of test7.');
insert into tests values ('0403c9f1-b0ad-11e5-a715-5cf9dd3eb194', 'test8', 'this is the description of test8.');
insert into tests values ('0403c9f1-b0ad-11e5-a716-5cf9dd3eb194', 'test9', 'this is the description of test9.');
insert into tests values ('0403c9f1-b0ad-11e5-a717-5cf9dd3eb194', 'test10', 'this is the description of test10.');

-- Insert choices.
insert into choices values ('0403c9f1-b0ad-11e6-a708-5cf9dd3eb194', 'blue');
insert into choices values ('0403c9f1-b0ad-11e7-a708-5cf9dd3eb194', 'red');
insert into choices values ('0403c9f1-b0ad-11e8-a708-5cf9dd3eb194', 'white');
insert into choices values ('0403c9f1-b0ad-11e9-a708-5cf9dd3eb194', 'there\'s no color');
insert into choices values ('0403c9f1-b0ad-11f0-a708-5cf9dd3eb194', 'east');
insert into choices values ('0403c9f1-b0ad-11f1-a708-5cf9dd3eb194', 'west');
insert into choices values ('0403c9f1-b0ad-11f2-a708-5cf9dd3eb194', 'north');
insert into choices values ('0403c9f1-b0ad-11f3-a708-5cf9dd3eb194', 'south');
insert into choices values ('0403c9f1-b0ad-11f4-a708-5cf9dd3eb194', 'fourteen');
insert into choices values ('0403c9f1-b0ad-11f5-a708-5cf9dd3eb194', 'thirteen');
insert into choices values ('0403c9f1-b0ad-11f6-a708-5cf9dd3eb194', 'five nine');
insert into choices values ('0403c9f1-b0ad-11f7-a708-5cf9dd3eb194', 'fivenine');
insert into choices values ('0403c9f1-b0ad-11f8-a708-5cf9dd3eb194', 'Albert Einstein');
insert into choices values ('0403c9f1-b0ad-11f9-a708-5cf9dd3eb194', 'Dr. A.P.J. Abdul Kalam');
insert into choices values ('0403c9f1-b0ad-11g0-a708-5cf9dd3eb194', 'Pranab Mukherjee');
insert into choices values ('0403c9f1-b0ad-11g1-a708-5cf9dd3eb194', 'George W. Bush');
insert into choices values ('0403c9f1-b0ad-11g2-a708-5cf9dd3eb194', 'Five');
insert into choices values ('0403c9f1-b0ad-11g3-a708-5cf9dd3eb194', 'Four');
insert into choices values ('0403c9f1-b0ad-11g4-a708-5cf9dd3eb194', 'Six');
insert into choices values ('0403c9f1-b0ad-11g5-a708-5cf9dd3eb194', 'Three');
insert into choices values ('0403c9f1-b0ad-11g6-a708-5cf9dd3eb194', 'Mercury');
insert into choices values ('0403c9f1-b0ad-11g7-a708-5cf9dd3eb194', 'Mars');
insert into choices values ('0403c9f1-b0ad-11g8-a708-5cf9dd3eb194', 'Moon');
insert into choices values ('0403c9f1-b0ad-11g9-a708-5cf9dd3eb194', 'Venus');
insert into choices values ('0403c9f1-b0ad-11h0-a708-5cf9dd3eb194', 'Java');
insert into choices values ('0403c9f1-b0ad-11h1-a708-5cf9dd3eb194', 'C++');
insert into choices values ('0403c9f1-b0ad-11h2-a708-5cf9dd3eb194', 'C');
insert into choices values ('0403c9f1-b0ad-11h3-a708-5cf9dd3eb194', 'Scala');
insert into choices values ('0403c9f1-b0ad-11h4-a708-5cf9dd3eb194', '1000');
insert into choices values ('0403c9f1-b0ad-11h5-a708-5cf9dd3eb194', '1231');
insert into choices values ('0403c9f1-b0ad-11h6-a708-5cf9dd3eb194', '5607');
insert into choices values ('0403c9f1-b0ad-11h7-a708-5cf9dd3eb194', 'Unknown');
insert into choices values ('0403c9f1-b0ad-11h8-a708-5cf9dd3eb194', 'Orlando');
insert into choices values ('0403c9f1-b0ad-11h9-a708-5cf9dd3eb194', 'Miami');
insert into choices values ('0403c9f1-b0ad-11i0-a708-5cf9dd3eb194', 'Jacksonville');
insert into choices values ('0403c9f1-b0ad-11i1-a708-5cf9dd3eb194', 'Tallahassee');


-- Insert questions.
insert into questions values ('0403c9f1-b0ak-11e5-a708-5cf9dd3eb210', 'Which of these programming languages is the oldest?', '0403c9f1-b0ad-11h2-a708-5cf9dd3eb194');
insert into questions values ('0403c9f1-b0ad-11e5-a708-5cf9dd3eb210', 'What\'s sky\'s usual color?', '0403c9f1-b0ad-11e6-a708-5cf9dd3eb194');
insert into questions values ('0403c9f1-b0af-11e5-a708-5cf9dd3eb210', 'What does five plus nine equal?', '0403c9f1-b0ad-11f4-a708-5cf9dd3eb194');
insert into questions values ('0403c9f1-b0ag-11e5-a708-5cf9dd3eb210', 'Which Indian President was also a Scientist?', '0403c9f1-b0ad-11f9-a708-5cf9dd3eb194');
insert into questions values ('0403c9f1-b0ae-11e5-a708-5cf9dd3eb210', 'Which direction does Sun rise?', '0403c9f1-b0ad-11f0-a708-5cf9dd3eb194');
insert into questions values ('0403c9f1-b0ah-11e5-a708-5cf9dd3eb210', 'Under how many categories are the Noble prizes awarded?', '0403c9f1-b0ad-11g2-a708-5cf9dd3eb194');
insert into questions values ('0403c9f1-b0ai-11e5-a708-5cf9dd3eb210', 'Which planet is nearest to Earth?', '0403c9f1-b0ad-11g9-a708-5cf9dd3eb194');
insert into questions values ('0403c9f1-b0aj-11e5-a708-5cf9dd3eb210', 'Which language\'s API does Android use?', '0403c9f1-b0ad-11h0-a708-5cf9dd3eb194');
insert into questions values ('0403c9f1-b0al-11e5-a708-5cf9dd3eb210', 'How many people did it take to build The Great Wall Of China?', '0403c9f1-b0ad-11h7-a708-5cf9dd3eb194');
insert into questions values ('0403c9f1-b0am-11e5-a708-5cf9dd3eb210', 'What\'s the capital of Florida State (USA)?', '0403c9f1-b0ad-11i1-a708-5cf9dd3eb194');

-- Insert question-choices.

insert into question_choices values ('0403c9f1-b0ak-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11h0-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ak-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11h1-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ak-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11h2-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ak-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11h3-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ad-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11e6-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ad-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11e7-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ad-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11e8-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ad-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11e9-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0af-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11f4-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0af-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11f5-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0af-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11f6-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0af-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11f7-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ag-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11f8-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ag-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11f9-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ag-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11g0-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ag-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11g1-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ae-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11f0-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ae-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11f1-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ae-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11f2-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ae-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11f3-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ah-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11g2-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ah-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11g3-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ah-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11g4-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ah-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11g5-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ai-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11g6-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ai-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11g7-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ai-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11g8-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0ai-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11g9-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0aj-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11h0-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0aj-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11h1-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0aj-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11h2-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0aj-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11h3-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0al-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11h4-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0al-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11h5-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0al-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11h6-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0al-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11h7-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0am-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11h8-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0am-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11h9-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0am-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11i0-a708-5cf9dd3eb194');
insert into question_choices values ('0403c9f1-b0am-11e5-a708-5cf9dd3eb210', '0403c9f1-b0ad-11i1-a708-5cf9dd3eb194');

-- Insert grades.

insert into grades values ('O', 90, 'success');
insert into grades values ('A', 80, 'success');
insert into grades values ('B', 70, 'success');
insert into grades values ('C', 60, 'success');
insert into grades values ('D', 50, 'success');
insert into grades values ('F', 40, 'failure');

-- Insert test-attempts.

insert into test_attempts values ('0403c9f2-b0ad-11e5-a708-5cf9dd3eb194', '0403c9f1-b0ad-11e5-a708-5cf9dd3eb194', 'user1', 'O', now());
insert into test_attempts values ('0403c9f3-b0ad-11e5-a708-5cf9dd3eb194', '0403c9f1-b0ad-11e5-a709-5cf9dd3eb194', 'user2', 'O', now());
insert into test_attempts values ('0403c9f4-b0ad-11e5-a708-5cf9dd3eb194', '0403c9f1-b0ad-11e5-a710-5cf9dd3eb194', 'user3', 'O', now());
insert into test_attempts values ('0403c9f5-b0ad-11e5-a708-5cf9dd3eb194', '0403c9f1-b0ad-11e5-a711-5cf9dd3eb194', 'user4', 'O', now());
insert into test_attempts values ('0403c9f6-b0ad-11e5-a708-5cf9dd3eb194', '0403c9f1-b0ad-11e5-a712-5cf9dd3eb194', 'user5', 'O', now());
insert into test_attempts values ('0403c9f7-b0ad-11e5-a708-5cf9dd3eb194', '0403c9f1-b0ad-11e5-a713-5cf9dd3eb194', 'user1', 'A', now());
insert into test_attempts values ('0403c9f8-b0ad-11e5-a708-5cf9dd3eb194', '0403c9f1-b0ad-11e5-a714-5cf9dd3eb194', 'user2', 'A', now());
insert into test_attempts values ('0403c9f9-b0ad-11e5-a708-5cf9dd3eb194', '0403c9f1-b0ad-11e5-a715-5cf9dd3eb194', 'user3', 'A', now());
insert into test_attempts values ('0403c9g0-b0ad-11e5-a708-5cf9dd3eb194', '0403c9f1-b0ad-11e5-a716-5cf9dd3eb194', 'user4', 'A', now());
insert into test_attempts values ('0403c9g1-b0ad-11e5-a708-5cf9dd3eb194', '0403c9f1-b0ad-11e5-a717-5cf9dd3eb194', 'user5', 'A', now());

-- Insert user-tests.

insert into user_tests values ('user1', '0403c9f1-b0ad-11e5-a708-5cf9dd3eb194', now());
insert into user_tests values ('user1', '0403c9f1-b0ad-11e5-a709-5cf9dd3eb194', now());
insert into user_tests values ('user2', '0403c9f1-b0ad-11e5-a709-5cf9dd3eb194', now());
insert into user_tests values ('user3', '0403c9f1-b0ad-11e5-a708-5cf9dd3eb194', now());
insert into user_tests values ('user3', '0403c9f1-b0ad-11e5-a709-5cf9dd3eb194', now());
insert into user_tests values ('user3', '0403c9f1-b0ad-11e5-a710-5cf9dd3eb194', now());
insert into user_tests values ('user5', '0403c9f1-b0ad-11e5-a710-5cf9dd3eb194', now());

-- Insert test-questions.

insert into test_questions values ('0403c9f1-b0ad-11e5-a708-5cf9dd3eb194', '0403c9f1-b0ad-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a708-5cf9dd3eb194', '0403c9f1-b0ae-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a708-5cf9dd3eb194', '0403c9f1-b0af-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a708-5cf9dd3eb194', '0403c9f1-b0ag-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a708-5cf9dd3eb194', '0403c9f1-b0ah-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a708-5cf9dd3eb194', '0403c9f1-b0ai-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a708-5cf9dd3eb194', '0403c9f1-b0aj-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a708-5cf9dd3eb194', '0403c9f1-b0ak-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a708-5cf9dd3eb194', '0403c9f1-b0al-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a708-5cf9dd3eb194', '0403c9f1-b0am-11e5-a708-5cf9dd3eb210');

insert into test_questions values ('0403c9f1-b0ad-11e5-a709-5cf9dd3eb194', '0403c9f1-b0ad-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a709-5cf9dd3eb194', '0403c9f1-b0ah-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a709-5cf9dd3eb194', '0403c9f1-b0ai-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a709-5cf9dd3eb194', '0403c9f1-b0al-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a709-5cf9dd3eb194', '0403c9f1-b0am-11e5-a708-5cf9dd3eb210');

insert into test_questions values ('0403c9f1-b0ad-11e5-a710-5cf9dd3eb194', '0403c9f1-b0ad-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a710-5cf9dd3eb194', '0403c9f1-b0af-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a710-5cf9dd3eb194', '0403c9f1-b0ah-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a710-5cf9dd3eb194', '0403c9f1-b0aj-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a710-5cf9dd3eb194', '0403c9f1-b0al-11e5-a708-5cf9dd3eb210');

insert into test_questions values ('0403c9f1-b0ad-11e5-a711-5cf9dd3eb194', '0403c9f1-b0ah-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a711-5cf9dd3eb194', '0403c9f1-b0ai-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a711-5cf9dd3eb194', '0403c9f1-b0aj-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a711-5cf9dd3eb194', '0403c9f1-b0ak-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a711-5cf9dd3eb194', '0403c9f1-b0al-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a711-5cf9dd3eb194', '0403c9f1-b0am-11e5-a708-5cf9dd3eb210');

insert into test_questions values ('0403c9f1-b0ad-11e5-a712-5cf9dd3eb194', '0403c9f1-b0af-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a712-5cf9dd3eb194', '0403c9f1-b0ag-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a712-5cf9dd3eb194', '0403c9f1-b0ah-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a712-5cf9dd3eb194', '0403c9f1-b0ai-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a712-5cf9dd3eb194', '0403c9f1-b0aj-11e5-a708-5cf9dd3eb210');

insert into test_questions values ('0403c9f1-b0ad-11e5-a713-5cf9dd3eb194', '0403c9f1-b0ad-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a713-5cf9dd3eb194', '0403c9f1-b0ag-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a713-5cf9dd3eb194', '0403c9f1-b0aj-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a713-5cf9dd3eb194', '0403c9f1-b0ak-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a713-5cf9dd3eb194', '0403c9f1-b0am-11e5-a708-5cf9dd3eb210');

insert into test_questions values ('0403c9f1-b0ad-11e5-a714-5cf9dd3eb194', '0403c9f1-b0ai-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a714-5cf9dd3eb194', '0403c9f1-b0aj-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a714-5cf9dd3eb194', '0403c9f1-b0ak-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a714-5cf9dd3eb194', '0403c9f1-b0al-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a714-5cf9dd3eb194', '0403c9f1-b0am-11e5-a708-5cf9dd3eb210');

insert into test_questions values ('0403c9f1-b0ad-11e5-a715-5cf9dd3eb194', '0403c9f1-b0ad-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a715-5cf9dd3eb194', '0403c9f1-b0ai-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a715-5cf9dd3eb194', '0403c9f1-b0aj-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a715-5cf9dd3eb194', '0403c9f1-b0ak-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a715-5cf9dd3eb194', '0403c9f1-b0al-11e5-a708-5cf9dd3eb210');

insert into test_questions values ('0403c9f1-b0ad-11e5-a716-5cf9dd3eb194', '0403c9f1-b0ae-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a716-5cf9dd3eb194', '0403c9f1-b0af-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a716-5cf9dd3eb194', '0403c9f1-b0ai-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a716-5cf9dd3eb194', '0403c9f1-b0aj-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a716-5cf9dd3eb194', '0403c9f1-b0ak-11e5-a708-5cf9dd3eb210');

insert into test_questions values ('0403c9f1-b0ad-11e5-a717-5cf9dd3eb194', '0403c9f1-b0ad-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a717-5cf9dd3eb194', '0403c9f1-b0ae-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a717-5cf9dd3eb194', '0403c9f1-b0af-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a717-5cf9dd3eb194', '0403c9f1-b0al-11e5-a708-5cf9dd3eb210');
insert into test_questions values ('0403c9f1-b0ad-11e5-a717-5cf9dd3eb194', '0403c9f1-b0am-11e5-a708-5cf9dd3eb210');
