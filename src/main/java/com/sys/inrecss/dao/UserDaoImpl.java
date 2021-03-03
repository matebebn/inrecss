package com.sys.inrecss.dao;


import java.sql.Timestamp;
import java.util.List;

import com.sys.inrecss.model.*;
import org.hibernate.*;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;


public class UserDaoImpl implements UserDao {

  @Autowired
  DataSource datasource;

  @Autowired
  JdbcTemplate jdbcTemplate;
  private HttpServletRequest request;

  private Session currentSession;

  private Transaction currentTransaction;

  public UserDaoImpl() {
  }

  public Session openCurrentSession() {
    currentSession = getSessionFactory().openSession();
    return currentSession;
  }

  public Session openCurrentSessionwithTransaction() {
    currentSession = getSessionFactory().openSession();
    currentTransaction = currentSession.beginTransaction();
    return currentSession;
  }

  public void closeCurrentSession() {
    currentSession.close();
  }

  public void closeCurrentSessionwithTransaction() {
    currentTransaction.commit();
    currentSession.close();
  }

  public void closeCurrentSessionwithTransactionRollback() {
    currentTransaction.rollback();
    currentSession.close();
  }

  private static SessionFactory getSessionFactory() {
    Configuration configuration = new Configuration().configure();
    StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder()
            .applySettings(configuration.getProperties());
    SessionFactory sessionFactory = configuration.buildSessionFactory(builder.build());
    return sessionFactory;
  }

  public Session getCurrentSession() {
    return currentSession;
  }

  public void setCurrentSession(Session currentSession) {
    this.currentSession = currentSession;
  }

  public Transaction getCurrentTransaction() {
    return currentTransaction;
  }

  public void setCurrentTransaction(Transaction currentTransaction) {
    this.currentTransaction = currentTransaction;
  }

  private void setDataNewUser(String username, String password, String email, String phone, String type, Session session) {
    User user = new User();
    user.setUserName(username);
    user.setPasswordUser(password);
    user.setEmailUser(email);
    user.setPhoneNumberUser(phone);
    user.setTypeAccountUser(type);
    user.setDeleted("0");
    session.save(user);

  }

  private Integer getInteger(Integer number, int currentCount, int num, Session session, String sql, int id) {
    List results;
    results = executeCurrentDataChartSQL(number, session, sql, id);
    while (num < results.size()) {
      currentCount++;
      num++;
    }
    if (currentCount != 0) {
      closeCurrentSession();
      return currentCount;
    }
    return 0;
  }

  private List executeCurrentDataChartSQL(Integer number, Session session, String sql,int id) {
    Query query = session.createQuery(sql);
    query.setParameter("monthNumber", number);
    query.setParameter("idUser", id);
    List results = query.list();
    System.out.println(results.size());
    return results;
  }


  @Override
  public boolean create_event(String nameEvent,String personLimit,String dateEvent,String phoneEvent,String startTimeEvent,String endTimeEvent,String emailEvent,String typeEvent,String eventDescription,String addressEvent,String eventCity,String eventSheduleDescription,String priceEvent,String bankPayment,String numberAccountTransfer,String tittleTransferBank,String onlinePayment,String userID) {
    int ID=0;
    Session session = openCurrentSessionwithTransaction();
    if (session != null) {
      try {
      Event event = new Event();
      event.setNameEvent(nameEvent);
        event.setPersonLimit(Integer.valueOf(personLimit));
        event.setEventDate(dateEvent);
        event.setPhoneEvent(phoneEvent);
        event.setStartTimeEvent(startTimeEvent);
        event.setEndTimeEvent(endTimeEvent);
        event.setEmailEvent(emailEvent);
        event.setEventType(Integer.valueOf(typeEvent));
        event.setEventDescription(eventDescription);
        event.setAdressEvent(addressEvent);
        event.setCityEvent(eventCity);
        event.setPriceEvent(Double.parseDouble(priceEvent));
        event.setActiveBankTransfer(Integer.valueOf(bankPayment));
        event.setAccountNumber(numberAccountTransfer);
        event.setTitlePayment(tittleTransferBank);
        event.setActiveOnlinePayments(Integer.valueOf(onlinePayment));
        event.setCreatedUserId(Integer.valueOf(userID));
        session.save(event);

        ID=event.getId_event();
        Shedule shedule= new Shedule();
        shedule.setId_event(ID);
        shedule.setDescription_shedule(eventSheduleDescription);
        session.save(shedule);
        closeCurrentSessionwithTransaction();
        return true;
      } catch (Exception exception) {
        closeCurrentSessionwithTransactionRollback();
        System.out.println("Exception occred while reading user data: "
                + exception.getMessage());
        return false;
      }

    } else {
      System.out.println("DB server down.....");
    }
    return false;
  }

