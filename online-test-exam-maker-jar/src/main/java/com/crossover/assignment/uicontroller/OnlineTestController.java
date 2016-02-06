/**
 * 
 */
package com.crossover.assignment.uicontroller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.crossover.assignment.common.model.OnlineTest;
import com.crossover.assignment.common.model.OnlineTestQuestion;
import com.crossover.assignment.common.model.OnlineTestResult;
import com.crossover.assignment.common.model.UserQuestionResponse;
import com.crossover.assignment.database.dao.OnlineTestDAO;

/**
 * @author asgs
 *
 */
@Controller
public class OnlineTestController {

	@Autowired
	private OnlineTestDAO onlineTestDAOImpl;

	/**
	 * Time duration before which user should submit the test.
	 */
	private static final int DURATION_SECS = 5;

	/**
	 * Allows the user to take the most-recently test assigned to them.
	 * Retrieves all the questions part of this test.
	 * 
	 * @param testId
	 *            The test for which the questions will be retrieved.
	 * @param userId
	 *            The user who will take up the test.
	 * @return The appropriate view with the models populated.
	 */
	@RequestMapping(path = "/takeTest", method = RequestMethod.POST)
	public ModelAndView takeTest(@RequestParam String testId,
			@RequestParam String userId) {
		// Begin the timer.
		List<OnlineTestQuestion> questionsForTest = onlineTestDAOImpl
				.getQuestionsForTest(new OnlineTest(testId, null, null));
		ModelAndView modelAndView = new ModelAndView();
		if (!questionsForTest.isEmpty()) {
			modelAndView.setViewName("testquestions");
			modelAndView.addObject("testQuestions", questionsForTest);
			modelAndView.addObject("testId", testId);
		} else {
			modelAndView.setViewName("home");
			modelAndView
					.addObject("error",
							"Sorry, but the test is not available right now. Please retry later.");
		}
		return modelAndView;
	}

	@RequestMapping(path = "/evaluateTest", method = RequestMethod.POST)
	public ModelAndView evaluateTest(HttpServletRequest request,
			HttpServletResponse response) {
		Enumeration<String> parameterNames = request.getParameterNames();
		List<UserQuestionResponse> questionResponses = new ArrayList<>();
		while (parameterNames.hasMoreElements()) {
			String parameter = parameterNames.nextElement();
			if (parameter != null && parameter.startsWith("questionId")) {
				String questionId = parameter
						.substring(parameter.indexOf("_") + 1);
				String usersChoice = request.getParameter(parameter);
				usersChoice = usersChoice
						.substring(usersChoice.indexOf("_") + 1);
				UserQuestionResponse questionResponse = new UserQuestionResponse();
				questionResponse.setAnswerChoice(usersChoice);
				questionResponse.setQuestionId(questionId);
				questionResponses.add(questionResponse);
			}
		}
		String testId = request.getParameter("testId");
		OnlineTestResult testResult = onlineTestDAOImpl.evaluateTest(testId,
				questionResponses);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("testresult");
		modelAndView.addObject("testresult", testResult);
		return modelAndView;
	}
}
