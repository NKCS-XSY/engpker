package edu.nk.pker.util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.boot.registry.internal.StandardServiceRegistryImpl;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

public class HibernateUtil {

    private static final SessionFactory sessionFactory = buildSessionFactory();

    @SuppressWarnings("deprecation")
	private static SessionFactory buildSessionFactory() {
    	SessionFactory sessionFactory = null;  
//    	ServiceRegistry serviceRegistry=null;
        try { 
        	//第1种
        	// Create the SessionFactory from hibernate.cfg.xml
//            return new Configuration().configure().buildSessionFactory(
//			    new StandardServiceRegistryBuilder().build() ); 
        	
         // Create the SessionFactory from hibernate.cfg.xml
            Configuration configuration = new Configuration();
            configuration.configure("hibernate.cfg.xml");
            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
                    .applySettings(configuration.getProperties()).build();
            sessionFactory = configuration
                    .buildSessionFactory(serviceRegistry);
        	//第2种
//		    	Configuration configuration = new Configuration().configure();
//				StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder()
//						.applySettings(configuration.getProperties());
//				StandardServiceRegistryImpl registry = (StandardServiceRegistryImpl) builder
//						.build();
//				sessionFactory = configuration.buildSessionFactory(registry); 
				
        	// 第3种-失败JNDI
				 // A SessionFactory is set up once for an application
//			    sessionFactory = new Configuration()
//			            .configure() // configures settings from hibernate.cfg.xml
//			            .buildSessionFactory();
        	//第4种 -失败JNDI
//        	Configuration configuration = new Configuration().configure();
//            serviceRegistry = new ServiceRegistryBuilder().applySettings(
//                    configuration.getProperties()).buildServiceRegistry();
//            sessionFactory = configuration.buildSessionFactory(serviceRegistry);
				
				System.out.println("Initial SessionFactory creation succeed.");
				return sessionFactory;
        }
        catch (Throwable ex) {
            // Make sure you log the exception, as it might be swallowed
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}