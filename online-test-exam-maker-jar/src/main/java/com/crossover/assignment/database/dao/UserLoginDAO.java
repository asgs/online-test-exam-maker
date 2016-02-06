/**
 * 
 */
package com.crossover.assignment.database.dao;

import com.crossover.assignment.common.model.UserCredentials;

/**
 * @author asgs
 * 
 *         The Interface class to allow login operations on the User. This is
 *         lightweight at the moment, but can be extended (and renamed as well)
 *         to perform all user related operations, like "change profile",
 *         "reset password", "delete user", etc.,
 *
 */
public interface UserLoginDAO {

	/**
	 * Attempts to login the user based on the credentials they input.
	 * 
	 * @param credentials
	 * @return boolean - whether the login was successful or not.
	 */
	boolean loginUser(UserCredentials credentials);

}
