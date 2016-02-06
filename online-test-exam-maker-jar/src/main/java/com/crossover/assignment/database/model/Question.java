/**
 * 
 */
package com.crossover.assignment.database.model;

/**
 * @author asgs
 *
 */
public class Question {

	private String id;

	private String question;

	private Choice answer;

	/**
	 * The one used by Hibernate internally (using Reflection).
	 */
	public Question() {

	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param question
	 * @param answer
	 */
	public Question(String question, Choice answer) {
		super();
		this.question = question;
		this.answer = answer;
	}

	/**
	 * @return the question
	 */
	public String getQuestion() {
		return question;
	}

	/**
	 * @param question
	 *            the question to set
	 */
	public void setQuestion(String question) {
		this.question = question;
	}

	/**
	 * @return the answer
	 */
	public Choice getAnswer() {
		return answer;
	}

	/**
	 * @param answer
	 *            the answer to set
	 */
	public void setAnswer(Choice answer) {
		this.answer = answer;
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
		return "Question [id=" + id + ", question=" + question + ", answer="
				+ answer + "]";
	}

}
