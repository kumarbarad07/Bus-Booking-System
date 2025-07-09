<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
</head>
<body>

    <h2>Forgot Password</h2>
    <form action="SendOtpServlet" method="post">
        <label>Enter your registered email:</label><br>
        <input type="email" name="email" required><br><br>
        <button type="submit">Send OTP</button>
    </form>
</body>
</html>
