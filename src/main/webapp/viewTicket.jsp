<%@ page import="java.sql.*, java.util.*, java.text.SimpleDateFormat" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Ticket</title>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
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
        .card {
            background: rgba(255, 255, 255, 0.9);
        }
        @media print {
            button, .back-btn {
                display: none;
            }
        }
    </style>
</head>
<body>

	<header>
    	<div class="container mt-5">
        	<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
            	<ol class="breadcrumb">
              		<li class="breadcrumb-item"><a href="index.jsp" class="text-decoration-none text-white fw-bold">Home</a></li>
              		<li class="breadcrumb-item active text-body-tertiary fw-bold" aria-current="page">View Ticket</li>
            	</ol>
          	</nav>
    	</div>
   </header>
   
   <main>
   <div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-sm-12">
            <form method="get">
                <div class="input-group mb-3">
                    <input type="text" name="ticketId" class="form-control" placeholder="Enter Ticket ID" required>
                    <button class="btn btn-primary" type="submit">View Ticket</button>
                </div>
            </form>

            <%
                String ticketId = request.getParameter("ticketId");

                if (ticketId != null && !ticketId.trim().isEmpty()) {
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/busproject", "root", "");

                        String query = "SELECT * FROM ticketdata WHERE ticket_id = ?";
                        PreparedStatement pst = conn.prepareStatement(query);
                        pst.setString(1, ticketId);
                        ResultSet rs = pst.executeQuery();

                        if (rs.next()) {
                            String fullName = rs.getString("fullname");
                            String aadhar = rs.getString("aadhar");
                            String email = rs.getString("email");
                            String age = rs.getString("age");
                            String mobno = rs.getString("mobno");
                            String busId = rs.getString("route");
                            String seatList = rs.getString("seats");
                            int totalFare = rs.getInt("totalfare");
                            String paymentStatus = rs.getString("paymentstatus");
                            String journeydate = rs.getString("journeydate");

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
            %>

            <div id="ticketSection">
                <div class="card shadow-lg">
                    <div class="card-header bg-success text-white text-center">
                        <h4 class="mb-0">Ticket Details</h4>
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
                            <canvas id="qrCode"></canvas>
                            <div class="d-flex flex-wrap justify-content-center gap-2">
                                <button class="btn btn-outline-primary" onclick="window.print()">Print Ticket</button>
                                <button class="btn btn-outline-success" onclick="downloadPDF()">Download PDF</button>
                            </div>
                            
                            <form action="cancelTicket.jsp" method="get" class="mt-3">
                                <input type="hidden" name="ticketId" value="<%= ticketId %>">
                                <button class="btn btn-outline-danger" type="submit">Cancel Ticket</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                const qr = new QRious({
                    element: document.getElementById("qrCode"),
                    value: `Ticket ID: <%= ticketId %>\nName: <%= fullName %>\nRoute: <%= busId %>\nJourney Date: <%= journeydate %>\nSeats: <%= seatList %>\nFare: ₹<%= totalFare %>`
                });

                function downloadPDF() {
                    const element = document.getElementById("ticketSection");
                    html2pdf().from(element).save("Ticket_<%= ticketId %>.pdf");
                }
            </script>

            <%
                        } else {
                            out.println("<div class='alert alert-warning text-center'>Ticket not found. Please check your Ticket ID.</div>");
                        }

                        rs.close();
                        pst.close();
                        conn.close();
                    } catch (Exception e) {
                        out.println("<div class='alert alert-danger text-center'>Error: " + e.getMessage() + "</div>");
                    }
                }
            %>
        </div>
    </div>
</div>
   </main>

</body>
</html>
