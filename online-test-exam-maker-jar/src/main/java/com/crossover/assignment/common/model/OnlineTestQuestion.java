/**
 * 
 */
package com.crossover.assignment.common.model;

import java.util.ArrayList;
import java.util.List;

/**
 * @author asgs
 * 
 *         Represents a question mapped to an Online Test. It contains the
 *         choices to be shown for this question.
 *
 */
public class OnlineTestQuestion {

	private OnlineQuestion question;

	private List<OnlineChoice> choices = new ArrayList<>();

	/**
	 * @return the question
	 */
	public OnlineQuestion getQuestion() {
		return question;
	}

	/**
	 * @param question
	 *            the question to set
	 */
	public void setQuestion(OnlineQuestion question) {
		this.question = question;
	}

	/**
	 * @return the choices
	 */
	public List<OnlineChoice> getChoices() {
		return choices;
	}

	/**
	 * @param choices
	 *            the choices to set
	 */
	public void setChoices(List<OnlineChoice> choices) {
		this.choices = choices;
	}

	@Override
	public String toString() {
		return "OnlineTestQuestion [question=" + question + ", choices="
				+ choices + "]";
	}
}
