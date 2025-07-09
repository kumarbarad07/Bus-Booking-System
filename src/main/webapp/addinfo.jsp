<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String[] selectedSeats = request.getParameterValues("seats");
    String busId = request.getParameter("busId");

    if (selectedSeats != null && selectedSeats.length > 0) {
        session.setAttribute("selectedSeats", selectedSeats);
    }

    selectedSeats = (String[]) session.getAttribute("selectedSeats");
    if (selectedSeats == null || selectedSeats.length == 0) {
        response.sendRedirect("seatSelection.jsp?error=noSeatsSelected&busId=" + busId);
        return;
    }

    if (busId != null) {
        session.setAttribute("busId", busId);
    }

    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("aadhar") != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/busproject", "root", "");

            PreparedStatement pst = conn.prepareStatement("INSERT INTO passengerdata (aadhar, fullname, email, age, mobno) VALUES (?, ?, ?, ?, ?)");
            pst.setString(1, request.getParameter("aadhar"));
            pst.setString(2, request.getParameter("fullName"));
            pst.setString(3, request.getParameter("email"));
            pst.setInt(4, Integer.parseInt(request.getParameter("age")));
            pst.setLong(5, Long.parseLong(request.getParameter("mobno")));
            pst.executeUpdate();

            session.setAttribute("aadhar", request.getParameter("aadhar"));
            session.setAttribute("fullName", request.getParameter("fullName"));
            session.setAttribute("email", request.getParameter("email"));
            session.setAttribute("age", request.getParameter("age"));
            session.setAttribute("mobno", request.getParameter("mobno"));

            conn.close();

            response.sendRedirect("payment.jsp");
            return;

        } catch (Exception e) {
            out.println("<div class='container mt-4'><div class='alert alert-danger'>Database error: " + e.getMessage() + "</div></div>");
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Passenger Info</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-info-subtle">
    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-10 col-lg-6">
                <div class="card shadow-lg border-0">
                    <div class="card-body">
                        <h4 class="card-title mb-4 text-center">Passenger Information</h4>
                        <form action="addinfo.jsp" method="post" novalidate>
                            <div class="mb-3">
                                <label for="aadhar" class="form-label">Aadhar Number</label>
                                <input type="text" class="form-control" id="aadhar" name="aadhar" maxlength="12" required>
                            </div>
                            <div class="mb-3">
                                <label for="fullName" class="form-label">Full Name</label>
                                <input type="text" class="form-control" id="fullName" name="fullName" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="mb-3">
                                <label for="age" class="form-label">Age</label>
                                <input type="number" class="form-control" id="age" name="age" min="18" required>
                            </div>
                            <div class="mb-3">
                                <label for="mobno" class="form-label">Mobile Number</label>
                                <input type="tel" class="form-control" id="mobno" name="mobno" maxlength="10" required>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-success">Proceed to Payment</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
