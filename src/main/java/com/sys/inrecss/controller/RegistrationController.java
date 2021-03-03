package com.sys.inrecss.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sys.inrecss.dao.UserDao;
import com.sys.inrecss.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class RegistrationController {
  @Autowired
  public UserService userService;



  @Autowired
  public UserDao userDao;

  @RequestMapping(value = "/register", method = RequestMethod.GET)
  public ModelAndView showRegister() {
    ModelAndView mav = new ModelAndView("register");
  //  mav.addObject("user", new User());

    return mav;
  }

  @RequestMapping(value = "/registerMain", method = RequestMethod.GET)
  public ModelAndView registerMainPage() {
    ModelAndView mav = new ModelAndView("register");
 //   mav.addObject("user", new User());

    return mav;
  }






  @RequestMapping(value = "/registerProcess", method = RequestMethod.POST)
public ModelAndView addUser(HttpServletRequest request){
    String username =(request.getParameter("username"));
    String email =(request.getParameter("email"));
    String password =(request.getParameter("password"));
    String phone =(request.getParameter("phone"));

  String message="";
  if(!username.matches("^[a-z\\d\\.]{5,}$")){message+="\nUsername must contain at least 5 or more characters.\n";}
  if(!password.matches("^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$")){message+="\nPassword must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters.\n"; }
  if(!email.matches("^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")){message+="\n Wrong email.\n";}
  if(!phone.matches("[0-9]{3}[0-9]{3}[0-9]{3}")){message+="\n Wrong phone number.\n";}

  if(message == ""){



      BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12); // Strength set as 12
      String encodedPassword = encoder.encode(password);

      System.out.println(encodedPassword);
   boolean isSuccess= userDao.register(username,encodedPassword,email,phone);
      HttpSession session = request.getSession();
   if(isSuccess) {
       session.setAttribute("register", "registered");
       return new ModelAndView("redirect:/");
   }
   else
   {
       ModelAndView mav  = new ModelAndView("register");
       mav.addObject("message","Username already exists");
       return mav;
   }

  }
  else{

    ModelAndView mav  = new ModelAndView("register");
    mav.addObject("message", message);
    return mav;
  }



}




}
