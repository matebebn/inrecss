package com.sys.inrecss.controller;

import com.sys.inrecss.dao.UserDao;
import com.sys.inrecss.model.ResetPassword;
import com.sys.inrecss.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

@Controller
public class ForgotPasswordController {

    @Autowired
    private EmailController emailController;

    @Autowired
    private UserDao userDao;

    @RequestMapping(value = "/forgotPassword")
    public ModelAndView forgotPassword(HttpServletRequest request, HttpServletResponse response) {
        String  key = request.getParameter("key");
        ModelAndView mav = new ModelAndView("forgot_password");
        List<ResetPassword> resetPasswordList = userDao.resetList();
        mav.addObject("listContact", resetPasswordList);
        mav.addObject("key", key);
        return mav;
    }


    @RequestMapping(value = "/updatePassword")
    public ModelAndView updatePassword(HttpServletRequest request, HttpServletResponse response) {

        ModelAndView mav = null;
        String  reset_password = request.getParameter("reset_password");
        String  conPassword = request.getParameter("conPassword");
        String  idUserReset = request.getParameter("idUserReset");
        String  reset_token = request.getParameter("reset_token");

        System.out.println(reset_password);
        System.out.println(conPassword);
        System.out.println(idUserReset);
        System.out.println(reset_token);
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12); // Strength set as 12
        String encodedPassword = encoder.encode(reset_password);

        if(reset_password.equals(conPassword))
        {
            boolean isSuccess = userDao.resetPassword(encodedPassword, Integer.parseInt(idUserReset));
            if (isSuccess)
            {
                 mav = new ModelAndView("index");
                mav.addObject("resetPassword","success");
            }
            else
            {
                 mav = new ModelAndView("redirect:/forgotPassword?key="+reset_token);
                mav.addObject("message","Error, operation was failed ");
            }
        }
        else
        {
             mav = new ModelAndView("redirect:/forgotPassword?key="+reset_token);
            mav.addObject("message","Passwords dont match");

        }





        return mav;
    }




    @RequestMapping(value = "/getEmailFromDB")
    public ModelAndView getEmialFromDB(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView("forgot_password");
        String email =(request.getParameter("email"));

        User user=userDao.getEmailFromDB(email);
        if(user!=null)
        {

            mav.addObject("message","We sent a link to change password");

            java.sql.Timestamp  intime = new java.sql.Timestamp(new
                    java.util.Date().getTime());
            Calendar cal = Calendar.getInstance();
            cal.setTimeInMillis(intime.getTime());
            cal.add(Calendar.MINUTE, 5);
            java.sql.Timestamp  exptime = new Timestamp(cal.getTime().getTime());
            int rand_num = (int) (Math.random() * 1000000);
            String rand = Integer.toString(rand_num);
            String finale =(rand+""+intime); //
            String hash = String.valueOf(finale.hashCode()); //hash code
            String link = "http://localhost:8080/Program_war_exploded/forgotPassword";
            String messageText = "<h3> Click <a style=\"margin-top: 5%;margin-bottom:5%;width: 200px;height: 50px\"  href="+link+"?key="+hash+" class=\"btn btn-success btn-block\">Reset password</a> To Reset your Password. You must reset your password within 5 minutes.</h3>!";
            boolean isSuccess=userDao.addResetPassword(Integer.parseInt(user.getIdUser()),hash,exptime,intime);
            if(isSuccess)
            {

                emailController.reset_password(email,messageText);
            }
            else
            {
                System.out.println("ERROR");
            }

        }
        else
        {
            mav.addObject("message","Error, user dont exist or check the entered email");
        }

        return mav;
    }
}
