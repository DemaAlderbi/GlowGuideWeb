<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, dao.UserDAO, model.User" %>

<%
    UserDAO dao = new UserDAO();
    List<User> users = dao.getAllUsers();
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Users - Admin</title>
    <style>
        body {
            font-family: Arial;
            background: #f4f2fb;
            margin: 0;
        }

        .navbar {
            background: #6a5acd;
            color: white;
            padding: 16px;
            text-align: center;
            font-size: 22px;
        }

        .container {
            width: 90%;
            margin: 40px auto;
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            border-bottom: 1px solid #ccc;
            text-align: center;
        }

        th {
            background: #6a5acd;
            color: white;
        }

        a {
            text-decoration: none;
            color: white;
            background: #6a5acd;
            padding: 8px 16px;
            border-radius: 6px;
            display: inline-block;
            margin-top: 20px;
        }
    </style>
</head>

<body>

<div class="navbar">GlowGuide - View Users</div>

<div class="container">
    <h2>Registered Users</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Skin Type</th>
        </tr>

        <% for (User u : users) { %>
        <tr>
            <td><%= u.getUserId() %></td>
            <td><%= u.getUsername() %></td>
            <td><%= u.getEmail() %></td>
            <td><%= u.getSkinType() %></td>
        </tr>
        <% } %>

    </table>

    <a href="adminDashboard.jsp">Back to Admin Dashboard</a>
</div>

</body>
</html>
