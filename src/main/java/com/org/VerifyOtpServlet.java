package com.org;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/VerifyOtpServlet")
public class VerifyOtpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("otp") == null) {
            out.println("<h3>OTP expired. Please try again.</h3>");
            return;
        }

        int enteredOtp = Integer.parseInt(request.getParameter("otp"));
        String newPassword = request.getParameter("password");
        String confirmPassword1 = request.getParameter("confirmpassword");

        int actualOtp = (int) session.getAttribute("otp");
        String email = (String) session.getAttribute("email");

        long otpTime = (long) session.getAttribute("otpTime");
        long currentTime = System.currentTimeMillis();

        // Expire OTP after 5 minutes (300000 ms)
        if (currentTime - otpTime > 300000) {
            session.invalidate();
            out.println("<h3>OTP expired. Please try again.</h3>");
            return;
        }

        if (enteredOtp == actualOtp) {
            if (!newPassword.equals(confirmPassword1)) {
                out.println("<h3>Passwords do not match.</h3>");
                return;
            }

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/busproject", "root", "");

                PreparedStatement ps = conn.prepareStatement("UPDATE customerinfo SET password=?,confirmpassword=? WHERE email=?");
                ps.setString(1, newPassword); // Consider hashing in production
                ps.setString(2, confirmPassword1); 
                ps.setString(3, email);
                int i = ps.executeUpdate();

                out.println("<h3>Password reset successful!</h3>");
                session.invalidate(); // clear session
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
                out.println("Database error.");
            }
        } else {
            out.println("<h3>Invalid OTP. Please try again.</h3>");
        }
    }
}
