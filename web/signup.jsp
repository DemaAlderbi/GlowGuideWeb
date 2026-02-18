<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>GlowGuide - Sign Up</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #efe9f4, #f9f7ff);
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .box {
            background: white;
            padding: 35px;
            width: 400px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            text-align: center;
        }

        h2 {
            color: #6a5acd;
            margin-bottom: 25px;
        }

        input {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        button {
            width: 100%;
            margin-top: 15px;
            padding: 12px;
            border: none;
            border-radius: 6px;
            background: #6a5acd;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        .error {
            color: red;
            margin-bottom: 10px;
        }

        .success {
            color: green;
            margin-bottom: 10px;
        }

        .link {
            margin-top: 15px;
            font-size: 14px;
        }

        .link a {
            color: #6a5acd;
            text-decoration: none;
        }
    </style>
</head>

<body>

<div class="box">
    <h2>Create Account</h2>

    <% 
        if (request.getParameter("success") != null) { 
    %>
        <p class="success">Account created successfully! You can now login.</p>
    <% } else if (request.getParameter("error") != null) { %>
        <p class="error">Error creating account. Try again.</p>
    <% } %>

    <form action="SignupServlet" method="post">

        <input type="text" name="username" placeholder="Username" required>

        <input type="email" name="email" placeholder="Email" required>

        <input type="password" name="password" placeholder="Password" required>

        <input type="number" name="age" placeholder="Age" required>

        <input type="text" name="gender" placeholder="Gender (optional)">

        <button type="submit">Sign Up</button>
    </form>

    <div class="link">
        Already have an account? <a href="login.jsp">Login</a>
    </div>
</div>

</body>
</html>
