package com.sys.inrecss.controller;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;
import com.sys.inrecss.dao.UserDao;
import com.sys.inrecss.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@Controller
public class EventController {
    private static final long serialVersionUID = 1L;

    @Autowired
    private EmailController emailController;

    @Autowired
    private UserDao userDao;

    @RequestMapping(value = "/create_event")
    public ModelAndView show_event(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView("create_event");

        return mav;
    }


    @RequestMapping(value = "/authorize_payment")
    public void authorize_payment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ModelAndView mav=null;
        String product ="Ticket event - "+request.getParameter("nameProduct");
        String subtotal = request.getParameter("eventPricePay");


        String nameMember =(request.getParameter("nameMember"));
        String surnameMember =(request.getParameter("surnameMember"));
        String emailMember =(request.getParameter("emailMember"));
        String personInvoice =(request.getParameter("personInvoice"));
        String eventT =(request.getParameter("eventT"));
        String id_event =(request.getParameter("id_event"));
        HttpSession session = request.getSession();
        boolean isSuccess = userDao.registerEventMember(nameMember,surnameMember,emailMember,Integer.parseInt(personInvoice),Integer.parseInt(id_event));
        if(isSuccess){
            session.setAttribute("email", emailMember);
            session.setAttribute("id_event", id_event);
        }else
        {
            System.out.println("error register in db");
        }




        OrderDetail orderDetail = new OrderDetail(product);

        try {
            PaymentServices paymentServices = new PaymentServices();
            String approvalLink = paymentServices.authorizePayment(orderDetail);
            response.sendRedirect(approvalLink);
        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("error").forward(request, response);

        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    @RequestMapping(value = "/execute_payment")
    public ModelAndView execute_payment(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = null;
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");
        System.out.println(paymentId);
        System.out.println(payerId);
        payerId="MJA7WMGC52KF6";

        try {
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.executePayment(paymentId, payerId);

            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);

            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);
            HttpSession session = request.getSession();
            String id= String.valueOf(session.getAttribute("id_event"));
            String email= String.valueOf(session.getAttribute("email"));
            Member member=userDao.getMember(Integer.parseInt(id),email);
            boolean isSuccess=userDao.updateStatusPayment(member.getId_person(), Integer.parseInt(id),1);
            mav=new ModelAndView("redirect:/event_page?id_ev="+id);
           if(isSuccess) {
               session.setAttribute("register", "registered");
               session.setAttribute("pay", "online");
               session.setAttribute("regProcess", "stop");
               session.setAttribute("key", "");
           }
           else {
               System.out.println("Update status payment failed");
           }

        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            mav=new ModelAndView("error");
        }

