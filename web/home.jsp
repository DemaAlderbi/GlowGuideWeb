<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>GlowGuide - Home</title>
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
    <div>GlowGuide</div>
    <div>
        Welcome, <%= user.getUsername() %> |
        <a href="LogoutServlet">Logout</a>
    </div>
</div>

<div class="container">

    <h2>Your Skincare Dashboard</h2>

    <div class="card-grid">

        <div class="card">
            <h3>Skin-Type Quiz</h3>
            <p>Find your current skin type with our simple quiz.</p>
            <a href="quiz.jsp">Start Quiz</a>
        </div>

        <div class="card">
            <h3>Recommendations</h3>
            <p>View skincare products matched to your skin type.</p>
            <a href="recommendations.jsp">View Products</a>
        </div>

        <div class="card">
            <h3>Profile</h3>
            <p>Edit your personal information and settings.</p>
            <a href="profile.jsp">Open Profile</a>
        </div>

    </div>

</div>

<div class="footer">
    © 2025 GlowGuide | Personalized Skincare Assistant
</div>

</body>
</html>
