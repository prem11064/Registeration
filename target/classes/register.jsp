<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful</title>
</head>
<body>
    <h2>Registration Successful</h2>
    <p>Thank you for registering!</p>
    <p><strong>Username:</strong> <%= request.getParameter("username") %></p>
    <p><strong>Email:</strong> <%= request.getParameter("email") %></p>

    <p><a href="index.jsp">Go back to registration form</a></p>
</body>
</html>
