package edu.nk.pker.model.dao;

// Generated 2015-5-20 10:21:32 by Hibernate Tools 4.3.1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

/**
 * Home object for domain model class QuestionType.
 * @see edu.nk.pker.model.dao.QuestionType
 * @author Hibernate Tools
 */
public class QuestionTypeHome {

	private static final Log log = LogFactory.getLog(QuestionTypeHome.class);

	private final SessionFactory sessionFactory = getSessionFactory();

	protected SessionFactory getSessionFactory() {
		try {
			return (SessionFactory) new InitialContext()
					.lookup("SessionFactory");
		} catch (Exception e) {
			log.error("Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException(
					"Could not locate SessionFactory in JNDI");
		}
	}

	public void persist(QuestionType transientInstance) {
		log.debug("persisting QuestionType instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(QuestionType instance) {
		log.debug("attaching dirty QuestionType instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(QuestionType instance) {
		log.debug("attaching clean QuestionType instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(QuestionType persistentInstance) {
		log.debug("deleting QuestionType instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public QuestionType merge(QuestionType detachedInstance) {
		log.debug("merging QuestionType instance");
		try {
			QuestionType result = (QuestionType) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public QuestionType findById(java.lang.Integer id) {
		log.debug("getting QuestionType instance with id: " + id);
		try {
			QuestionType instance = (QuestionType) sessionFactory
					.getCurrentSession().get(
							"edu.nk.pker.model.dao.QuestionType", id);
			if (instance == null) {
				log.debug("get successful, no instance found");
			} else {
				log.debug("get successful, instance found");
			}
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(QuestionType instance) {
		log.debug("finding QuestionType instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("edu.nk.pker.model.dao.QuestionType")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
