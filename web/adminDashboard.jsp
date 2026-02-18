<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>

<%
    User user = (User) session.getAttribute("user");

    if (user == null || !user.getRole().equals("ADMIN")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>GlowGuide - Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #efe9f4, #f9f7ff);
            margin: 0;
            padding: 0;
        }

        .navbar {
            background: #6a5acd;
            color: white;
            padding: 15px 30px;
            font-size: 20px;
            font-weight: bold;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-size: 14px;
        }

        .container {
            padding: 40px;
            text-align: center;
        }

        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 25px;
            margin-top: 40px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 18px rgba(0,0,0,0.15);
        }

        .card h3 {
            color: #6a5acd;
        }

        .card a {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            padding: 10px 20px;
            background: #6a5acd;
            color: white;
            border-radius: 6px;
        }

        .footer {
            margin-top: 60px;
            text-align: center;
            font-size: 12px;
            color: gray;
        }
    </style>
</head>

<body>

<div class="navbar">
    <div>GlowGuide - Admin Panel</div>
    <div>
        Welcome, <%= user.getUsername() %> |
        <a href="LogoutServlet">Logout</a>
    </div>
</div>

<div class="container">

    <h2>System Administration</h2>

    <div class="card-grid">

        <div class="card">
            <h3>Manage Products</h3>
            <p>View, add, and remove skincare products.</p>
            <a href="manageProducts.jsp">Open</a>
        </div>

        <div class="card">
            <h3>View Users</h3>
            <p>View registered system users.</p>
            <a href="viewUsers.jsp">Open</a>
        </div>

    </div>

</div>

<div class="footer">
    © 2025 GlowGuide | Admin Control Panel
</div>

</body>
</html>
