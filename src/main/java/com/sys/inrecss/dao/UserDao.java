package com.sys.inrecss.dao;

import com.sys.inrecss.model.*;

import java.sql.Timestamp;
import java.util.List;


public interface UserDao {

      boolean updateStatusPayment(int idPerson,int idEvent,int status);

      boolean registerEventMember(String imie, String nawisko, String email,int invoice, int id );

      boolean registerEventMemberFree(String imie, String nawisko, String email, int id );

      boolean create_event(String nameEvent,String personLimit,String dateEvent,String phoneEvent,String startTimeEvent,String endTimeEvent,String emailEvent,String typeEvent,String eventDescription,String addressEvent,String eventCity,String eventSheduleDescription,String priceEvent,String bankPayment,String numberAccountTransfer,String tittleTransferBank,String onlinePayment,String userID);

      boolean registerAdmin(String username,String password,String email,String phone,String type);

      boolean register(String username,String password,String email,String phone);

      boolean editProfil(String password,String email,String phone,int contactId);

      boolean delete(Integer contactId);

      boolean edit(String username,String password,String email,String phone,String permission,int contactId);

      boolean addFeedback(String name,String description,int rate,int eventID);

      boolean updateStatusInvoiceSend(int idPerson,int idPayment,int status);

      boolean resetPassword(String password,int idUser );

      boolean addResetPassword(int idUser, String token, Timestamp expTime,Timestamp inTime);

      User getEmailFromDB(String email);

      User getUser(int idUser);

      List<ResetPassword> resetList();

      List<User> listUsers();

      List<Member> listAllMembr();

      List<Member> listPerson(Integer id);

      List<Event> listEvent(Integer id);

      List<Event> listEventPaid(Integer id);

      List<Payment> listPayments(Integer id);

      List listFeedback(Integer id);

      Integer currentMonthEvent (Integer number,int id);

      Integer currentMonthMembers  (Integer number,int id);

      Double currentMonthProfit(Integer number,int id);

      Event get(int contactId);

      Member getMember(int id_event,String email);

      Payment getPayment(int contactId,int perId);


      Shedule getShedule(int contactId);

      User login(String username, String password);







}
