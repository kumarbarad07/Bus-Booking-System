<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String[] selectedSeats = (String[]) session.getAttribute("selectedSeats");
    String busId = (String) session.getAttribute("busId");

    int farePerSeat = 0;
    if ("Kolhapur to Pune 7.00am to 12.00pm".equalsIgnoreCase(busId) || "Pune to Kolhapur  1.00pm to 6.00pm".equalsIgnoreCase(busId)) {
        farePerSeat = 400;
    } else if ("Pune to Mumbai 6.30am to 10.30am".equalsIgnoreCase(busId) || "Mumbai to Pune 12.00pm to 4.00pm".equalsIgnoreCase(busId)) {
        farePerSeat = 250;
    } else if ("Satara to Pune 8.00am to 11.00am".equalsIgnoreCase(busId) || "Pune to Satara 12.00pm to 3.00pm".equalsIgnoreCase(busId)) {
        farePerSeat = 200;
    }

    int totalFare = (selectedSeats != null) ? selectedSeats.length * farePerSeat : 0;

    session.setAttribute("totalFare", totalFare);
    session.setAttribute("paymentStatus", "Payment Successful");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Confirmation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #c31432, #240b36);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card-custom {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6 col-xl-5">
            <div class="card card-custom border-0">
                <div class="card-body text-center">
                    <h3 class="card-title text-success mb-4">Payment Confirmation</h3>
                    <% if (selectedSeats != null && selectedSeats.length > 0) { %>
                        <p><strong>Selected Seats:</strong><br><%= String.join(", ", selectedSeats) %></p>
                    <% } %>
                    <p><strong>Total Fare:</strong> ₹<%= totalFare %></p>
                    <p><strong>Payment Status:</strong> <span class="text-success">Payment Successful</span></p>
                    <form action="generateTicket.jsp" method="get" class="d-grid mt-4">
                        <button type="submit" class="btn btn-primary">Proceed to Ticket</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
