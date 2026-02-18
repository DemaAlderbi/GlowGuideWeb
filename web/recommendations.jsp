<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User, java.util.*, model.Product, controller.RecommendationEngine" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String skinType = user.getSkinType();
    if (skinType == null) skinType = "Combination";

    RecommendationEngine engine = new RecommendationEngine();

    List<Product> cleansers     = engine.getCleansers(skinType);
    List<Product> moisturizers  = engine.getMoisturizers(skinType);
    List<Product> concerns      = engine.getConcerns(skinType);
    List<Product> sun           = engine.getSunProtection(skinType);
%>

<!DOCTYPE html>
<html>
<head>
    <title>GlowGuide - Personalized Recommendations</title>
    <style>
        body {font-family: Arial; margin:0; background:#f4f2fb;}
        .navbar {background:#6a5acd;color:white;padding:18px;text-align:center;font-size:24px;}
        .container {width:90%; margin:auto;}
        h2 {color:#6a5acd; text-align:center; margin:30px 0 10px;}
        h3 {margin-top:40px; border-bottom:3px solid #6a5acd; padding-bottom:8px;}
        .grid {display:grid;grid-template-columns:repeat(auto-fit,minmax(230px,1fr));gap:25px;margin-top:20px;}
        .card {background:white;padding:15px;border-radius:15px;box-shadow:0 0 12px rgba(0,0,0,.1);text-align:center;}
        .card h4 {color:#6a5acd;margin-top:10px;}
        .home-btn {
            display:block;
            width:220px;
            margin:50px auto;
            text-align:center;
            background:#6a5acd;
            color:white;
            padding:12px;
            border-radius:8px;
            text-decoration:none;
            font-weight:bold;
        }
    </style>
</head>

<body>

    <div class="navbar">GlowGuide – Personalized Recommendations</div>
    <div class="container">

    <h2>Skin Type: <%= skinType %></h2>

    <!-- ================= CLEANSERS ================= -->
    <h3>Cleansers</h3>
    <div class="grid">
    <% for(Product p : cleansers){ %>
        <div class="card">
            <img src="<%= p.getImagePath() %>" style="width:100%;height:200px;object-fit:contain;">
            <h4><%= p.getName() %></h4>
            <p><%= p.getBrand() %></p>
            <p><%= p.getDescription() %></p>
            <form action="RoutineServlet" method="post">
                <input type="hidden" name="product_id" value="<%= p.getProductId() %>">
                <input type="hidden" name="step_order" value="1">
                <button type="submit">Add to Routine</button>
            </form>
        </div>
    <% } %>
    </div>

    <!-- ================= MOISTURIZERS ================= -->
    <h3>Moisturizers</h3>
    <div class="grid">
    <% for(Product p : moisturizers){ %>
        <div class="card">
            <img src="<%= p.getImagePath() %>" style="width:100%;height:200px;object-fit:contain;">
            <h4><%= p.getName() %></h4>
            <p><%= p.getBrand() %></p>
            <p><%= p.getDescription() %></p>
            <form action="RoutineServlet" method="post">
                <input type="hidden" name="product_id" value="<%= p.getProductId() %>">
                <input type="hidden" name="step_order" value="3">
                <button type="submit">Add to Routine</button>
            </form>
        </div>
    <% } %>
    </div>

    <!-- ================= CONCERNS ================= -->
    <h3>Targeted Treatments</h3>
    <div class="grid">
    <% for(Product p : concerns){ %>
        <div class="card">
            <img src="<%= p.getImagePath() %>" style="width:100%;height:200px;object-fit:contain;">
            <h4><%= p.getName() %></h4>
            <p><%= p.getBrand() %></p>
            <p><%= p.getDescription() %></p>
            <form action="RoutineServlet" method="post">
                <input type="hidden" name="product_id" value="<%= p.getProductId() %>">
                <input type="hidden" name="step_order" value="2">
                <button type="submit">Add to Routine</button>
            </form>
        </div>
    <% } %>
    </div>

    <!-- ================= SUN PROTECTION ================= -->
    <h3>Daily Sun Protection</h3>
    <div class="grid">
    <% for(Product p : sun){ %>
        <div class="card">
            <img src="<%= p.getImagePath() %>" style="width:100%;height:200px;object-fit:contain;">
            <h4><%= p.getName() %></h4>
            <p><%= p.getBrand() %></p>
            <p><%= p.getDescription() %></p>
            <form action="RoutineServlet" method="post">
                <input type="hidden" name="product_id" value="<%= p.getProductId() %>">
                <input type="hidden" name="step_order" value="4">
                <button type="submit">Add to Routine</button>
            </form>
        </div>
    <% } %>
    </div>

    <a href="profile.jsp" class="home-btn">Go to My Routine</a>

    </div>
</body>
</html>