  @Override
  public boolean addFeedback(String name, String description, int rate, int eventID) {
    Session session = openCurrentSessionwithTransaction();
    if (session != null) {
      try {
        Feedback feedback = new Feedback();
        feedback.setId_event(eventID);
        feedback.setName(name);
        feedback.setDescription(description);
        feedback.setRating(rate);
        session.save(feedback);
        closeCurrentSessionwithTransaction();
        return true;
      } catch (Exception exception) {
        closeCurrentSessionwithTransactionRollback();
        System.out.println("Exception occred while reading user data: "
                + exception.getMessage());
        return false;
      }

    } else {
      System.out.println("DB server down.....");
    }
    return false;
  }

  @Override
  public boolean register(String username, String password, String email, String phone) {
    Session session = openCurrentSessionwithTransaction();

    if (session != null) {
      try {
        setDataNewUser(username, password, email, phone, "0", session);
        closeCurrentSessionwithTransaction();
        return true;
      } catch (Exception exception) {
        closeCurrentSessionwithTransactionRollback();
        System.out.println("Exception occred while reading user data: "
                + exception.getMessage());
        return false;
      }

    } else {
      System.out.println("DB server down.....");
    }
    return false;
  }

  @Override
  public boolean registerAdmin(String username, String password, String email, String phone, String type) {
    System.out.println("Insert");
    Session session = openCurrentSessionwithTransaction();
    if (session != null) {
      try {

        setDataNewUser(username, password, email, phone, type, session);
        closeCurrentSessionwithTransaction();
        return true;
      } catch (Exception exception) {
        closeCurrentSessionwithTransactionRollback();
        System.out.println("Exception occred while reading user data: "
                + exception.getMessage());
        return false;

      }

    } else {
      System.out.println("DB server down.....");
    }
    return false;
  }

  @Override
  public boolean delete(Integer number) {
    System.out.println("Usuwanie");
    Session session = openCurrentSessionwithTransaction();
    if (session != null) {
      try {
        String sql = "Update User Set deleted=1 where id_user= :ID";
        Query query = session.createQuery(sql);
        query.setParameter("ID", number);
        query.executeUpdate();
        closeCurrentSessionwithTransaction();
        return true;
      } catch (Exception exception) {
        closeCurrentSessionwithTransactionRollback();
        System.out.println("Exception occred while reading user data: "
                + exception.getMessage());
        return false;

      }

    } else {
      System.out.println("DB server down.....");
    }
    return false;
  }

  @Override
  public boolean editProfil(String password, String email, String phone, int contactId) {
    System.out.println("Update");
    Session session = openCurrentSessionwithTransaction();
    if (session != null) {
      try {
        String sql = "Update User Set password= :password,email= :email,phone= :phone   where id_user= :ID";
        Query query = session.createQuery(sql);
        query.setParameter("password", password);
        query.setParameter("email", email);
        query.setParameter("phone", phone);
        query.setParameter("ID", contactId);
        query.executeUpdate();
        closeCurrentSessionwithTransaction();
        return true;
      } catch (Exception exception) {
        closeCurrentSessionwithTransactionRollback();
        System.out.println("Exception occred while reading user data: "
                + exception.getMessage());
        return false;

      }

    } else {
      System.out.println("DB server down.....");
    }
    return false;
  }

