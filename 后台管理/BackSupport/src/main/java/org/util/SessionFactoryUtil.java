package org.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class SessionFactoryUtil {
	public static SessionFactory sessionFactory;
	public static Session session;
	public static Transaction transaction;
	
	static {
		sessionFactory=new Configuration().configure().buildSessionFactory();
	}
	
	public static void create(){
        if(session!=null&&session.isOpen()) return;
        session=sessionFactory.openSession();
        transaction=session.beginTransaction();
    }

	public static void close(){
        transaction.commit();
        session.close();
    }
}
