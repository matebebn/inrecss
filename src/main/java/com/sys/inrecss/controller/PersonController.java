package com.sys.inrecss.controller;

import com.sys.inrecss.dao.UserDao;
import com.sys.inrecss.model.Event;
import com.sys.inrecss.model.Member;
import com.sys.inrecss.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class PersonController {

    @Autowired
    public UserService userService;

    @Autowired
    private UserDao userDao;

    @RequestMapping(value="/person_event")
    public ModelAndView panel_admin(ModelAndView model, HttpServletRequest request) throws IOException {
        HttpSession session = request.getSession();
        int id_us=  Integer.parseInt(String.valueOf(session.getAttribute("id_user")));
        List<Member> listPerson = userDao.listAllMembr();
        List<Event> eventList = userDao.listEvent(id_us);
        model.addObject("listContact", listPerson);
        model.addObject("eventList", eventList);
        model.setViewName("person_event");

        return model;
    }



}
