package com.sys.inrecss.controller;

import com.sys.inrecss.dao.UserDao;
import com.sys.inrecss.model.Event;
import com.sys.inrecss.model.User;
import com.sys.inrecss.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class LoginController {


  @Autowired
  private  UserService userService;

  @Autowired
  private UserDao userDao;

  @Autowired
  public LoginController(UserService userService) {
    this.userService = userService;
  }

  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public ModelAndView showLogin() {
    ModelAndView mav = new ModelAndView("index");
    mav.addObject("user", new User());

    return mav;
  }

  @RequestMapping(value = "/loginMain", method = RequestMethod.GET)
  public ModelAndView mainLogin() {
    ModelAndView mav = new ModelAndView("login");
    mav.addObject("login", new User());

    return mav;
  }


  @RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
  public ModelAndView loginProcess(HttpServletRequest request) {
    ModelAndView mav;
    User userData;
    int numb=0;
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if(username!=null) {
      if (username.trim().length() >= 0 && username != null &&
              password.trim().length() >= 0 && password != null) {



          BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12); // Strength set as 12
          String encodedPassword = encoder.encode(password);

          System.out.println(encodedPassword);
          userData = userService.login(username, encodedPassword);
            boolean valid=false;
         if(encoder.matches(password,userData.getPasswordUser()))
         {
             System.out.println("validated success");
             valid=true;
         }

        if (userData != null && valid==true ) {
          mav = new ModelAndView("login_pass");
          mav.addObject("username", userData.getUserName());
          mav.addObject("password", userData.getPasswordUser());

          HttpSession session = request.getSession();
          session.setAttribute("id_user", userData.getIdUser());
          session.setAttribute("username", userData.getUserName());
          session.setAttribute("password", userData.getPasswordUser());
          session.setAttribute("email", userData.getEmailUser());
          session.setAttribute("telefon", userData.getPhoneNumberUser());
          session.setAttribute("type", userData.getTypeAccountUser());

          int currentMonthEvent = 0, currentMonthMembers = 0;
          double currentProfitList = 0;
          String monthProfit = "p", monthEvent = "e", monthMembers = "m";
          String id = (String) session.getAttribute("id_user");
          List<Event> eventList = userDao.listEvent(Integer.valueOf(id));
          mav.addObject("listContact", eventList);
          while (numb < 11) {
            currentProfitList = userDao.currentMonthProfit(numb + 1,Integer.parseInt(id));
            currentMonthEvent = userDao.currentMonthEvent(numb + 1, Integer.parseInt(id));
            currentMonthMembers = userDao.currentMonthMembers(numb + 1,Integer.parseInt(id));
            mav.addObject((monthProfit + numb), currentProfitList);
            mav.addObject((monthEvent + numb), currentMonthEvent);
            mav.addObject((monthMembers + numb), currentMonthMembers);
            numb++;
          }


        } else {
          mav = new ModelAndView("login");
          mav.addObject("message", "Username or Password is wrong!!");

        }
      } else {
        mav = new ModelAndView("login");


      }

    }
    else
    {
      mav = new ModelAndView("login");
    }
    return mav;
  }


  @RequestMapping(value = {"/login_pass"})
  @Scope("session")
  public ModelAndView login_pass(HttpServletRequest request) {
    int numb=0;
    ModelAndView mav = new ModelAndView("login_pass");
    HttpSession session = request.getSession();
    String id = (String) session.getAttribute("id_user");
    if(id!=null) {
      List<Event> eventList = userDao.listEvent(Integer.valueOf(id));

      mav.addObject("listContact", eventList);

      int currentMonthEvent = 0, currentMonthMembers = 0;
      double currentProfitList = 0;
      String monthProfit = "p", monthEvent = "e", monthMembers = "m";
      while (numb < 11) {
        currentProfitList = userDao.currentMonthProfit(numb + 1,Integer.parseInt(id));
        currentMonthEvent = userDao.currentMonthEvent(numb + 1,Integer.parseInt(id));
        currentMonthMembers = userDao.currentMonthMembers(numb + 1,Integer.parseInt(id));
        mav.addObject((monthProfit + numb), currentProfitList);
        mav.addObject((monthEvent + numb), currentMonthEvent);
        mav.addObject((monthMembers + numb), currentMonthMembers);
        numb++;
        mav.setViewName("login_pass");
      }
    }
    else
      {
        mav.setViewName("login");
      }
    return mav;


  }




}
