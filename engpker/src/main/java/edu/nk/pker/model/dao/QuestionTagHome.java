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
 * Home object for domain model class QuestionTag.
 * @see edu.nk.pker.model.dao.QuestionTag
 * @author Hibernate Tools
 */
public class QuestionTagHome {

	private static final Log log = LogFactory.getLog(QuestionTagHome.class);

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

	public void persist(QuestionTag transientInstance) {
		log.debug("persisting QuestionTag instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(QuestionTag instance) {
		log.debug("attaching dirty QuestionTag instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(QuestionTag instance) {
		log.debug("attaching clean QuestionTag instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(QuestionTag persistentInstance) {
		log.debug("deleting QuestionTag instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public QuestionTag merge(QuestionTag detachedInstance) {
		log.debug("merging QuestionTag instance");
		try {
			QuestionTag result = (QuestionTag) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public QuestionTag findById(java.lang.Integer id) {
		log.debug("getting QuestionTag instance with id: " + id);
		try {
			QuestionTag instance = (QuestionTag) sessionFactory
					.getCurrentSession().get(
							"edu.nk.pker.model.dao.QuestionTag", id);
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

	public List findByExample(QuestionTag instance) {
		log.debug("finding QuestionTag instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("edu.nk.pker.model.dao.QuestionTag")
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
