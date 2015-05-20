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
 * Home object for domain model class CompetitionUser.
 * @see edu.nk.pker.model.dao.CompetitionUser
 * @author Hibernate Tools
 */
public class CompetitionUserHome {

	private static final Log log = LogFactory.getLog(CompetitionUserHome.class);

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

	public void persist(CompetitionUser transientInstance) {
		log.debug("persisting CompetitionUser instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(CompetitionUser instance) {
		log.debug("attaching dirty CompetitionUser instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(CompetitionUser instance) {
		log.debug("attaching clean CompetitionUser instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(CompetitionUser persistentInstance) {
		log.debug("deleting CompetitionUser instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public CompetitionUser merge(CompetitionUser detachedInstance) {
		log.debug("merging CompetitionUser instance");
		try {
			CompetitionUser result = (CompetitionUser) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public CompetitionUser findById(java.lang.Integer id) {
		log.debug("getting CompetitionUser instance with id: " + id);
		try {
			CompetitionUser instance = (CompetitionUser) sessionFactory
					.getCurrentSession().get(
							"edu.nk.pker.model.dao.CompetitionUser", id);
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

	public List findByExample(CompetitionUser instance) {
		log.debug("finding CompetitionUser instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("edu.nk.pker.model.dao.CompetitionUser")
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
