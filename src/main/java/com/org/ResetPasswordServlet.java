package com.org;

import java.io.*;
import java.sql.*;
import java.security.MessageDigest;
import java.nio.charset.StandardCharsets;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmpassword");

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (!password.equals(confirmPassword)) {
            out.println("<h3>Passwords do not match.</h3>");
            return;
        }

        try {
            String hashedPassword = hashPassword(password);

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/busproject", "root", "");

            PreparedStatement ps = conn.prepareStatement("UPDATE customerinfo SET password=?, confirmpassword=? WHERE email=?");
            ps.setString(1, hashedPassword);
            ps.setString(2, hashedPassword);
            ps.setString(3, email);

            ps.executeUpdate();
            conn.close();

            session.invalidate(); // Clear session

            out.println("<h3>Password updated successfully!</h3>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error updating password.");
        }
    }

    private String hashPassword(String password) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(password.getBytes(StandardCharsets.UTF_8));
        StringBuilder hexString = new StringBuilder();
        for (byte b : hash)
            hexString.append(String.format("%02x", b));
        return hexString.toString();
    }
}