        return mav;
    }

    @RequestMapping(value="/review_payment",method = RequestMethod.GET)
    public ModelAndView show_pay(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = null;
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");

        try {
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.getPaymentDetails(paymentId);

            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();

            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);
            request.setAttribute("shippingAddress", shippingAddress);

            String url = "review_payment.jsp?paymentId=" + paymentId + "&PayerID=" + payerId;

            mav=new ModelAndView(url);

        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
           mav= new ModelAndView("error");
        }
        return mav;
    }

    @RequestMapping(value = "/cancel",method = RequestMethod.GET)
    public ModelAndView cancel_pay(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView("cancel");

        return mav;
    }



    @ModelAttribute("eventPage")
    @RequestMapping(value="/event_page",method = RequestMethod.GET)
    public ModelAndView event_page(HttpServletRequest request) throws IOException {
        ModelAndView model = new ModelAndView("login_pass");
        int contactId = Integer.parseInt(request.getParameter("id_ev"));
        Event event = userDao.get(contactId);
        Shedule eventShedule = userDao.getShedule(contactId);
        model.addObject("contact",event);
        model.addObject("eventShedule",eventShedule);
        model.setViewName("event_page");

        return model;
    }


    @RequestMapping(value="/my_events")
    public ModelAndView my_events(ModelAndView model, HttpServletRequest request) throws IOException {
        HttpSession session = request.getSession();
            String id = (String) session.getAttribute("id_user");
        if(id!=null) {
            List<Event> eventList = userDao.listEvent(Integer.valueOf(id));
            List<Feedback> feedbackList = userDao.listFeedback(Integer.valueOf(id));
            model.addObject("listContact", eventList);
            model.addObject("listFeedback", feedbackList);
            model.setViewName("my_events");
        }
        else{
            model.setViewName("login");
        }
        return model;
    }



    @RequestMapping(value = "/makeEvent", method = RequestMethod.POST)
    public ModelAndView createEventProcess(HttpServletRequest request) {

        String userID =(request.getParameter("userID"));
        String nameEvent =(request.getParameter("nameEvent"));
        String personLimit =(request.getParameter("personLimit"));
        String dateEvent = (request.getParameter("dateEvent"));
        String phoneEvent = (request.getParameter("phoneEvent"));
        String startTimeEvent = (request.getParameter("startTimeEvent"));
        String endTimeEvent = (request.getParameter("endTimeEvent"));
        String emailEvent = (request.getParameter("emailEvent"));
        String typeEvent = (request.getParameter("typeEvent"));
        String eventDescription = (request.getParameter("eventDescription"));

        String addressEvent = (request.getParameter("addressEvent"));
        String eventCity = (request.getParameter("eventCity"));
        String eventSheduleDescription = (request.getParameter("eventSheduleDescription"));
        String priceEvent = (request.getParameter("priceEvent"));
        String bankPayment = (request.getParameter("bankPayment"));
        String onlinePayment = (request.getParameter("onlinePayment"));
        String tittleTransferBank =(request.getParameter("tittleTransferBank"));
        String numberAccountTransfer =(request.getParameter("numberAccountTransfer"));

        String eventSheduleYes = (request.getParameter("eventSheduleYes"));
        String whereEvent =(request.getParameter("whereEvent"));
        if(whereEvent.equals("online")) {
            addressEvent = "online";
            eventCity = "online";
        }

        if(eventSheduleYes.equals("no")){

             eventSheduleDescription="Empty";
        }
        if(typeEvent.equals("Paid"))
        {
            typeEvent="1";

        } else
        {
             typeEvent="0";
             priceEvent="0";
             bankPayment="0";
             onlinePayment="0";
             tittleTransferBank="No payment method";
             numberAccountTransfer="No payment method";
        }


        boolean isSuccess=userDao.create_event(nameEvent,personLimit,dateEvent,phoneEvent,startTimeEvent,endTimeEvent,emailEvent,typeEvent,eventDescription,addressEvent,eventCity,eventSheduleDescription,priceEvent,bankPayment,numberAccountTransfer,tittleTransferBank,onlinePayment,userID);
        HttpSession session = request.getSession();
        if(isSuccess){

            session.setAttribute("createdEvent","success");
        }

        session.setAttribute("createdEvent","failed");

        return new ModelAndView("redirect:/create_event");
    }

    @RequestMapping(value = "/sendFeedback", method = RequestMethod.POST)
    public ModelAndView sendFeedback(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        String name =(request.getParameter("name"));
        String feedbackDescription =(request.getParameter("feedbackDescription"));
        String rating =(request.getParameter("star"));
        String id_event =(request.getParameter("idEventFeedback"));
        boolean isSuccess=userDao.addFeedback(name,feedbackDescription,Integer.parseInt(rating),Integer.parseInt(id_event));
        if(isSuccess)
        {
            HttpSession session = request.getSession();
            session.setAttribute("sendFeedback","success");
        }

        modelAndView.setViewName("redirect:/event_page?id_ev="+id_event);
        return modelAndView;
    }


    @RequestMapping(value = "/registerMembersProcessStart", method = RequestMethod.POST)
    public ModelAndView registerMembersProcessStart(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        String id_event =(request.getParameter("id_event"));
        String eventType =(request.getParameter("eventType"));
        HttpSession session = request.getSession();
        session.setAttribute("regProcess","start");
        session.setAttribute("eventType",eventType);
        modelAndView.setViewName("redirect:/event_page?id_ev="+id_event);
        return modelAndView;
    }

    @RequestMapping(value = "/registerMembersProcessCancell", method = RequestMethod.POST)
    public ModelAndView registerMembersProcessCancell(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        String limit =(request.getParameter("limit"));
        String id_event =(request.getParameter("id_event"));
        System.out.println(limit);
        System.out.println(id_event);
        HttpSession session = request.getSession();
        session.setAttribute("regProcess","stop");
        session.setAttribute("key", 0);
        session.setAttribute("register","");
        modelAndView.setViewName("redirect:/event_page?id_ev="+id_event);
        return modelAndView;
    }


    @RequestMapping(value = "/register_User_Event", method = RequestMethod.POST)
    public ModelAndView register_User_Event(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        String nameMember =(request.getParameter("nameMember"));
        String surnameMember =(request.getParameter("surnameMember"));
        String emailMember =(request.getParameter("emailMember"));
        String personInvoice =(request.getParameter("personInvoice"));
        String eventT =(request.getParameter("eventT"));
        String id_event =(request.getParameter("id_event"));

        String eventAccountTran =(request.getParameter("eventAccountTran"));
        String eventTittleTran =(request.getParameter("eventTittleTran"));




        if(personInvoice.equals("on"))
        {
            personInvoice="1";
        }else{
            personInvoice="0";
        }




        boolean isSuccess;
        if(eventT.equals("1")){
            isSuccess=userDao.registerEventMember(nameMember,surnameMember,emailMember, Integer.parseInt(personInvoice), Integer.parseInt(id_event));

        }
        else
        {
            isSuccess=userDao.registerEventMemberFree(nameMember,surnameMember,emailMember, Integer.parseInt(id_event));
        }

        modelAndView.setViewName("redirect:/event_page?id_ev="+id_event);
        HttpSession session = request.getSession();
        if(!isSuccess){
            session.setAttribute("key", "");
            session.setAttribute("regProcess", "stop");
            session.setAttribute("register", "registeredFailed");
        }
        else {
            session.setAttribute("register", "registered");
            session.setAttribute("regProcess", "stop");
            session.setAttribute("key", "");
            String messageText="<h3>Here u have bank transfer details,<br> Account number : "+eventAccountTran+ "</h3><br><h3 Tittle bank transfer : "+eventTittleTran+"</h3>";
            emailController.registerMemberEvent(emailMember,messageText);
        }
        System.out.println(session.getAttribute("register"));
        return modelAndView;
    }



}
