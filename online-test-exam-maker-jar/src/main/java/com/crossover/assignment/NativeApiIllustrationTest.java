/*
 * Hibernate, Relational Persistence for Idiomatic Java
 *
 * Copyright (c) 2010, Red Hat Inc. or third-party contributors as
 * indicated by the @author tags or express copyright attribution
 * statements applied by the authors.  All third-party contributions are
 * distributed under license by Red Hat Inc.
 *
 * This copyrighted material is made available to anyone wishing to use, modify,
 * copy, or redistribute it subject to the terms and conditions of the GNU
 * Lesser General Public License, as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License
 * for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this distribution; if not, write to:
 * Free Software Foundation, Inc.
 * 51 Franklin Street, Fifth Floor
 * Boston, MA  02110-1301  USA
 */
package com.crossover.assignment;

import java.util.ArrayList;
import java.util.List;

import junit.framework.TestCase;

import org.dozer.DozerBeanMapper;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import com.crossover.assignment.common.hql.Queries;
import com.crossover.assignment.common.model.OnlineChoice;
import com.crossover.assignment.common.model.OnlineQuestion;
import com.crossover.assignment.common.model.OnlineTest;
import com.crossover.assignment.common.model.OnlineTestQuestion;
import com.crossover.assignment.common.model.UserCredentials;
import com.crossover.assignment.database.model.Choice;
import com.crossover.assignment.database.model.Question;
import com.crossover.assignment.database.model.QuestionChoice;
import com.crossover.assignment.database.model.Test;
import com.crossover.assignment.database.model.TestQuestion;
import com.crossover.assignment.database.model.UserTest;

/**
 * Illustrates use of Hibernate native APIs.
 *
 * @author Steve Ebersole
 */
public class NativeApiIllustrationTest extends TestCase {
	private SessionFactory sessionFactory;

	private static final String LOGIN_QUERY = "from User u where u.id = :userId and u.password = :password";

	private final DozerBeanMapper dozerMapper = new DozerBeanMapper();

	@Override
	protected void setUp() throws Exception {
		// A SessionFactory is set up once for an application!
		final StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
				.configure() // configures settings from hibernate.cfg.xml
				.build();
		try {
			sessionFactory = new MetadataSources(registry).buildMetadata()
					.buildSessionFactory();
			System.out.println("SessionFactory instance is " + sessionFactory);
		} catch (Exception e) {
			// The registry would be destroyed by the SessionFactory, but we had
			// trouble building the SessionFactory
			// so destroy it manually.
			e.printStackTrace();
			StandardServiceRegistryBuilder.destroy(registry);
		}
	}

	@Override
	protected void tearDown() throws Exception {
		if (sessionFactory != null) {
			sessionFactory.close();
		}
	}

	// @SuppressWarnings("unchecked")
	/*
	 * public void testBasicUsage() { // create a couple of events... Session
	 * session = sessionFactory.openSession(); session.beginTransaction();
	 * session.save(new User("User1", "hashedpassword1")); session.save(new
	 * User("User2", "hashedpassword2")); session.getTransaction().commit();
	 * session.close();
	 * 
	 * // now lets pull events from the database and list them session =
	 * sessionFactory.openSession(); session.beginTransaction(); List result =
	 * session.createQuery("from User").list(); for (User users : (List<User>)
	 * result) { System.out.println("User (" + users.getName() + ") : " +
	 * users.getPassword()); } session.getTransaction().commit();
	 * session.close(); }
	 */

	public void testLoginUser() {
		UserCredentials credentials = new UserCredentials();
		String userId = "user5";
		String password = "hash1";
		credentials.setUserId(userId);
		credentials.setPassword(password);
		Transaction transaction = null;
		try (Session session = sessionFactory.openSession()) {
			transaction = session.beginTransaction();
			List list = session.createQuery(Queries.QUERY_LOGIN)
					.setParameter("userId", credentials.getUserId())
					.setParameter("password", credentials.getPassword()).list();
			transaction.commit();
			System.out.println("No. of rows is " + list.size());
		} catch (Exception e) {
			transaction.rollback();
		}

	}

	public void testGetLatestOnlineTestForUser() {
		UserCredentials user = new UserCredentials();
		String userId = "user1";
		String password = "hash1";
		user.setUserId(userId);
		user.setPassword(password);
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
				System.out.println("Test is " + latestTest.getTest());
				System.out.println("User is " + latestTest.getUser());
				OnlineTest onlineTest = new OnlineTest(test.getId(),
						test.getName(), test.getDescription());
				System.out.println("OnlineTests retrieved is "
						+ testList.size());
			}
			transaction.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();
			}
		}
	}

	public void testGetQuestionsForTest() {
		Test test2 = new Test();
		test2.setId("0403c9f1-b0ad-11e5-a708-5cf9dd3eb194");
		OnlineTest test = new OnlineTest(test2.getId(), null, null);
		Transaction transaction = null;
		try (Session session = sessionFactory.openSession()) {
			transaction = session.beginTransaction();
			Query query = session
					.createQuery(Queries.QUERY_TEST_QUESTIONS_WITH_CHOICES);
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
						OnlineQuestion onlineQuestion = new OnlineQuestion();
						dozerMapper.map(testQuestion.getQuestion(),
								onlineQuestion);
						onlineTestQuestions.add(onlineTestQuestion);
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
			System.out
					.println("questions retrieved are " + onlineTestQuestions);
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
		}
	}

	public void testEvaluateTest() {
		Transaction transaction = null;
		try (Session session = sessionFactory.openSession()) {
			transaction = session.beginTransaction();
			Query query = session
					.createQuery(Queries.QUERY_QUESTION_ANSWERS_FOR_A_TEST);
			@SuppressWarnings("unchecked")
			List<Question> list = query.setParameter("testId",
					"0403c9f1-b0ad-11e5-a708-5cf9dd3eb194").list();
			transaction.commit();
			System.out.println("Questions/Answers are " + list);

		} catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
		}

	}
}
