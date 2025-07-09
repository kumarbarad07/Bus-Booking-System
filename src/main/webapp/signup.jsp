<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SignUp page</title>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/signupstyle.css">
</head>
<body>


<!--  full use of JSP File - html and servlet code in this file --> 

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
        String fullname = request.getParameter("fullName");
        long mobno = Long.parseLong(request.getParameter("tel"));
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmpassword = request.getParameter("confirmpassword");

        // Server-side validation to ensure passwords match
        if (password.equals(confirmpassword)) {
            // Insert data into the database
            String insertQuery = "INSERT INTO customerinfo(fullname, mobno, email, username, password, confirmpassword) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(insertQuery);
            pst.setString(1, fullname);
            pst.setLong(2, mobno);
            pst.setString(3, email);
            pst.setString(4, username);
            pst.setString(5, password);
            pst.setString(6, confirmpassword);
            pst.executeUpdate();

            response.sendRedirect("login.jsp");
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

<div class="container mt-3">
    <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="./index.jsp" class="text-decoration-none text-white fw-bold">Home</a></li>
          <li class="breadcrumb-item active text-secondary fw-bold" aria-current="page">Sign Up</li>
        </ol>
      </nav>
</div>
    
<section class="">
    <div class="container">
      <div class="row">
        <div class="col-12 col-md-6 signup-form">
          <div class="d-flex flex-column text-center">
            <img class="img-fluid mx-3 " loading="lazy" src="./Images/Illustration/bus-stop.png" alt="Bus Logo">
          </div>
        </div>
        <div class="col-12 col-md-6 bsb-tpl-bg-lotion border border-info-subtle border-2 mb-2">
          <div class="p-3 p-md-4 p-xl-5">
            <div class="row">
              <div class="col-12">
                <div class="mb-5">
                  <h2 class="h3">Registration</h2>
                  <h3 class="fs-6 fw-normal text-warning m-0">Enter your details to register</h3>
                </div>
              </div>
            </div>
            <form action="" method="post">
              <div class="row gy-md-4 overflow-hidden">
                <div class="col-12">
                  <label for="fullName" class="form-label">Full Name <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" name="fullName" id="fullName" placeholder="Full Name" required>
                </div>
                <!-- <div class="col-12">
                  <label for="lastName" class="form-label">Last Name <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" name="lastName" id="lastName" placeholder="Last Name" required>
                </div> --> 
                <div class="col-12">
                  <label for="tel" class="form-label">Mobile No.<span class="text-danger">*</span></label>
                  <input type="tel" class="form-control" name="tel" id="tel" placeholder="+91" minlength="10" maxlength="10" required>
                </div>
                <div class="col-12">
                  <label for="email" class="form-label">Email <span class="text-danger">*</span></label>
                  <input type="email" class="form-control" name="email" id="email" placeholder="name@example.com" required>
                </div>
                <div class="col-12">
                <label for="username" class="form-label">Username <span class="text-danger">*</span></label>
                <input type="text" class="form-control" name="username" id="username" placeholder="username" required>
                </div>
                <div class="col-12">
                  <label for="password" class="form-label">Password <span class="text-danger">*</span></label>
                  <input type="password" class="form-control" name="password" id="password" required>
                </div>
                <div class="col-12">
                  <label for="confirmpassword" class="form-label">Confirm Password <span class="text-danger">*</span></label>
                  <input type="password" class="form-control" name="confirmpassword" id="confirmpassword" value="" required>
                </div>
                <div class="col-12">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" name="iAgree" id="iAgree" required>
                    <label class="form-check-label text-secondary-emphasis" for="iAgree">
                      I agree to the <a href="terms.jsp" class="link-primary text-decoration-none">terms and conditions</a>
                    </label>
                  </div>
                </div>
                <div class="col-12">
                  <div class="d-grid">
                    <button class="btn btn-primary" type="submit">Sign up</button>
                  </div>
                </div>
              </div>
            </form>
            <div class="row">
              <div class="col-12">
                <hr class="mt-5 mb-4 border-dark fw-bold">
                <p class="m-0 text-warning text-end">Already have an account? <a href="login.jsp" class="text-light text-decoration-none">Log in</a></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>