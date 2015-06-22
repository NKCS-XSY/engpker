package edu.nk.pker.model.dao;

// Generated 2015-5-20 10:21:32 by Hibernate Tools 4.3.1

import java.util.List;

import javax.naming.InitialContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Restrictions;

import edu.nk.pker.model.po.Question;
import edu.nk.pker.model.po.User;
import edu.nk.pker.util.HibernateUtil;

/**
 * Home object for domain model class User.
 * @see edu.nk.pker.model.dao.User
 * @author Hibernate Tools
 */
public class UserHome {

	private static final Log log = LogFactory.getLog(UserHome.class);

	private final SessionFactory sessionFactory = getSessionFactory();

	protected SessionFactory getSessionFactory() {
		try {
			return HibernateUtil.getSessionFactory();
//			return (SessionFactory) new InitialContext()
//					.lookup("SessionFactory");
		} catch (Exception e) {
			log.error("Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException(
					"Could not locate SessionFactory in JNDI");
		}
	}

	public void persist(User transientInstance) {
		log.debug("persisting User instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(User instance) {
		log.debug("attaching dirty User instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(User instance) {
		log.debug("attaching clean User instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(User persistentInstance) {
		log.debug("deleting User instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public User merge(User detachedInstance) {
		log.debug("merging User instance");
		try {
			User result = (User) sessionFactory.getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public User findById(java.lang.Integer id) {
		log.debug("getting User instance with id: " + id);
		try {
			User instance = (User) sessionFactory.getCurrentSession().get(
					"edu.nk.pker.model.dao.User", id);
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

	public List findByExample(User instance) {
		log.debug("finding User instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("edu.nk.pker.model.dao.User")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public User selectByObjet(String username, String password) {
		// TODO Auto-generated method stub
		Session session=null;	
		log.debug("getting User instance with user: " + username);
		try {
			// 方法1: 使用Query
//		    session=sessionFactory.openSession();
//		    session.beginTransaction();
//			//from后面是对象，不是表名
//			String hql="from User as user where user.username=:username & user.password=:password";//使用命名参数，推荐使用，易读。
//			Query query=sessionFactory.getCurrentSession().createQuery(hql);
//		    query.setString("username", username);
//		    query.setString(password, password);
//		    List<User> userList=query.list();
			
		    // 方法2: 使用 Criteria
		    session=sessionFactory.openSession();
		    session.beginTransaction();
		    Criteria c=session.createCriteria(User.class);
		    c.add(Restrictions.eq("username",username))//eq是等于，gt是大于，lt是小于,or是或
		    			.add(Restrictions.eq("password", password));
		    List userList=c.list();
		    
		    log.debug("UserList:"+userList.toString());
			if(userList!=null && userList.size()>0)
			{
				log.debug("get successful, instance found");
				User user=(User) userList.get(0);
				return user;
			}
			else
			{
				log.debug("get successful, no instance found");
				return null;
			}
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}	
		finally{
			session.getTransaction().commit();
			session.flush();
			session.close();
		}

	}
	public void add(User instance) {
		Session session=null;
		try {
			session = sessionFactory.openSession();
			session.beginTransaction();
			log.debug("Adding a user record !");
			session.save(instance);
			session.getTransaction().commit();
		}catch(RuntimeException re){
			log.error("add user failed",re);
			throw re;
		}finally {
			session.flush();
			session.close();
		}
	}
}