  @Override
  public boolean edit(String username, String password, String email, String phone, String permisssion, int contactId) {
    System.out.println("Update");
    Session session = openCurrentSessionwithTransaction();
    if (session != null) {
      try {
        String sql = "Update User Set username= :username,password= :password,email= :email,phone= :phone,type= :permisssion   where id_user= :ID";
        Query query = session.createQuery(sql);
        query.setParameter("username", username);
        query.setParameter("password", password);
        query.setParameter("email", email);
        query.setParameter("phone", phone);
        query.setParameter("permisssion", permisssion);
        query.setParameter("ID", contactId);
        query.executeUpdate();
        closeCurrentSessionwithTransaction();
        return true;
      } catch (Exception exception) {
        closeCurrentSessionwithTransactionRollback();
        System.out.println("Exception occred while reading user data: "
                + exception.getMessage());
        return false;

      }

    } else {
      System.out.println("DB server down.....");
    }
    return false;
  }

  @Override
  public boolean addResetPassword(int idUser, String token, Timestamp expTime, Timestamp inTime) {
    System.out.println("Insert");
    Session session = openCurrentSessionwithTransaction();
    if (session != null) {
      try {
        ResetPassword resetPassword = new ResetPassword();
        resetPassword.setId_user(idUser);
        resetPassword.setHash_code(token);
        resetPassword.setExpTime(expTime);
        resetPassword.setInTime(inTime);
        session.save(resetPassword);
        session.getTransaction().commit();

        return true;
      } catch (HibernateException hex) {
        try {
          session.getTransaction().rollback();
        } catch (Exception e) {
          //just log warn
        }
        String msg = "Error occured  Cause: " + hex;
        System.out.println(msg);
      } finally {
        if (session != null) {
          session.close();
        }
      }

    }
    return false;

  }

  @Override
  public boolean resetPassword(String password,int idUser ){
    System.out.println("Update");
    Session session = openCurrentSessionwithTransaction();
    if (session != null) {
      try {
        User user=getUser(idUser);
        user.setPasswordUser(password);
        session.update(user);
        session.getTransaction().commit();
        return true;


      } catch (HibernateException hex) {
        try {
          session.getTransaction().rollback();
        } catch (Exception e) {
          //just log warn
        }
        String msg = "Error occured  Cause: " + hex;
        System.out.println(msg);
      } finally {
        if (session != null) {
          session.close();
        }
      }

    }


    return false;


  }

  @Override
  public User getUser(int idUser){
    Session session = openCurrentSession();
    if (session != null) {
      try {
        String sql = "From User where id_user= :idUser";
        Query query = session.createQuery(sql);
        query.setParameter("idUser", idUser);
        User user = (User) query.uniqueResult();
        if (user != null) {

          closeCurrentSession();
          return user;
        }
      } catch (Exception exception) {
        System.out.println("Exception occred while reading user data: " + exception.getMessage());
        return null;
      }

    } else {
      System.out.println("DB server down.....");

    }
    return null;
  }

  @Override
  public User getEmailFromDB(String email){
    Session session = openCurrentSession();
    if (session != null) {
      try {
        String sql = "From User where email= :Email";
        Query query = session.createQuery(sql);
        query.setParameter("Email", email);
        User user = (User) query.uniqueResult();
        if (user != null) {

          closeCurrentSession();
          return user;
        }
      } catch (Exception exception) {
        System.out.println("Exception occred while reading user data: " + exception.getMessage());
        return null;
      }

    } else {
      System.out.println("DB server down.....");

    }
    return null;
  }

  @Override
  public User login(String username, String password) {
    User user;
    Session session = openCurrentSession();
    if (session != null) {
      try {
        String sql = "From User where username= :user";
        Query query = session.createQuery(sql);
        query.setParameter("user", username);
        user = (User) query.uniqueResult();

        if (user != null) {
          System.out.println("User: " + user.toString());
          closeCurrentSession();
          return user;
        }
      } catch (Exception exception) {
        System.out.println("Exception occred while reading user data: "
                + exception.getMessage());
        return null;
      }

    } else {
      System.out.println("DB server down.....");
    }
    return null;
  }

