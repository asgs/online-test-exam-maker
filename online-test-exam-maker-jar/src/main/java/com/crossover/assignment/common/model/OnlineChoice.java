/**
 * 
 */
package com.crossover.assignment.common.model;

/**
 * @author asgs
 *
 */
public class OnlineChoice {

	private String id;

	private String choice;

	/**
	 * The one used by Hibernate internally (using Reflection).
	 */
	public OnlineChoice() {

	}

	/**
	 * The one used to create new users programmatically.
	 * 
	 * @param name
	 * @param password
	 */
	public OnlineChoice(String choice) {
		this.choice = choice;
	}

	/**
	 * @return the choice
	 */
	public String getChoice() {
		return choice;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param choice
	 *            the choice to set
	 */
	public void setChoice(String choice) {
		this.choice = choice;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Choice [id=" + id + ", choice=" + choice + "]";
	}

}
