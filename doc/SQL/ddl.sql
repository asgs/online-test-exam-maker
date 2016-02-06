-- This script assumes that the necessary drop/create privileges are available to the user running it.

drop database if exists online_test_exam_maker;

create database online_test_exam_maker;

use online_test_exam_maker;

  create table `users` (
  `user_id` varchar(40),
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
  );
  
/*CREATE TRIGGER on_insert_users
  BEFORE INSERT ON users
  FOR EACH ROW
  SET new.user_id = uuid();*/
  
  create table `tests` (
  `test_id` varchar(40),
  `name` varchar(50) NOT NULL,
  `description` varchar(300) NOT NULL,
  PRIMARY KEY (`test_id`)
  );

/*CREATE TRIGGER on_insert_tests
  BEFORE INSERT ON tests
  FOR EACH ROW
  SET new.test_id = uuid();*/

  create table choices (
  `choice_id` varchar(40),
  `choice` varchar(40) NOT NULL,
  PRIMARY KEY (`choice_id`)
  );
  
/*CREATE TRIGGER on_insert_choices
  BEFORE INSERT ON choices
  FOR EACH ROW
  SET new.choice_id = uuid();*/
  
  create table questions (
  `question_id` varchar(40),
  `question` varchar(100) NOT NULL,
  `answer` varchar(40) NOT NULL,
  PRIMARY KEY (`question_id`),
  FOREIGN KEY (`answer`) REFERENCES choices(`choice_id`)
  );
  
/*CREATE TRIGGER on_insert_questions
  BEFORE INSERT ON questions
  FOR EACH ROW
  SET new.question_id = uuid();*/
  
  create table question_choices (
  `question_id` varchar(40),
  `choice_id` varchar(40),
  PRIMARY KEY (`question_id`, `choice_id`),
  FOREIGN KEY (`question_id`) REFERENCES questions(`question_id`),
  FOREIGN KEY (`choice_id`) REFERENCES choices(`choice_id`)
  );
  
  create table grades (
  `grade` char(1),
  `threshold` smallint NOT NULL,
  `result` char(7) NOT NULL,
  PRIMARY KEY (`grade`)
  );
  
  create table test_attempts (
  `attempt_id` varchar(40),
  `test_id` varchar(40) NOT NULL,
  `user_id` varchar(40) NOT NULL,
  `grade` char(1) NOT NULL,
  `attempt_date` datetime DEFAULT now() NOT NULL,
  PRIMARY KEY (`attempt_id`),# user can attempt a test more than once.
  FOREIGN KEY (`test_id`) REFERENCES tests(`test_id`),
  FOREIGN KEY (`user_id`) REFERENCES users(`user_id`)
  );
  
/*CREATE TRIGGER on_insert_attempts
  BEFORE INSERT ON test_attempts
  FOR EACH ROW
  SET new.attempt_id = uuid();*/

  create table user_tests (
  `user_id` varchar(40),
  `test_id` varchar(40),
  `creation_date` datetime DEFAULT now() NOT NULL,
  PRIMARY KEY (`user_id`, `test_id`),
  FOREIGN KEY (`user_id`) REFERENCES users(`user_id`),
  FOREIGN KEY (`test_id`) REFERENCES tests(`test_id`)
  );
  
  create table test_questions (
  `test_id` varchar(40),
  `question_id` varchar(40),
  PRIMARY KEY (`test_id`, `question_id`),
  FOREIGN KEY (`test_id`) REFERENCES tests(`test_id`),
  FOREIGN KEY (`question_id`) REFERENCES questions(`question_id`)
  );