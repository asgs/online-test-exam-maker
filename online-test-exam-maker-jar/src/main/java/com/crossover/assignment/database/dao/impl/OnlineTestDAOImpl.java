/**
 * 
 */
package com.crossover.assignment.database.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.dozer.DozerBeanMapper;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.crossover.assignment.common.hql.Queries;
import com.crossover.assignment.common.model.OnlineChoice;
import com.crossover.assignment.common.model.OnlineQuestion;
import com.crossover.assignment.common.model.OnlineTest;
import com.crossover.assignment.common.model.OnlineTestQuestion;
import com.crossover.assignment.common.model.OnlineTestResult;
import com.crossover.assignment.common.model.UserCredentials;
import com.crossover.assignment.common.model.UserQuestionResponse;
import com.crossover.assignment.database.dao.OnlineTestDAO;
import com.crossover.assignment.database.model.Choice;
import com.crossover.assignment.database.model.Grade;
import com.crossover.assignment.database.model.Question;
import com.crossover.assignment.database.model.QuestionChoice;
import com.crossover.assignment.database.model.Test;
import com.crossover.assignment.database.model.TestQuestion;
import com.crossover.assignment.database.model.UserTest;

/**
 * @author asgs
 *
 */
@Repository
@Component
public class OnlineTestDAOImpl implements OnlineTestDAO {

	/**
	 * Handle to the Hibernate's {@link SessionFactory} instance allowing to
	 * execute the DB operations in a transactional way.
	 */
	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private DozerBeanMapper dozerMapper;

	@Override
	public OnlineTest getLatestOnlineTestForUser(UserCredentials user) {
		Transaction transaction = null;
		try (Session session = sessionFactory.openSession()) {
			transaction = session.beginTransaction();
			Query query = session.createQuery(Queries.QUERY_LATEST_TEST);
			query.setMaxResults(1);
			@SuppressWarnings("unchecked")
			List<UserTest> testList = query.setParameter("userId",
					user.getUserId()).list();
			if (!testList.isEmpty()) {
				UserTest latestTest = testList.get(0);
				Test test = latestTest.getTest();
				OnlineTest onlineTest = new OnlineTest(test.getId(),
						test.getName(), test.getDescription());

				return onlineTest;
			}
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
		}

		return null;
	}

	@Override
	public List<OnlineTestQuestion> getQuestionsForTest(OnlineTest test) {
		Transaction transaction = null;
		try (Session session = sessionFactory.openSession()) {
			transaction = session.beginTransaction();
			Query query = session
					.createQuery(Queries.QUERY_TEST_QUESTIONS_WITH_CHOICES);
			@SuppressWarnings("unchecked")
			List<Object[]> list = query.setParameter("testId", test.getId())
					.list();
			List<OnlineTestQuestion> onlineTestQuestions = null;
			if (!list.isEmpty()) {
				onlineTestQuestions = new ArrayList<>();
				TestQuestion previousTestQuestion = null;
				OnlineTestQuestion previousOnlineTestQuestion = null;
				for (Object[] tuple : list) {
					TestQuestion testQuestion = (TestQuestion) tuple[0];
					QuestionChoice questionChoice = (QuestionChoice) tuple[1];
					OnlineTestQuestion onlineTestQuestion = null;
					if (testQuestion != previousTestQuestion) {
						onlineTestQuestion = new OnlineTestQuestion();
						onlineTestQuestions.add(onlineTestQuestion);
						OnlineQuestion onlineQuestion = new OnlineQuestion();
						dozerMapper.map(testQuestion.getQuestion(),
								onlineQuestion);
						onlineTestQuestion.setQuestion(onlineQuestion);
						previousOnlineTestQuestion = onlineTestQuestion;
						previousTestQuestion = testQuestion;
					}
					Choice choice = questionChoice.getChoice();
					OnlineChoice onlineChoice = new OnlineChoice();
					dozerMapper.map(choice, onlineChoice);
					previousOnlineTestQuestion.getChoices().add(onlineChoice);
				}
			}
			transaction.commit();
			return onlineTestQuestions;
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
		}
		return null;
	}

	@Override
	public OnlineTestResult evaluateTest(String testId,
			List<UserQuestionResponse> userQuestionResponses) {
		Transaction transaction = null;
		try (Session session = sessionFactory.openSession()) {
			transaction = session.beginTransaction();
			Query query = session
					.createQuery(Queries.QUERY_QUESTION_ANSWERS_FOR_A_TEST);
			@SuppressWarnings("unchecked")
			List<Question> list = query.setParameter("testId", testId).list();
			transaction.commit();
			int rightAnswerCount = 0;
			for (UserQuestionResponse response : userQuestionResponses) {
				for (Question question : list) {
					if (question.getId().equals(response.getQuestionId())
							&& question.getAnswer().getId()
									.equals(response.getAnswerChoice())) {
						rightAnswerCount++;
					}
				}
			}
			int score = Math.round(100 * ((float) (rightAnswerCount) / list
					.size()));
			Grade grade = calculateGrade(session, score);
			if (grade != null) {
				OnlineTestResult result = new OnlineTestResult();
				result.setGrade(grade.getGrade());
				result.setResult(grade.getResult());
				return result;
			}

		} catch (Exception e) {
			transaction.rollback();
		}

		return null;
	}

	/**
	 * A Small utility method to run the query to find out the Grade for a given
	 * test score.
	 * 
	 * @param session
	 * @param score
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private Grade calculateGrade(Session session, int score) {
		Transaction transaction = session.beginTransaction();
		Query query = session.createQuery(Queries.QUERY_TEST_GRADE);
		// To get the closest grade applicable to this result.
		query.setMaxResults(1);
		List<Grade> list = null;
		try {
			list = query.setParameter("score", score).list();
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}
		if (list.isEmpty()) {
			// Probably a case where the user has scored too low.
			transaction = session.beginTransaction();
			query = session.createQuery(Queries.QUERY_TEST_GRADE_LOWEST);
			// To get the closest grade applicable to this result.
			query.setMaxResults(1);
			try {
				list = query.list();
				transaction.commit();
			} catch (Exception e) {
				e.printStackTrace();
				transaction.rollback();
			}
		}
		return list.isEmpty() ? null : list.get(0);
	}
}
