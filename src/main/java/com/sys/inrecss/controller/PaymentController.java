package com.sys.inrecss.controller;

import com.sys.inrecss.dao.UserDao;
import com.sys.inrecss.model.Event;
import com.sys.inrecss.model.Member;
import com.sys.inrecss.model.Payment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class PaymentController {


        @Autowired
        private UserDao userDao;

        @RequestMapping(value = "/payments")
        public ModelAndView show_payments(HttpServletRequest request, HttpServletResponse response) {
            ModelAndView mav = new ModelAndView("payments");
            HttpSession session = request.getSession();
            String id = (String) session.getAttribute("id_user");
            List<Event> eventList = userDao.listEvent(Integer.valueOf(id));
            mav.addObject("listContact", eventList);
            return mav;
        }


    @RequestMapping(value = "/getEventPayments")
    public ModelAndView get_payments(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView("payments");
        String id =  request.getParameter("id_ev");
        HttpSession session = request.getSession();
        String id_user = (String) session.getAttribute("id_user");
        Event event=userDao.get(Integer.parseInt(id));
        event.getNameEvent();
        List<Payment> paymentList = userDao.listPayments(Integer.valueOf(id));
        mav.addObject("paymentList", paymentList);
        List<Member> memberList = userDao.listPerson(Integer.valueOf(id));
        mav.addObject("memberList", memberList);
        List<Event> eventList = userDao.listEventPaid(Integer.valueOf(id_user));
        mav.addObject("listContact", eventList);
        session.setAttribute("get","selected");
        session.setAttribute("nameEvent",event.getNameEvent());
        return mav;
    }

    @RequestMapping(value = "/updateStatus")
    public ModelAndView updateStatus(HttpServletRequest request, HttpServletResponse response) {

        String idUpdateStatus =  request.getParameter("idUpdateStatus");
        String status =  request.getParameter("status");
        String idPerson =  request.getParameter("idPerson");
        String getIdEvent =  request.getParameter("getIdEvent");
        ModelAndView mav = new ModelAndView("redirect:/getEventPayments?id_ev="+getIdEvent);
        boolean isSuccess = userDao.updateStatusPayment(Integer.parseInt(idPerson),Integer.parseInt(idUpdateStatus),Integer.parseInt(status));
        HttpSession session = request.getSession();
        if(isSuccess)
        {
            session.setAttribute("update", "success");
        }else
        {
            session.setAttribute("update", "failed");
        }

        return mav;
    }

}