  @Override
  public Double currentMonthProfit(Integer number,int id) {
    double currentMonthProfit = 0;
    int num = 0;
    List results;
    Session session = openCurrentSession();
    if (session != null) {
      try {
        String sql = "SELECT event.priceEvent FROM Event event, Payment payment where  year(eventDate)  = YEAR(CURDATE()) and  month(eventDate)= :monthNumber and event.id_event=payment.id_event and payment.status_payment=1 and event.createdUserId= :idUser";
        results = executeCurrentDataChartSQL(number, session, sql, id);
        while (num < results.size()) {
          currentMonthProfit += (double) results.get(num);
          num++;
        }
        if (currentMonthProfit != 0) {
          closeCurrentSession();
          return currentMonthProfit;
        }
      } catch (Exception exception) {
        System.out.println("Exception occred while reading user data: "
                + exception.getMessage());
        return null;
      }

    } else {
      System.out.println("DB server down.....");
    }
    return 0.0;
  }

  @Override
  public Integer currentMonthEvent(Integer number,int id) {
    int currentMonthEventCount = 0;
    int num = 0;
    Session session = openCurrentSession();
    if (session != null) {
      try {
        String sql = "FROM Event  where  year(eventDate)= YEAR(CURDATE()) and  month(eventDate)= :monthNumber and createdUserId= :idUser";
        currentMonthEventCount = getInteger(number, currentMonthEventCount, num, session, sql, id);
        if (currentMonthEventCount != 0)
          return currentMonthEventCount;
      } catch (Exception exception) {
        System.out.println("Exception occred while reading user data: "
                + exception.getMessage());
        return null;
      }

    } else {
      System.out.println("DB server down.....");
    }
    return 0;
  }

  @Override
  public Integer currentMonthMembers(Integer number,int id) {
    int currentMonthMembersCount = 0;
    int num = 0;
    Session session = openCurrentSession();
    if (session != null) {
      try {
        String sql = "FROM Event event, Member person   where  year(eventDate)= YEAR(CURDATE()) and  month(eventDate)= :monthNumber  and person.id_event = event.id_event and createdUserId= :idUser";
        currentMonthMembersCount = getInteger(number, currentMonthMembersCount, num, session, sql, id);
        if (currentMonthMembersCount != 0)

          return currentMonthMembersCount;
      } catch (Exception exception) {
        System.out.println("Exception occred while reading user data: "
                + exception.getMessage());
        return null;
      }

    } else {
      System.out.println("DB server down.....");
    }
    return 0;
  }

  @Override
  public Event get(int contactId) {
    Session session = openCurrentSession();
    if (session != null) {
      try {
        String sql = "From Event where id_event= :ID";
        Query query = session.createQuery(sql);
        query.setParameter("ID", contactId);
        Event event = (Event) query.uniqueResult();
        if (event != null) {
          closeCurrentSession();
          return event;
        }
      } catch (Exception exception) {
        System.out.println("Exception occred while reading user data: " + exception.getMessage());
        return null;
      }

    } else {
      System.out.println("DB server down.....");
    }
    return null;
  }

  @Override
  public Member getMember(int id_event,String email){
    Session session = openCurrentSession();
    if (session != null) {
      try {
        String sql = "From Member where id_event= :ID and email= :email";
        Query query = session.createQuery(sql);
        query.setParameter("ID", id_event);
        query.setParameter("email", email);
        Member member = (Member) query.uniqueResult();
        if (member != null) {
          closeCurrentSession();
          return member;
        }
      } catch (Exception exception) {
        System.out.println("Exception occred while reading user data: " + exception.getMessage());
        return null;
      }

    } else {
      System.out.println("DB server down.....");
    }
    return null;
  }

  @Override
  public Payment getPayment(int contactId,int perId) {
    Session session = openCurrentSession();
    if (session != null) {
      try {
        String sql = "From Payment where id_payment= :ID and id_person= :IDper";
        Query query = session.createQuery(sql);
        query.setParameter("ID", contactId);
        query.setParameter("IDper", perId);
        Payment payment = (Payment) query.uniqueResult();
        if (payment != null) {
          closeCurrentSession();
          return payment;
        }
      } catch (Exception exception) {
        System.out.println("Exception occred while reading user data: " + exception.getMessage());
        return null;
      }

    } else {
      System.out.println("DB server down.....");
    }
    return null;
  }

