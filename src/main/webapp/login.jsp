<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %> <!-- Ensures session is enabled -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="./css/loginstyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>

<body>

   <header>
    <div class="container mt-5">
        <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.jsp" class="text-decoration-none text-white fw-bold">Home</a></li>
              <li class="breadcrumb-item active text-secondary fw-bold" aria-current="page">Log in</li>
            </ol>
          </nav>
    </div>
   </header>

<main>
    
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="card border-0 shadow-lg rounded-5 my-5">
                    <div class="card-body p-4 p-sm-5">
                        <div class="text-center mb-5">
                            <p><span class="fs-5 fw-semibold">Log in </span> <i class="fa-solid fa-right-to-bracket fa-xl" style="color: #63E6BE;"></i></p>
                        </div>
                        <form action="login.jsp" method="post">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput" name="username" placeholder="Username" required>
                                <label for="floatingInput">Username</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password" required>
                                <label for="floatingPassword">Password</label>
                            </div>

                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary btn-login text-uppercase fw-bold">Login</button>
                            </div>
                            <hr class="my-4">
                            <div class="row">
                                <div class="col-12">
                                    <p class="m-0 text-secondary text-center te">Don't have an account? <a href="signup.jsp" class="text-decoration-none">Sign Up</a></p>
                                </div>
                                
                                <div class="col-12 mt-3">
                                	<p class="m-0 text-center"><a href="forgotPassword.jsp" class="text-decoration-none text-info-emphasis">Forgot Password</a></p>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<%
    Connection conn = null;
    Statement stat = null;
    ResultSet rs = null;

    try {
        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/busproject", "root", "");
        stat = conn.createStatement();

        if(request.getMethod().equalsIgnoreCase("post")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            if( username.equalsIgnoreCase("Kumar7") && password.equals("") ) {
                // Admin login: set session attribute
                session.setAttribute("username", username);
                response.sendRedirect("adminDashboard.jsp");
            } 

            // Query to check if the username and password match
            String query = "SELECT * FROM customerinfo WHERE username = ? AND password = ?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setString(1, username);
            pst.setString(2, password);
            rs = pst.executeQuery();

            if(rs.next()) {
                // User found, successful login, set session and redirect to home page
                session.setAttribute("username", username); // Set session
                response.sendRedirect("index.jsp");
            } else {
                // Invalid credentials
                out.println("<div class='alert alert-danger'>Invalid username or password. Please try again.</div>");
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
