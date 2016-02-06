/**
 * 
 */
package com.crossover.assignment.database.dao;

import java.util.List;

import com.crossover.assignment.common.model.OnlineTest;
import com.crossover.assignment.common.model.OnlineTestQuestion;
import com.crossover.assignment.common.model.OnlineTestResult;
import com.crossover.assignment.common.model.UserCredentials;
import com.crossover.assignment.common.model.UserQuestionResponse;

/**
 * @author asgs
 * 
 *         The Interface class allows the User to perform the following
 *         operations.
 * 
 *         1. Retrieve the information of the latest Test assigned to the user.
 *         2. Retrieve the questions (along with the choices) for a given test.
 *         3. Submit the answers to the questions and calculate the
 *         result/grade.
 *
 */
public interface OnlineTestDAO {

	/**
	 * Retrieves the most recent test assigned to this user.
	 * 
	 * @param user
	 * @return OnlineTest instance.
	 */
	OnlineTest getLatestOnlineTestForUser(UserCredentials user);

	/**
	 * Retrieves a list of {@link OnlineTestQuestion}s part of this
	 * {@link OnlineTest} instance.
	 * 
	 * @param test
	 * @return a list of {@link OnlineTestQuestion}s.
	 */
	List<OnlineTestQuestion> getQuestionsForTest(OnlineTest test);

	/**
	 * Evaluates the outcome of the test taken up by the user, iterating over
	 * the list of {@link OnlineTestQuestion}s the user has attended.
	 * 
	 * @param testQuestions
	 * @return OnlineTestResult instance.
	 */
	OnlineTestResult evaluateTest(String testId,
			List<UserQuestionResponse> userQuestionResponses);

}