  @Override
  public Shedule getShedule(int contactId) {
    Session session = openCurrentSession();
    if (session != null) {
      try {
        String sql = "From Shedule where id_event= :ID";
        Query query = session.createQuery(sql);
        query.setParameter("ID", contactId);
        Shedule shedule = (Shedule) query.uniqueResult();
        if (shedule != null) {
          closeCurrentSession();
          return shedule;
        }
      } catch (Exception exception) {
        System.out.println("Exception occred while reading user data: " + exception.getMessage());
        return null;
      }

    } else {
      System.out.println("DB server down.....");
    }
    return null;
  }

  @Override
  public List<Event> listEvent(Integer id) {
    Session session = openCurrentSession();
    if (session != null) {
      try {
        String sql = "From Event where createdUserId= :userID";
        Query query = session.createQuery(sql);
        query.setParameter("userID", id);
        List<Event> listEvents = query.list();

        if (listEvents != null) {
          closeCurrentSession();
          return listEvents;
        }
      } catch (Exception exception) {
        System.out.println("Exception occred while reading user data: " + exception.getMessage());
        return null;
      }

    } else {
      System.out.println("DB server down.....");
    }
    return null;

  }

  @Override
  public List<ResetPassword> resetList(){
    Session session = openCurrentSession();
    if (session != null) {
      try {
        String sql = "From ResetPassword ";
        Query query = session.createQuery(sql);

        List<ResetPassword> resetPasswordList = query.list();

        if (resetPasswordList != null) {
          closeCurrentSession();
          return resetPasswordList;
        }
      } catch (Exception exception) {
        System.out.println("Exception occred while reading user data: " + exception.getMessage());
        return null;
      }

    } else {
      System.out.println("DB server down.....");
    }
    return null;
  }

  @Override
  public List<Event> listEventPaid(Integer id) {
    Session session = openCurrentSession();
    if (session != null) {
      try {
        String sql = "From Event where createdUserId= :userID and eventType=1";
        Query query = session.createQuery(sql);
        query.setParameter("userID", id);
        List<Event> listEvents = query.list();

        if (listEvents != null) {
          closeCurrentSession();
          return listEvents;
        }
      } catch (Exception exception) {
        System.out.println("Exception occred while reading user data: " + exception.getMessage());
        return null;
      }

    } else {
      System.out.println("DB server down.....");
    }
    return null;

  }


  @Override
  public List<Payment> listPayments(Integer id) {
    Session session = openCurrentSession();
    if (session != null) {
      try {
        String sql = "From Payment where id_event= :ID";
        Query query = session.createQuery(sql);
        query.setParameter("ID", id);
        List<Payment> paymentList = query.list();

        if (paymentList != null) {
          closeCurrentSession();
          return paymentList;
        }
      } catch (Exception exception) {
        System.out.println("Exception occred while reading user data: " + exception.getMessage());
        return null;
      }

    } else {
      System.out.println("DB server down.....");
    }
    return null;

  }

  @Override
  public List<Member> listAllMembr() {
    Session session = openCurrentSession();
    if (session != null) {
      try {
        String sql = "From Member";
        Query query = session.createQuery(sql);

        List<Member> personList = query.list();
        if (personList != null) {
          closeCurrentSession();
          return personList;

        }
      } catch (Exception exception) {
        System.out.println("Exception occred while reading user data: " + exception.getMessage());
        return null;
      }
    } else {
      System.out.println("DB server down.....");
    }
    return null;

  }


  @Override
  public List<Member> listPerson(Integer id) {
    Session session = openCurrentSession();
    if (session != null) {
      try {
        String sql = "From Member where id_event= :ID";
        Query query = session.createQuery(sql);
        query.setParameter("ID", id);
        List<Member> personList = query.list();
        if (personList != null) {
          closeCurrentSession();
          return personList;

        }
      } catch (Exception exception) {
        System.out.println("Exception occred while reading user data: " + exception.getMessage());
        return null;
      }
    } else {
      System.out.println("DB server down.....");
    }
    return null;

  }


  @Override
  public List<User> listUsers() {
    Session session = openCurrentSession();
    if (session != null) {
      try {
        String sql = "From User where deleted=0";
        Query query = session.createQuery(sql);
        List<User> userList = query.list();
        if (userList != null) {
          closeCurrentSession();
          return userList;
        }
      } catch (Exception exception) {
        System.out.println("Exception occred while reading user data: " + exception.getMessage());
        return null;
      }
    } else {
      System.out.println("DB server down.....");
    }
    return null;

  }

