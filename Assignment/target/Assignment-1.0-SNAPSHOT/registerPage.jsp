<%--
  Created by IntelliJ IDEA.
  User: Jireh
  Date: 16/4/2023
  Time: 3:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <style>
    body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
    }

    #register-form {
    background-color: white;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin: 20px auto;
    max-width: 600px;
    padding: 20px;
    }

    h1 {
    margin: 0 0 20px;
    text-align: center;
    }

    label {
    display: block;
    font-weight: bold;
    margin: 10px 0;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
    border: 1px solid #ddd;
    border-radius: 3px;
    font-size: 16px;
    padding: 10px;
    width: 100%;
    }

    input[type="submit"] {
    background-color: #1abc9c;
    border: none;
    border-radius: 3px;
    color: white;
    cursor: pointer;
    font-size: 16px;
    padding: 10px;
    width: 100%;
    }

    input[type="submit"]:hover {
    background-color: #16a085;
    }

    .form-group {
    margin-bottom: 20px;
    }

    .form-group:last-child {
    margin-bottom: 0;
    }

    .form-group label {
    font-size: 14px;
    }

    .form-group input[type="checkbox"] {
    margin-right: 10px;
    }

    .form-group p {
    font-size: 12px;
    margin: 5px 0 0;
    }

    .error-message {
    color: #e74c3c;
    font-size: 12px;
    margin: 5px 0 0;
    }
    </style>
</head>
<body>
<form action= "RegisterController" id="register-form">
    <h1>Register</h1>
    <div class="form-group">
        User Name:
        <input type="text" name="user" maxlength="20" required>
    </div>
    <div class="form-group">
        Password:
        <input type="text" name="password" maxlength="20" required>
    </div>

    <hr>

    <div class="form-group">
        Company Name:
        <input type="text" name="customerName" required>
    </div>

    <div class="form-group">
        Contact Last Name:
        <input type="text" name="contactLastName" required>
    </div>

    <div class="form-group">
        Contact First Name:
        <input type="text" name="contactFirstName" required>
    </div>

    <div class="form-group">
        Phone
        <input type="text" name="phone"  required>
    </div>

    <div class="form-group">
        Address Line 1:
        <input type="text" name="addressLine1" required>
    </div>

    <div class="form-group">
        Address Line 2:
        <input type="text" name="addressLine2" >
    </div>

    <div class="form-group">
        City:
        <input type="text" name="city" required>
    </div>

    <div class="form-group">
        State:
        <input type="text" name="state" >
    </div>

    <div class="form-group">
        Postal Code:
        <input type="text" name="postalCode" >
    </div>

    <div class="form-group">
        Country:
        <input type="text" name="country" required>
    </div>

    <div class="form-group">
        Credit Limit:
        <input type="number" step=".01" name="creditLimit" min="0" />
    </div>


<input type="submit" value="Register">
</form>
</body>
</html>
