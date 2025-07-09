<%@ page import="java.sql.*, java.util.*, java.text.SimpleDateFormat" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String aadhar = (String) session.getAttribute("aadhar");
    String fullName = (String) session.getAttribute("fullName");
    String email = (String) session.getAttribute("email");
    String age = (String) session.getAttribute("age");
    String mobno = (String) session.getAttribute("mobno");
    String busId = (String) session.getAttribute("busId");
    String[] seats = (String[]) session.getAttribute("selectedSeats");
    Integer totalFareObj = (Integer) session.getAttribute("totalFare");
    int totalFare = (totalFareObj != null) ? totalFareObj : 0;
    String paymentStatus = (String) session.getAttribute("paymentStatus");
    String journeydate = (String) session.getAttribute("journeydate");

    String seatList = "";
    if (seats != null) {
        seatList = String.join(", ", seats);
    }

    // Generate unique ticket ID
    String ticketId = UUID.randomUUID().toString().substring(0, 8).toUpperCase();
    session.setAttribute("ticketId", ticketId);
    
    String boardingPoint = "";
    String alightingPoint = "";
    if (busId != null) {
        if (busId.contains("Kolhapur to Pune")) {
            boardingPoint = "Kolhapur CBS";
            alightingPoint = "Swargate";
        } else if (busId.contains("Pune to Kolhapur")) {
            boardingPoint = "Swargate";
            alightingPoint = "Kolhapur CBS";
        } else if (busId.contains("Pune to Mumbai")) {
            boardingPoint = "Swargate";
            alightingPoint = "Mumbai Central";
        } else if (busId.contains("Mumbai to Pune")) {
            boardingPoint = "Mumbai Central";
            alightingPoint = "Swargate";
        } else if (busId.contains("Satara to Pune")) {
            boardingPoint = "Satara CBS";
            alightingPoint = "Swargate";
        } else if (busId.contains("Pune to Satara")) {
            boardingPoint = "Swargate";
            alightingPoint = "Satara CBS";
        }
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/busproject", "root", "");

        String insertQuery = "INSERT INTO ticketdata (aadhar, fullname, email, age, mobno, route, seats, totalfare, paymentstatus, ticket_id, journeydate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pst = conn.prepareStatement(insertQuery);
        pst.setString(1, aadhar);
        pst.setString(2, fullName);
        pst.setString(3, email);
        pst.setInt(4, Integer.parseInt(age));
        pst.setLong(5, Long.parseLong(mobno));
        pst.setString(6, busId);
        pst.setString(7, seatList);
        pst.setInt(8, totalFare);
        pst.setString(9, paymentStatus);
        pst.setString(10, ticketId);
        pst.setString(11, journeydate);
        pst.executeUpdate();

        pst.close();
        conn.close();
    } catch (Exception e) {
        out.println("<div class='alert alert-danger'>Database error: " + e.getMessage() + "</div>");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Ticket</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html2pdf.js@0.10.1/dist/html2pdf.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrious/4.0.2/qrious.min.js"></script>
    <style>
        body {
            background: linear-gradient(-45deg, #6a11cb, #2575fc, #6a11cb, #2575fc);
            background-size: 400% 400%;
            animation: gradientAnimation 12s ease infinite;
            font-family: 'Poppins', sans-serif;
            color: #333;
        }

        @media print {
            button, .logout-btn {
                display: none;
            }
        }

        .card {
            background: rgba(255, 255, 255, 0.9);
        }

        .logout-btn {
            margin-top: 10px;
        }
    </style>

    <script>
        function printTicket() {
            window.print();
        }

        function downloadPDF() {
            const element = document.getElementById("ticketSection");
            html2pdf().from(element).save("Ticket_<%= ticketId %>.pdf");
        }

        window.onload = function () {
            const qr = new QRious({
                element: document.getElementById("qrCode"),
                value: `Ticket ID: <%= ticketId %>\nName: <%= fullName %>\nRoute: <%= busId %>\nJourney Date: <%= journeydate %> \nSeats: <%= seatList %>\nFare: ₹<%= totalFare %>`
            });
        };
    </script>
</head>
<body>
    <div class="container mt-4">
    	<div class="d-flex justify-content-start">
    		<form action="index.jsp" method="get">
    			<button href="index.jsp" class="btn btn-outline-secondary text-light">Home</button>
    		</form>
    	</div>
        <div class="d-flex justify-content-end">
            <form action="index.jsp" method="get">            	
                <button type="submit" class="btn btn-outline-secondary logout-btn">Logout</button>                
            </form>
        </div>

        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10 col-sm-12" id="ticketSection">
                <div class="card shadow-lg">
                    <div class="card-header bg-success text-white text-center">
                        <h4 class="mb-0">Booking Confirmation</h4>
                    </div>
                    <div class="card-body">
                        <h5 class="text-primary mb-3">Passenger Information</h5>
                        <p><strong>Ticket ID:</strong> <%= ticketId %></p>
                        <p><strong>Name:</strong> <%= fullName %></p>
                        <p><strong>Aadhar Number:</strong> <%= aadhar %></p>
                        <p><strong>Email:</strong> <%= email %></p>
                        <p><strong>Age:</strong> <%= age %></p>
                        <p><strong>Mobile Number:</strong> <%= mobno %></p>

                        <hr>

                        <h5 class="text-primary mb-3">Trip Details</h5>
                        <p><strong>Route:</strong> <%= busId %></p>
                        <p><strong>Date:</strong> <%= journeydate %></p>
                        <p><strong>Boarding Point:</strong> <%= boardingPoint %></p>
                        <p><strong>Alighting Point:</strong> <%= alightingPoint %></p>
                        <p><strong>Selected Seats:</strong> <%= seatList %></p>
                        <p><strong>Total Fare:</strong> ₹<%= totalFare %></p>
                        <p><strong>Payment Status:</strong> 
                            <span class="text-success fw-bold"><%= paymentStatus %></span>
                        </p>

                        <div class="text-center mt-4">
                            <canvas id="qrCode" style="margin-bottom: 20px;"></canvas>
                            <div class="d-flex flex-wrap justify-content-center gap-2">
                                <button class="btn btn-outline-primary" onclick="printTicket()">Print Ticket</button>
                                <button class="btn btn-outline-success" onclick="downloadPDF()">Download PDF</button>
                            </div>

                            <!-- Cancel Ticket Button -->
                            <form action="cancelTicket.jsp" method="get" class="mt-3">
                                <input type="hidden" name="ticketId" value="<%= ticketId %>">
                                <button class="btn btn-outline-danger" type="submit">Cancel Ticket</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
