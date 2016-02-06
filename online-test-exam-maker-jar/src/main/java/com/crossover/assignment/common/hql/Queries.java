/**
 * 
 */
package com.crossover.assignment.common.hql;

import com.crossover.assignment.common.model.OnlineTest;
import com.crossover.assignment.common.model.OnlineTestQuestion;
import com.crossover.assignment.database.model.Question;

/**
 * @author asgs
 * 
 *         Tabulates all the queries needed to be executed to simulate the
 *         "Online Exam maker".
 *
 */
public interface Queries {

	/**
	 * The query used to authenticate the user's credentials.
	 */
	String QUERY_LOGIN = "from User u where u.id = :userId and u.password = :password";

	/**
	 * Retrieves the latest test assigned to the user.
	 */
	String QUERY_LATEST_TEST = "from UserTest ut where ut.user.id = :userId order by ut.creationDate desc";

	/**
	 * Retrieves all the questions belonging to a given {@link OnlineTest}.
	 */
	String QUERY_TEST_QUESTIONS = "from TestQuestion tq where tq.testId = :testId";

	/**
	 * Retrieves the multiple choices applicable to a given
	 * {@link OnlineTestQuestion}.
	 */
	String QUERY_QUESTION_CHOICES = "from QuestionChoice qc where qc.questionId = :questionId";

	/**
	 * Retrieves both the test questions and their choices for a given test.
	 */
	String QUERY_TEST_QUESTIONS_WITH_CHOICES = "from TestQuestion tq, QuestionChoice qc where tq.question.id = qc.question.id and tq.test.id = :testId";

	/**
	 * Retrieves the answer for a given {@link Question}.
	 */
	String QUERY_QUESTION_ANSWER = "from Question q where q.id = :questionId";

	/**
	 * Retrieves the question/answer pair for a given test.
	 */
	String QUERY_QUESTION_ANSWERS_FOR_A_TEST = "select q from Question q, TestQuestion tq where tq.test.id = :testId and q.id = tq.question.id";

	/**
	 * Calculates the grade (and result) of the test, given the score (which is
	 * the threshold).
	 */
	String QUERY_TEST_GRADE = "from Grade g where g.threshold <= :score order by threshold desc";
	
	/**
	 * Gets the lowest grade in case the score is too low to compare.
	 */
	String QUERY_TEST_GRADE_LOWEST = "from Grade g order by threshold asc";

	//String INSERT_TEST_ATTEMPTS = "insert into TestAttempt (testId, userId, grade) select testId, userId from Test where ";

}