  @Override
  public List<Feedback> listFeedback(Integer id) {
    Session session = openCurrentSession();
    if (session != null) {
      try {
        String sql = "From Feedback";
        Query query = session.createQuery(sql);
        List<Feedback> feedbackList = query.list();
        if (feedbackList != null) {
          closeCurrentSession();
          return feedbackList;
        }
      } catch (Exception exception) {
        System.out.println("Exception occred while reading user data: " + exception.getMessage());
        return null;
      }
    } else {
      System.out.println("DB server down.....");
    }
    return null;

  }

  @Override
  public boolean registerEventMember(String name, String surname, String email,int invoice, int id) {
    System.out.println("Insert");
    int countMember=0;
    Session session = openCurrentSessionwithTransaction();
    if (session != null) {
      try {
        Event event=get(id);
        if (event.getPersonLimit() > 0) {
          countMember=event.getPersonLimit();
          countMember--;
          Member member = new Member();
          member.setName(name);
          member.setSurname(surname);
          member.setEmail(email);
          member.setId_event(id);
          session.save(member);
          event.setPersonLimit(countMember);
          session.update(event);

          Payment payment= new Payment();
          payment.setId_event(id);
          payment.setId_person(member.getId_person());
          payment.setInvoice(invoice);
          payment.setStatus_payment(0);
          payment.setInvoiceSend(0);
          payment.setBackCash(0);
          session.save(payment);

          session.getTransaction().commit();
        }
        return true;
      } catch (HibernateException hex) {
        try {
          session.getTransaction().rollback();
        } catch (Exception e) {
          //just log warn
        }
        String msg = "Error occured  Cause: " + hex;
        System.out.println(msg);
      } finally {
        if (session != null) {
          session.close();
        }
      }

    }


    return false;


  }

  @Override
  public boolean registerEventMemberFree(String name, String surname, String email, int id) {
    System.out.println("Insert");
    int countMember=0;
    Session session = openCurrentSessionwithTransaction();
    if (session != null) {
      try {
        Event event=get(id);
        if (event.getPersonLimit() > 0) {
          countMember=event.getPersonLimit();
          countMember--;
          Member member = new Member();
          member.setName(name);
          member.setSurname(surname);
          member.setEmail(email);
          member.setId_event(id);
          event.setPersonLimit(countMember);
          session.update(event);
          session.save(member);
          session.getTransaction().commit();
        }
        return true;
      } catch (HibernateException hex) {
        try {
          session.getTransaction().rollback();
        } catch (Exception e) {
          //just log warn
        }
        String msg = "Error occured  Cause: " + hex;
        System.out.println(msg);
      } finally {
        if (session != null) {
          session.close();
        }
      }

    }


    return false;


  }

  @Override
  public boolean updateStatusPayment(int idPerson,int idEvent,int status) {
    System.out.println("Update");
    Session session = openCurrentSessionwithTransaction();
    if (session != null) {
      try {
        Payment payment=getPayment(idEvent,idPerson);
        payment.setStatus_payment(status);
        session.update(payment);
        session.getTransaction().commit();
        return true;


      } catch (HibernateException hex) {
        try {
          session.getTransaction().rollback();
        } catch (Exception e) {
          //just log warn
        }
        String msg = "Error occured  Cause: " + hex;
        System.out.println(msg);
      } finally {
        if (session != null) {
          session.close();
        }
      }

    }


    return false;


  }

  @Override
  public boolean updateStatusInvoiceSend(int idPerson,int idPayment,int status){
    System.out.println("Update");
    Session session = openCurrentSessionwithTransaction();
    if (session != null) {
      try {
        Payment payment=getPayment(idPayment,idPerson);
        payment.setInvoiceSend(status);
        session.update(payment);
        session.getTransaction().commit();
        return true;


      } catch (HibernateException hex) {
        try {
          session.getTransaction().rollback();
        } catch (Exception e) {
          //just log warn
        }
        String msg = "Error occured  Cause: " + hex;
        System.out.println(msg);
      } finally {
        if (session != null) {
          session.close();
        }
      }

    }


    return false;


  }


}









