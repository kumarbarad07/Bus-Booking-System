<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bus Booking</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: #fff;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 15px;
        }
        .booking-card {
            width: 100%;
            max-width: 500px;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.2);
            background-color: white;
            color: black;
        }
    </style>
</head>
<body>

<div class="booking-card">
    <h2 class="text-primary mb-4 text-center">Bus Booking</h2>
    <form action="seatSelection.jsp" method="get" onsubmit="return validateForm()">
        <div class="mb-3">
            <label for="busId" class="form-label">Choose a route:</label>
            <select class="form-select" name="busId" id="busId" required>
                <option value="">Select Bus :</option>
                <option value="Kolhapur to Pune 7.00am to 12.00pm">Kolhapur to Pune 7.00am to 12.00pm</option>
                <option value="Pune to Kolhapur  1.00pm to 6.00pm">Pune to Kolhapur  1.00pm to 6.00pm</option>
                <option value="Pune to Mumbai 6.30am to 10.30am">Pune to Mumbai 6.30am to 10.30am</option>
                <option value="Mumbai to Pune 12.00pm to 4.00pm">Mumbai to Pune 12.00pm to 4.00pm</option>
                <option value="Satara to Pune 8.00am to 11.00am">Satara to Pune 8.00am to 11.00am</option>
                <option value="Pune to Satara 12.00pm to 3.00pm">Pune to Satara 12.00pm to 3.00pm</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="journeyDate" class="form-label">Select Journey Date:</label>
            <input type="date" class="form-control" name="journeydate" id="journeyDate" required>
        </div>
        
        <script>
    		const today = new Date();
    		const maxDate = new Date();
    		maxDate.setDate(today.getDate() + 30); // Add 30 days

    		// Format to yyyy-mm-dd
    		const todayStr = today.toISOString().split('T')[0];
    		const maxStr = maxDate.toISOString().split('T')[0];

    		const dateInput = document.getElementById("journeyDate");
    		dateInput.setAttribute("min", todayStr);
    		dateInput.setAttribute("max", maxStr);
		</script>
        
        <div class="d-grid">
            <button type="submit" class="btn btn-primary">Next</button>
        </div>
    </form>

    <div class="text-center mt-4">
        <p class="mb-2">Want to cancel your ticket?</p>
        <a href="cancelTicket.jsp" class="btn btn-danger">Cancel Ticket</a>
    </div>
</div>

<script>
    function validateForm() {
        const busId = document.getElementById("busId").value;
        if (busId === "") {
            alert("Please select a bus route before proceeding.");
            return false;
        }
        return true;
    }
</script>

</body>
</html>
