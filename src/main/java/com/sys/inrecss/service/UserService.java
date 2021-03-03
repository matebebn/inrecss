package com.sys.inrecss.service;


import com.sys.inrecss.model.Event;
import com.sys.inrecss.model.User;

import java.util.List;


public interface UserService {

 // int register(User user);

// int registerAdmin(User user);

  User login(String username, String password);


  Double currentMonthProfit(Integer number,int id);

  Integer currentMonthEvent (Integer number,int id);

  //void create_event(String nazwa,String data,String godzina,String adres,String uczestnik,String platne,String bank,String online,String fak,String koszt,String contactId);

   //List<User> list();

  List<Event> listEvent(Integer id);

  // void delete(int contactId);

  //void edit(String nazwa,String email,String telefon,String uprawnienia,int contactId);

//  void editProfil(String nazwa,String password,String email,String telefon,int contactId);
}
