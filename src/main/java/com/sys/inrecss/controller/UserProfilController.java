package com.sys.inrecss.controller;

import com.sys.inrecss.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
public class UserProfilController {
    @Autowired
    private UserDao userDao;


    @RequestMapping(value = {"/profil_user"})
    public ModelAndView profil_user(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("profil_user");




        return mav;
    }



    @ModelAttribute("userEdit")
    @RequestMapping(value = "/editProfil", method = RequestMethod.POST)
    public ModelAndView editProfil(HttpServletRequest request) {

        String hiddenPassword =(request.getParameter("hiddenPassword"));
        String password =(request.getParameter("passwordNew"));
        String passwordConfirm =(request.getParameter("passwordConfirm"));
        String actualPassword =(request.getParameter("actualPassword"));
        String email =(request.getParameter("email"));
        String phone = (request.getParameter("phone"));
        String message="";
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12); // Strength set as 12
        if(password.equals("")){

            password = hiddenPassword;
            return getModelAndView(request, hiddenPassword, password, actualPassword, email, phone);
        }
        else{

            String encodedPassword = encoder.encode(password);
            return getModelAndView(request, hiddenPassword, encodedPassword, actualPassword, email, phone);


        }

    }

    private ModelAndView getModelAndView(HttpServletRequest request, String hiddenPassword, String password, String actualPassword, String email, String phone) {

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12); // Strength set as 12

        if(encoder.matches(actualPassword,hiddenPassword)) {

            int contactId = Integer.parseInt(request.getParameter("id_edit"));
            boolean isSuccess=userDao.editProfil(password, email, phone, contactId);
            System.out.println(isSuccess);
            if (isSuccess) {
                HttpSession session = request.getSession();
                session.setAttribute("password", password);
                session.setAttribute("email", email);
                session.setAttribute("telefon", phone);
                session.setAttribute("message","success");
            }
            return new ModelAndView("redirect:/profil_user");
        }
        else
        {
            HttpSession session = request.getSession();
            session.setAttribute("message","yes");
            return new ModelAndView("redirect:/profil_user");

        }
    }

}
