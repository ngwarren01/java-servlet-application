<%--
  Created by IntelliJ IDEA.
  User: Jireh
  Date: 13/4/2023
  Time: 6:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
    <style>
        body {
            background-color: #f7f7f7;
            font-family: 'Montserrat', sans-serif;
        }

        .container {
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            margin: 150px auto;
            padding: 20px 30px;
            width: 400px;
        }

        h1 {
            color: #333333;
            font-size: 24px;
            font-weight: 700;
            text-align: center;
        }

        input[type=text], input[type=password] {
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
            margin: 10px 0;
            padding: 10px;
            width: 100%;
        }

        button {
            background-color: #ff8000;
            border: none;
            border-radius: 5px;
            color: #ffffff;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
            padding: 10px;
            width: 100%;
        }

        button:hover {
            background-color: #ff9f40;
        }
        .register-btn {
            background-color: #4ac022;
            border: none;
            border-radius: 5px;
            color: #ffffff;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
            padding: 10px;
            width: 100%;
        }

        .register-btn:hover {
            background-color: #0cde28;
        }
    </style>
</head>
<body>


<div class="container">
    <h1>Login</h1>
    <form action="LoginController" method="post">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" placeholder="Enter your username">

        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter your password">

        <button type="submit">Login</button>
    </form>
    <button class ="register-btn" type="submit" onclick="register()">Register</button>

</div>
<script>
    function register(){
        window.location.href ="registerPage.jsp";
    }
</script>
</body>
</html>
