/**
 * 
 */
package com.crossover.assignment.database.model;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * @author asgs
 *
 */
public class TestAttempt implements Serializable {

	/**
	 * Generated SerialVersionUID.
	 */
	private static final long serialVersionUID = -1814995783263728979L;

	private String attemptId;

	private Test test;

	private User user;

	private String grade;

	private Timestamp submittedOn;

	/**
	 * The one used by Hibernate internally (using Reflection).
	 */
	public TestAttempt() {

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((attemptId == null) ? 0 : attemptId.hashCode());
		result = prime * result + ((grade == null) ? 0 : grade.hashCode());
		result = prime * result
				+ ((submittedOn == null) ? 0 : submittedOn.hashCode());
		result = prime * result + ((test == null) ? 0 : test.hashCode());
		result = prime * result + ((user == null) ? 0 : user.hashCode());
		return result;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (!(obj instanceof TestAttempt)) {
			return false;
		}
		TestAttempt other = (TestAttempt) obj;
		if (attemptId == null) {
			if (other.attemptId != null) {
				return false;
			}
		} else if (!attemptId.equals(other.attemptId)) {
			return false;
		}
		if (grade == null) {
			if (other.grade != null) {
				return false;
			}
		} else if (!grade.equals(other.grade)) {
			return false;
		}
		if (submittedOn == null) {
			if (other.submittedOn != null) {
				return false;
			}
		} else if (!submittedOn.equals(other.submittedOn)) {
			return false;
		}
		if (test == null) {
			if (other.test != null) {
				return false;
			}
		} else if (!test.equals(other.test)) {
			return false;
		}
		if (user == null) {
			if (other.user != null) {
				return false;
			}
		} else if (!user.equals(other.user)) {
			return false;
		}
		return true;
	}

	/**
	 * @return the attemptId
	 */
	public String getAttemptId() {
		return attemptId;
	}

	/**
	 * @param attemptId
	 *            the attemptId to set
	 */
	public void setAttemptId(String attemptId) {
		this.attemptId = attemptId;
	}

	/**
	 * @return the test
	 */
	public Test getTest() {
		return test;
	}

	/**
	 * @param test
	 *            the test to set
	 */
	public void setTest(Test test) {
		this.test = test;
	}

	/**
	 * @return the user
	 */
	public User getUser() {
		return user;
	}

	/**
	 * @param user
	 *            the user to set
	 */
	public void setUser(User user) {
		this.user = user;
	}

	/**
	 * @return the grade
	 */
	public String getGrade() {
		return grade;
	}

	/**
	 * @param grade
	 *            the grade to set
	 */
	public void setGrade(String grade) {
		this.grade = grade;
	}

	/**
	 * @return the submittedOn
	 */
	public Timestamp getSubmittedOn() {
		return submittedOn;
	}

	/**
	 * @param submittedOn
	 *            the submittedOn to set
	 */
	public void setSubmittedOn(Timestamp submittedOn) {
		this.submittedOn = submittedOn;
	}

}
