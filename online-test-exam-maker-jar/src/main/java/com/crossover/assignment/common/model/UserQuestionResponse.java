/**
 * 
 */
package com.crossover.assignment.common.model;

/**
 * @author asgs
 *
 */
public class UserQuestionResponse {

	private String questionId;

	private String answerChoice;

	/**
	 * @return the questionId
	 */
	public String getQuestionId() {
		return questionId;
	}

	/**
	 * @param questionId
	 *            the questionId to set
	 */
	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}

	/**
	 * @return the answerChoice
	 */
	public String getAnswerChoice() {
		return answerChoice;
	}

	/**
	 * @param answerChoice
	 *            the answerChoice to set
	 */
	public void setAnswerChoice(String answerChoice) {
		this.answerChoice = answerChoice;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "UserQuestionResponse [questionId=" + questionId
				+ ", answerChoice=" + answerChoice + "]";
	}

}
