package com.org;

import java.io.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/SendOtpServlet")
public class SendOtpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        int otp = 100000 + new Random().nextInt(900000);

        // Store OTP and email in session
        HttpSession session = request.getSession();
        session.setAttribute("otp", otp);
        session.setAttribute("email", email);
        session.setAttribute("otpTime", System.currentTimeMillis()); // store time

        // Email configuration
        final String senderEmail = "@gmail.com";
        final String senderPassword = "";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session mailSession = Session.getInstance(props,
            new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(senderEmail, senderPassword);
                }
            });

        try {
            Message message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Your OTP for Password Reset");
            message.setText("Your OTP is: " + otp);

            Transport.send(message);

            // Show OTP form
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h3>OTP sent to your registered email.</h3>");
            out.println("<form action='VerifyOtpServlet' method='post'>"
                    + "Enter OTP: <input type='text' name='otp'><br><br>"
                    + "New Password: <input type='password' name='password'><br><br>"
                    + "Confirm Password: <input type='password' name='confirmpassword'><br><br>"
                    + "<button type='submit'>Reset Password</button>"
                    + "</form>");

        } catch (MessagingException e) {
            e.printStackTrace();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h3>Failed to send OTP. Please try again.</h3>");
        }
    }
}
