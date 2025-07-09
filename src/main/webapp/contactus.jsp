<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <link rel="stylesheet" href="./css/contactstyle.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%

Connection conn = null;
Statement stat = null;
ResultSet rs = null;

try {
    // Attempt to load the MySQL JDBC driver
    Class.forName("com.mysql.cj.jdbc.Driver");
    // Establish connection
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/busproject", "root", "");
    stat = conn.createStatement();

    if(request.getMethod().equalsIgnoreCase("post")) {
        String name = request.getParameter("name1");
        String email = request.getParameter("email2");
        String subject = request.getParameter("subject3");
        String message = request.getParameter("message4");

        // Server-side validation to ensure passwords match
        if (request.getParameter("submit1") != null) {
            // Insert data into the database
            String insertQuery = "INSERT INTO enquiry(name, email, subject, message) VALUES (?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(insertQuery);
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, subject);
            pst.setString(4, message);
            pst.executeUpdate();

            response.sendRedirect("contactus.jsp");
        } else {
            out.println("<div class='alert alert-danger'>Passwords do not match. Please try again.</div>");
        }
    }
} catch (ClassNotFoundException e) {
    out.println("<div class='alert alert-danger'>JDBC Driver not found: " + e.getMessage() + "</div>");
} catch (SQLException e) {
    out.println("<div class='alert alert-danger'>SQL Error: " + e.getMessage() + "</div>");
} catch (Exception e) {
    out.println("<div class='alert alert-danger'>An error occurred: " + e.getMessage() + "</div>");
}

%>

<header>
        <section class="mb-5 pb-5">
            <div class="banner">
                <nav
                    class="navbar navbar-expand-lg bg-body-tertiary fixed-top justify-content-lg-evenly shadow gradient-custom">
                    <a href="#" class="navbar-brand "><img src="./Images/Illustration/Logo_bigtranz_1.png"
                            class="navbarlogo" alt=""></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarcontent" aria-controls="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse flex-grow-0" id="navbarcontent">
                        <ul class="navbar-nav gap-xl-3">
                            <li class="nav-item">
                                <a href="index.jsp" class="nav-link text-uppercase text-light">Home</a>
                            </li>
                            <li class="nav-item">
                                <a href="aboutus.jsp" class="nav-link text-uppercase text-light">About US</a>
                            </li>
                            <li class="nav-item">
                                <a href="ourbuses.jsp" class="nav-link text-uppercase text-light" >Our
                                    Buses</a>
                            </li>
                            <li class="nav-item">
    							<a href="<%= session.getAttribute("username") != null ? "busBooking.jsp" : "login.jsp" %>" class="nav-link text-uppercase text-light">Bookings</a>
							</li>
                            <li class="nav-item">
                                <a href="contactus.jsp" class="nav-link active text-uppercase text-warning" aria-current="page">Contact Us</a>
                            </li>
                        </ul>
                    </div>
                    
                    <%
        String username = (String) session.getAttribute("username");
        if (username == null) {
    %>
        <div>
            <a href="login.jsp" class="btn btn-outline-secondary text-light">Login</a>
            <a href="signup.jsp" class="btn btn-outline-primary text-light">SignUp</a>
        </div>
    <%
        } else {
    %>
        <div>
            <a href="viewTicket.jsp" class="btn btn-outline-warning text-light me-2">View Ticket</a>
            <a href="logout.jsp" class="btn btn-outline-danger text-light">Logout</a>
        </div>
    <%
        }
    %>

                </nav>
            </div>
        </section>
    </header>

<div class="contact-container">
    <h1 class="text-center">Contact Us</h1>
    <div class="row g-4">
        <!-- Contact Form -->
        <div class="col-lg-7 col-md-12">
            <form action="" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">Your Name</label>
                    <input type="text" class="form-control" id="name" name="name1" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Your Email</label>
                    <input type="email" class="form-control" id="email" name="email2" required>
                </div>
                <div class="mb-3">
                    <label for="subject" class="form-label">Subject</label>
                    <input type="text" class="form-control" id="subject" name="subject3" required>
                </div>
                <div class="mb-3">
                    <label for="message" class="form-label">Message</label>
                    <textarea class="form-control" id="message" name="message4" rows="5" required></textarea>
                </div>
                <button type="submit" name="submit1" class="btn btn-primary w-100">Send Message</button>
            </form>
        </div>

        <!-- Company Info -->
        <div class="col-lg-5 col-md-12">
            <div class="info-box">
                <h5>Our Office</h5>
                <p>
                    139,<br>
                    Lower Indiranagar,<br>
                    Pune,<br>
                    ZIP: 416012
                </p>

                <h5>Phone</h5>
                <p>+91 9823459011</p>

                <h5>Email</h5>
                <p>bustranz31@gmail.com</p>

                <h5>Customer Support</h5>
                <p>Mon – Sat, 9:00 AM – 6:00 PM</p>
            </div>
        </div>
    </div>

    <div class="text-center btn-back">
        <a href="busBooking.jsp" class="btn btn-outline-secondary">Back to Booking</a>
    </div>
</div>
</body>
</html>
