/**
 * 
 */
package com.crossover.assignment.common.model;

/**
 * @author asgs
 * 
 *         The model exposed to the UI tier. Encapsulates a test/exam the user
 *         could take on-line. Contains a list of questions.
 *
 */
public class OnlineTest {

	private String id;

	private String name;

	private String description;

	/**
	 * @param id
	 * @param name
	 * @param description
	 */
	public OnlineTest(String id, String name, String description) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param description
	 *            the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "OnlineTest [id=" + id + ", name=" + name + ", description="
				+ description + "]";
	}

}
