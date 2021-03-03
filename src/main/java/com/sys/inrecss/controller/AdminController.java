package com.sys.inrecss.controller;

import com.sys.inrecss.dao.UserDao;
import com.sys.inrecss.model.User;
import com.sys.inrecss.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class AdminController {
    @Autowired
    public UserService userService;

    @Autowired
    private UserDao userDao;

    @RequestMapping(value="/panel_admin")
    public ModelAndView panel_admin(ModelAndView model) throws IOException {
     List<User> listContact = userDao.listUsers();
     model.addObject("listContact", listContact);
     model.setViewName("panel_admin");

        return model;
    }

    @ModelAttribute("admin")
    @RequestMapping(value = "/deleteContact", method = RequestMethod.GET)
    public ModelAndView deleteContact(HttpServletRequest request) {
        int contactId = Integer.parseInt(request.getParameter("id_delete"));
        boolean isSuccess;
        if(contactId==1){
            isSuccess=false;
        }else{
            isSuccess=userDao.delete(contactId);
        }


        if(isSuccess) {
            HttpSession session = request.getSession();
            session.setAttribute("delete", "deleted"); }
        else
        {
            HttpSession session = request.getSession();
            session.setAttribute("delete", "notDeleted");
        }
        return new ModelAndView("redirect:/panel_admin");
    }



    @ModelAttribute("admin")
    @RequestMapping(value = "/editContact", method = RequestMethod.POST)
    public ModelAndView editContact(HttpServletRequest request) {
        String username =(request.getParameter("username"));
        String email =(request.getParameter("email"));
        String password =(request.getParameter("password"));
        String phone =(request.getParameter("phone"));
        String type = (request.getParameter("typeUP"));
        int contactId = Integer.parseInt((request.getParameter("id_Update")));
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12); // Strength set as 12
        String encodedPassword = encoder.encode(password);
        boolean isSuccess=userDao.edit(username,encodedPassword,email,phone,type,contactId);
        if(isSuccess)
        {
            HttpSession session = request.getSession();
            session.setAttribute("register","registered");
        }
        else
        {
            HttpSession session = request.getSession();
            session.setAttribute("register","notRegistered");
        }


        return new ModelAndView("redirect:/panel_admin");
    }



    @ModelAttribute("user")
    @RequestMapping(value = "/registerUser_Admin", method = RequestMethod.POST)
    public ModelAndView registerUser_Admin(HttpServletRequest request, HttpServletResponse response) {
        String username =(request.getParameter("username"));
        String email =(request.getParameter("email"));
        String password =(request.getParameter("password"));
        String phone =(request.getParameter("phone"));
        String type = (request.getParameter("type"));
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12); // Strength set as 12
        String encodedPassword = encoder.encode(password);
        userDao.registerAdmin(username,encodedPassword,email,phone,type);

        return new ModelAndView("redirect:/panel_admin");
    }

}
