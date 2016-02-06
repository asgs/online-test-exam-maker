/**
 * 
 */
package com.crossover.assignment.database.model;

/**
 * @author asgs
 *
 */
public class Test {

	private String id;

	private String name;

	private String description;

	/**
	 * The one used by Hibernate internally (using Reflection).
	 */
	public Test() {

	}

	/**
	 * @param name
	 * @param description
	 */
	public Test(String name, String description) {
		super();
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

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Test [id=" + id + ", name=" + name + ", description="
				+ description + "]";
	}

}
