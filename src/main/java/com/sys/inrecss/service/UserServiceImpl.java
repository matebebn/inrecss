package com.sys.inrecss.service;

import com.sys.inrecss.dao.UserDao;
import com.sys.inrecss.dao.UserDaoImpl;
import com.sys.inrecss.model.Event;
import com.sys.inrecss.model.User;

import java.util.List;


public class UserServiceImpl implements UserService {

  private  UserDao userDao = new UserDaoImpl();



  @Override
  public List<Event> listEvent(Integer id){return  userDao.listEvent(id);}

  @Override
  public Double currentMonthProfit(Integer number,int id){return  userDao.currentMonthProfit(number,id);}

  @Override
  public Integer currentMonthEvent(Integer number, int id){return  userDao.currentMonthEvent(number,id);}

  @Override
  public User login(String username, String password) {
   return userDao.login(username, password);
  }

}
