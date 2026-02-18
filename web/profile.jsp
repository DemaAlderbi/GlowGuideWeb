<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.User,java.sql.*,dao.DBConnection" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int routineId = -1;

    try (Connection conn = DBConnection.getConnection()) {
        String sql = "SELECT routine_id FROM Routine WHERE user_id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, user.getUserId());
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            routineId = rs.getInt("routine_id");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Your Skincare Routine</title>
    <style>
        body { font-family: Arial; background: #f4f2fb; margin:0; }
        .navbar { background:#6a5acd; color:white; padding:18px; text-align:center; font-size:24px; }
        .container { width:90%; margin:auto; }
        h2 { text-align:center; color:#6a5acd; margin:30px 0; }
        h3 { color:#6a5acd; margin-top:40px; border-bottom:3px solid #6a5acd; padding-bottom:8px; }

        .grid {
            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(230px,1fr));
            gap:25px;
            margin-top:20px;
        }

        .card {
            background:white;
            padding:15px;
            border-radius:15px;
            box-shadow:0 0 12px rgba(0,0,0,.1);
            text-align:center;
        }

        .card img { width:100%; height:180px; object-fit:contain; }

        .step {
            font-weight:bold;
            margin:8px 0;
            color:#555;
        }

        .home-btn {
            display:block;
            width:220px;
            margin:40px auto;
            background:#6a5acd;
            color:white;
            text-align:center;
            padding:12px;
            border-radius:8px;
            text-decoration:none;
            font-weight:bold;
        }
    </style>
</head>

<body>

<div class="navbar">Your Skincare Routine</div>
<div class="container">

<h2>Hello, <%= user.getUsername() %> 👋</h2>

<% if (routineId == -1) { %>

    <h2>No routine yet. Add products from recommendations.</h2>

<% } else { %>

<!-- ================= MORNING ROUTINE ================= -->
<h3>🌞 Morning Routine</h3>
<div class="grid">

<%
    try (Connection conn = DBConnection.getConnection()) {

        String sql =
        "SELECT ri.step_order, ri.product_id, p.name, p.image_path " +
        "FROM RoutineItem ri " +
        "JOIN Product p ON ri.product_id = p.product_id " +
        "WHERE ri.routine_id = ? " +
        "AND ri.step_order IN (1,2,3,4) " +
        "ORDER BY ri.step_order";


        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, routineId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {

            int stepOrder = rs.getInt("step_order");
            String productName = rs.getString("name");
            String imagePath = rs.getString("image_path");

            String stepLabel = "";
            switch(stepOrder) {
                case 1: stepLabel = "Cleanser"; break;
                case 2: stepLabel = "Treatment / Serum"; break;
                case 3: stepLabel = "Moisturizer"; break;
                case 4: stepLabel = "Sunscreen"; break;
            }
%>

    <div class="card">
        <img src="<%= imagePath %>">
        <div class="step"><%= stepLabel %>
        </div>
        <h4><%= productName %></h4>

        <form action="RemoveRoutineItemServlet" method="post">
            <input type="hidden" name="routine_id" value="<%= routineId %>">
            <input type="hidden" name="product_id" value="<%= rs.getInt("product_id") %>">
            <button type="submit"
                    style="margin-top:10px;background:#ff4d4d;color:white;
                           border:none;padding:6px 12px;border-radius:6px;cursor:pointer;">
                Remove
            </button>
        </form>
        </div>

<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</div>

<!-- ================= NIGHT ROUTINE ================= -->
<h3>🌙 Night Routine</h3>
<div class="grid">

<%
    try (Connection conn = DBConnection.getConnection()) {

        String sql =
            "SELECT ri.step_order, ri.product_id, p.name, p.image_path " +
            "FROM RoutineItem ri " +
            "JOIN Product p ON ri.product_id = p.product_id " +
            "WHERE ri.routine_id = ? " +
            "AND ri.step_order IN (1,2,3) " +
            "ORDER BY ri.step_order";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, routineId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {

            int stepOrder = rs.getInt("step_order");
            String productName = rs.getString("name");
            String imagePath = rs.getString("image_path");

            String stepLabel = "";
            switch(stepOrder) {
                case 1: stepLabel = "Cleanser"; break;
                case 2: stepLabel = "Treatment / Serum"; break;
                case 3: stepLabel = "Moisturizer"; break;
            }
%>

    <div class="card">
        <img src="<%= imagePath %>">
        <div class="step"><%= stepLabel %></div>
        <h4><%= productName %></h4>

        <form action="RemoveRoutineItemServlet" method="post">
            <input type="hidden" name="routine_id" value="<%= routineId %>">
            <input type="hidden" name="product_id" value="<%= rs.getInt("product_id") %>">
            <button type="submit"
                    style="margin-top:10px;background:#ff4d4d;color:white;
                           border:none;padding:6px 12px;border-radius:6px;cursor:pointer;">
                Remove
            </button>
        </form>
    </div>

<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</div>

<% } %>

<a href="home.jsp" class="home-btn">Return to Home</a>

</div>
</body>
</html>
