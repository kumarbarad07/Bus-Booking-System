<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Verify OTP</title>
</head>
<body>
    <h2>Enter OTP</h2>
    <form action="VerifyOtpServlet" method="post">
        <label>Enter OTP:</label><br>
        <input type="text" name="otp" required><br><br>
        <button type="submit">Verify OTP</button>
    </form>
</body>
</html>
