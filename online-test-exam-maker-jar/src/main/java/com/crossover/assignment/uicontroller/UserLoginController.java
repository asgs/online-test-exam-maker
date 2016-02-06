/**
 * 
 */
package com.crossover.assignment.uicontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.crossover.assignment.common.model.OnlineTest;
import com.crossover.assignment.common.model.UserCredentials;
import com.crossover.assignment.database.dao.OnlineTestDAO;
import com.crossover.assignment.database.dao.UserLoginDAO;

/**
 * @author asgs
 *
 */
@Controller
public class UserLoginController {

	@Autowired
	private UserLoginDAO userLoginDAOImpl;

	@Autowired
	private OnlineTestDAO onlineTestDAOImpl;

	/**
	 * Authenticates the user's credentials and redirects appropriately.
	 * 
	 * @param userId
	 *            Input from the user.
	 * @param password
	 *            Input from the user.
	 * @return ModelAndView - appropriate View instance for the User.
	 */
	@RequestMapping(path = "/authenticate", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam String userId,
			@RequestParam String password) {
		UserCredentials credentials = new UserCredentials();
		credentials.setUserId(userId);
		credentials.setPassword(password);
		boolean authenticated = userLoginDAOImpl.loginUser(credentials);
		ModelAndView modelAndView = new ModelAndView();
		if (authenticated) {
			modelAndView.setViewName("home");
			OnlineTest latestOnlineTestForUser = onlineTestDAOImpl
					.getLatestOnlineTestForUser(credentials);
			modelAndView.addObject("testInfo", latestOnlineTestForUser);
			modelAndView.addObject("userId", userId);

		} else {
			modelAndView.setViewName("login");
			modelAndView
					.addObject("error",
							"Sorry, but the details you entered are incorrect. Please retry.");
		}
		return modelAndView;
	}

}
