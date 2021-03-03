package com.sys.inrecss.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sys.inrecss.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.InputStreamSource;
import org.springframework.core.io.Resource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmailController {

	static String emailToRecipient;
    static String emailSubject;
    static String emailMessage;
    static String idEvent;
    static String idPay;
    static String idPer;
    static String emailList;
	static final String emailFromRecipient = "inrecss@gmail.com";

	static ModelAndView modelViewObj;

    @Autowired
    private UserDao userDao;

	@Autowired
	private JavaMailSender mailSenderObj;

	@RequestMapping(value = {"/", "emailForm"}, method = RequestMethod.GET)
	public ModelAndView showEmailForm(ModelMap model) {
		modelViewObj = new ModelAndView("invoice");
		return  modelViewObj;		
	}

	// This Method Is Used To Prepare The Email Message And Send It To The Client
	@RequestMapping(value = "sendEmail", method = RequestMethod.POST)
	public ModelAndView sendEmailToClient(HttpServletRequest request, final @RequestParam CommonsMultipartFile attachFileObj) {


        HttpSession session = request.getSession();

		// Reading Email Form Input Parameters		
		emailSubject = request.getParameter("subject");
		emailMessage = request.getParameter("message");
		emailToRecipient = request.getParameter("sendMail");
        idEvent = request.getParameter("idEven");
        idPay = request.getParameter("idPay");
        idPer = request.getParameter("idPer");
        emailList = request.getParameter("listEmail");

		// Logging The Email Form Parameters For Debugging Purpose
		System.out.println("\nReceipient?= " + emailToRecipient + ", Subject?= " + emailSubject + ", Message?= " + emailMessage + "\n");

		mailSenderObj.send(new MimeMessagePreparator() {
			public void prepare(MimeMessage mimeMessage) throws Exception {

                Resource res = new FileSystemResource(new File("C:\\Users\\Mateusz\\Desktop\\Praca Inżynierska\\Program\\src\\main\\webapp\\resources\\img\\logo.png"));
				MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");

               // List<String> list = new ArrayList<String>(Arrays.asList(emailList.split(" , ")));

                String[] recipientList = emailList.split(",");

                if(recipientList.length>0){
                    InternetAddress[] recipientAddress = new InternetAddress[recipientList.length];
                    int counter = 0;
                    for (String recipient : recipientList) {
                        recipientAddress[counter] = new InternetAddress(recipient.trim());
                        counter++;
                    }
                    mimeMessage.setRecipients(Message.RecipientType.TO, recipientAddress);
                    modelViewObj = new ModelAndView("redirect:/person_event");
                }else
                {
                    mimeMsgHelperObj.setTo(emailToRecipient);
                }

				mimeMsgHelperObj.setFrom(emailFromRecipient);				
				mimeMsgHelperObj.setText(emailMessage+"");
				mimeMsgHelperObj.setFrom("INRECSS");
				mimeMsgHelperObj.setSubject(emailSubject);
				mimeMsgHelperObj.addInline("logo", res);
                BodyPart textPart = new MimeBodyPart();
                String htmlText ="<p><h3>Powered by INRECSS\n© All right Reversed.</h3></p>";
                textPart.setContent(htmlText, "text/html");
                mimeMsgHelperObj.getMimeMultipart().addBodyPart(textPart);

				// Determine If There Is An File Upload. If Yes, Attach It To The Client Email				
				if ((attachFileObj != null) && (attachFileObj.getSize() > 0) && (!attachFileObj.equals(""))) {
					System.out.println("\nAttachment Name?= " + attachFileObj.getOriginalFilename() + "\n");
					mimeMsgHelperObj.addAttachment(attachFileObj.getOriginalFilename(), new InputStreamSource() {					
						public InputStream getInputStream() throws IOException {
							return attachFileObj.getInputStream();
						}
					});
				} else {
					System.out.println("\nNo Attachment Is Selected By The User. Sending Text Email!\n");

				}
			}
		});
		System.out.println("\nMessage Send Successfully.... Hurrey!\n");


        if(idPay.equals("0")){

        }else {
            boolean isSuccess = userDao.updateStatusInvoiceSend(Integer.parseInt(idPer), Integer.parseInt(idPay), 1);
            session.setAttribute("mail", "sent");
            modelViewObj = new ModelAndView("redirect:/getInvoice?id_ev="+idEvent);
            if (isSuccess) {
                System.out.println("Update Done");
            }
        }


		return  modelViewObj;
	}

	public void reset_password(final String reset_email, final String link){
        mailSenderObj.send(new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws Exception {

                Resource res = new FileSystemResource(new File("C:\\Users\\Mateusz\\Desktop\\Praca Inżynierska\\Program\\src\\main\\webapp\\resources\\img\\logo.png"));
                MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");


                Map<String, String> inlineImages = new HashMap<String, String>();
                inlineImages.put("image1", "C:\\Users\\Mateusz\\Desktop\\Praca Inżynierska\\Program\\src\\main\\webapp\\resources\\img\\logo.png");
                mimeMsgHelperObj.setTo(reset_email);
                mimeMsgHelperObj.setFrom(emailFromRecipient);
                mimeMsgHelperObj.setText("Welcome our user, under this message u have link. Enter the reset page and complete the form !  ");
                mimeMsgHelperObj.setFrom("INRECSS");
                mimeMsgHelperObj.setSubject("Reset password");
                BodyPart textPart = new MimeBodyPart();
                String htmlText =link+"\n\n<p>\n\n<img src=\\\"cid:image1\\\" width=\\\"30%\\\" height=\\\"30%\\\" />\n\n\n<h3>Powered by INRECSS\n© All right Reversed.</h3></p>";
                textPart.setContent(htmlText, "text/html");
                mimeMsgHelperObj.getMimeMultipart().addBodyPart(textPart);


            }
        });
    }

    public void registerMemberEvent(final String reset_email, final String link){
        mailSenderObj.send(new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws Exception {

                Resource res = new FileSystemResource(new File("C:\\Users\\Mateusz\\Desktop\\Praca Inżynierska\\Program\\src\\main\\webapp\\resources\\img\\logo.png"));
                MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");


                Map<String, String> inlineImages = new HashMap<String, String>();
                inlineImages.put("image1", "C:\\Users\\Mateusz\\Desktop\\Praca Inżynierska\\Program\\src\\main\\webapp\\resources\\img\\logo.png");
                mimeMsgHelperObj.setTo(reset_email);
                mimeMsgHelperObj.setFrom(emailFromRecipient);
                mimeMsgHelperObj.setText("Welcome member, under this message u have details bank transfer. ");
                mimeMsgHelperObj.setFrom("INRECSS");
                mimeMsgHelperObj.setSubject("Registered Event");
                BodyPart textPart = new MimeBodyPart();
                String htmlText =link+"\n\n<p>\n\n<img src=\\\"cid:image1\\\" width=\\\"30%\\\" height=\\\"30%\\\" />\n\n\n<h3>Powered by INRECSS\n© All right Reversed.</h3></p>";
                textPart.setContent(htmlText, "text/html");
                mimeMsgHelperObj.getMimeMultipart().addBodyPart(textPart);


            }
        });
    }
}