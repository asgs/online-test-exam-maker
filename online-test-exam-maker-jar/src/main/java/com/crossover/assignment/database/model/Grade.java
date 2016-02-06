/**
 * 
 */
package com.crossover.assignment.database.model;

/**
 * @author asgs
 *
 */
public class Grade {

	private String grade;

	private int threshold;

	private String result;

	/**
	 * The one used by Hibernate internally (using Reflection).
	 */
	public Grade() {

	}

	/**
	 * @param grade
	 * @param threshold
	 * @param result
	 */
	public Grade(String grade, int threshold, String result) {
		super();
		this.grade = grade;
		this.threshold = threshold;
		this.result = result;
	}

	/**
	 * @return the grade
	 */
	public String getGrade() {
		return grade;
	}

	/**
	 * @return the result
	 */
	public String getResult() {
		return result;
	}

	/**
	 * @return the threshold
	 */
	public int getThreshold() {
		return threshold;
	}

	/**
	 * @param grade
	 *            the grade to set
	 */
	public void setGrade(String grade) {
		this.grade = grade;
	}

	/**
	 * @param result
	 *            the result to set
	 */
	public void setResult(String result) {
		this.result = result;
	}

	/**
	 * @param threshold
	 *            the threshold to set
	 */
	public void setThreshold(int threshold) {
		this.threshold = threshold;
	}

}
