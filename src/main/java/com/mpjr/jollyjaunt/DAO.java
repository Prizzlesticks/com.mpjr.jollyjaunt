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

	
	public class DAO {

		private static SessionFactory factory;

		private static void setupFactory() {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (Exception e) {
				;
			}
			Configuration configuration = new Configuration();

			// modify these to match your XML files
			configuration.configure("hibernate.cfg.xml");
			configuration.addResource("tripdetail.hbm.xml");
			configuration.addResource("userdetail.hbm.xml");
			ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
					.applySettings(configuration.getProperties()).build();
			factory = configuration.buildSessionFactory(serviceRegistry);
		}

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
		public static int getUserId(String em){
			if (factory == null)
				setupFactory();
			Session hibernateSession = factory.openSession();
			hibernateSession.getTransaction().begin();
		    String hql = "from UserDetail where email ="+ "'"+ em +"'";
		    
		    org.hibernate.query.Query<UserDetail> q = hibernateSession.createQuery(hql,UserDetail.class);
		    if (q.getResultList().isEmpty()) {
		    	return 0; 
		
		    } 
		    	
		    System.out.println("***********" + q + "*******************");
			UserDetail found = q.getSingleResult();
			System.out.println("***********" + found + "*******************");
			
			int i = 0;
			if (found != null) {
			i =found.getUserid();
			hibernateSession.getTransaction().commit();
			hibernateSession.close();
			
			} 
				return i;
		}
		
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

		public static List<TripDetail> getAllTrips() {
				if (factory == null)
					setupFactory();
				Session hibernateSession = factory.openSession();
				hibernateSession.getTransaction().begin();
				List<TripDetail> trips = hibernateSession.createQuery("FROM TripDetail").list();
				hibernateSession.getTransaction().commit();
				hibernateSession.close();
				return trips;
		}
			
		

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
		
		
//		public static String getFirstname() {
//			String ui2 = UserDetail.getFullname();
//			if (factory == null)
//				setupFactory();
//			Session hibernateSession = factory.openSession();
//			hibernateSession.getTransaction().begin();
//			
//			hibernateSession.getTransaction().commit();
//			hibernateSession.close();
//			return ui2;
//		}
	
}
