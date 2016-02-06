/**
 * 
 */
package com.crossover.assignment.database.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.crossover.assignment.common.hql.Queries;
import com.crossover.assignment.common.model.UserCredentials;
import com.crossover.assignment.database.dao.UserLoginDAO;

/**
 * @author asgs
 *
 */
@Repository
@Component
public class UserLoginDAOImpl implements UserLoginDAO {

	/**
	 * Handle to the Hibernate's {@link SessionFactory} instance allowing to
	 * execute the DB operations in a transactional way.
	 */
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean loginUser(UserCredentials credentials) {
		Transaction transaction = null;
		try (Session session = sessionFactory.openSession()) {
			transaction = session.beginTransaction();
			List list = session.createQuery(Queries.QUERY_LOGIN)
					.setParameter("userId", credentials.getUserId())
					.setParameter("password", credentials.getPassword()).list();
			transaction.commit();
			return !list.isEmpty();
		} catch (Exception e) {
			e.printStackTrace();
			if (transaction != null) {
				transaction.rollback();
			}

		}
		return false;
	}

	/**
	 * @return the sessionFactory
	 */
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	/**
	 * @param sessionFactory
	 *            the sessionFactory to set
	 */
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
