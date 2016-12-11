package com.mpjr.jollyjaunt;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.Query;

//DAO (data access objects)
//DAO class contains methods to interact with database 
public class DAO {

	private static SessionFactory factory;

	private static void setupFactory() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			;
		}
		Configuration configuration = new Configuration();

		// modify these to match XML files
		configuration.configure("hibernate.cfg.xml");
		configuration.addResource("tripdetail.hbm.xml");
		configuration.addResource("userdetail.hbm.xml");
		configuration.addResource("eventdetail.hbm.xml");
		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
				.applySettings(configuration.getProperties()).build();
		factory = configuration.buildSessionFactory(serviceRegistry);
	}

	// method to add user information to the database
	public static int addUserDetail(UserDetail u) {
		if (factory == null)
			setupFactory();
		Session hibernateSession = factory.openSession();
		hibernateSession.getTransaction().begin();
		int i = (Integer) hibernateSession.save(u);
		hibernateSession.getTransaction().commit();
		hibernateSession.close();
		return i;
	}

	// method to retrieve user id if associated email is already in database
	public static int getUserId(String em) {
		if (factory == null)
			setupFactory();
		Session hibernateSession = factory.openSession();
		hibernateSession.getTransaction().begin();
		String hql = "from UserDetail where email =" + "'" + em + "'";

		org.hibernate.query.Query<UserDetail> q = hibernateSession.createQuery(hql, UserDetail.class);
		if (q.getResultList().isEmpty()) {
			return 0;

		}

		System.out.println("***********" + q + "*******************");
		UserDetail found = q.getSingleResult();
		System.out.println("***********" + found + "*******************");

		int i = 0;
		if (found != null) {
			i = UserDetail.getUserid();
			hibernateSession.getTransaction().commit();
			hibernateSession.close();

		}
		return i;
	}

	// method to add trip info (title, origin, destination, etc) to database
	public static int addTripDetail(TripDetail t) {
		if (factory == null)
			setupFactory();
		Session hibernateSession = factory.openSession();
		hibernateSession.getTransaction().begin();
		int i = (Integer) hibernateSession.save(t);
		hibernateSession.getTransaction().commit();
		hibernateSession.close();
		return i;
	}

	// method to retrieve all trips listed in database assoc. with a userid
	public static List<TripDetail> getAllTrips(int userid) {
		if (factory == null)
			setupFactory();
		Session hibernateSession = factory.openSession();
		hibernateSession.getTransaction().begin();
		List<TripDetail> trips = hibernateSession.createQuery("FROM TripDetail where user_id =" + userid).list();

		hibernateSession.getTransaction().commit();
		hibernateSession.close();
		return trips;
	}

	// method to retrieve all events listed in database assoc. with particular
	// trip
	public static List<EventDetail> getTripEvents(int tripid) {
		if (factory == null)
			setupFactory();
		Session hibernateSession = factory.openSession();
		hibernateSession.getTransaction().begin();
		List<EventDetail> events = hibernateSession.createQuery("FROM EventDetail where trip_id =" + tripid).list();
		hibernateSession.getTransaction().commit();
		hibernateSession.close();
		return events;
	}

	// method to add event details (city, event name, date, etc) to database
	public static int addEventDetail(EventDetail e) {
		if (factory == null)
			setupFactory();
		Session hibernateSession = factory.openSession();
		hibernateSession.getTransaction().begin();
		int i = (Integer) hibernateSession.save(e);
		hibernateSession.getTransaction().commit();
		hibernateSession.close();
		return i;
	}

	// public static String getFirstname() {
	// String ui2 = UserDetail.getFullname();
	// if (factory == null)
	// setupFactory();
	// Session hibernateSession = factory.openSession();
	// hibernateSession.getTransaction().begin();
	//
	// hibernateSession.getTransaction().commit();
	// hibernateSession.close();
	// return ui2;
	// }

}