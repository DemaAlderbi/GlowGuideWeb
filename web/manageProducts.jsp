<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Product, dao.ProductDAO, model.User" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || !user.getRole().equals("ADMIN")) {
        response.sendRedirect("login.jsp");
        return;
    }

    ProductDAO dao = new ProductDAO();
    List<Product> products = dao.getAllProducts();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin - Manage Products</title>
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
        }

        table {
            width: 100%;
            background: white;
            border-collapse: collapse;
            margin-top: 30px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #6a5acd;
            color: white;
        }

        .btn {
            padding: 8px 14px;
            border-radius: 5px;
            border: none;
            background: crimson;
            color: white;
            cursor: pointer;
        }

        .add-form {
            margin-top: 30px;
            background: white;
            padding: 25px;
            border-radius: 12px;
            width: 45%;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .add-form input, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
        }

        .add-form button {
            margin-top: 15px;
            background: #6a5acd;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 6px;
            cursor: pointer;
        }
    </style>
</head>

<body>

<div class="navbar">
    <div>GlowGuide - Manage Products</div>
    <div>
        Admin: <%= user.getUsername() %> |
        <a href="adminDashboard.jsp">Dashboard</a> |
        <a href="LogoutServlet">Logout</a>
    </div>
</div>

<div class="container">

<h2>Product List</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Brand</th>
        <th>Skin Type</th>
        <th>Description</th>
        <th>Action</th>
    </tr>

<%
    for(Product p : products) {
%>
    <tr>
        <td><%= p.getProductId() %></td>
        <td><%= p.getName() %></td>
        <td><%= p.getBrand() %></td>
        <td><%= p.getSkinType() %></td>
        <td><%= p.getDescription() %></td>
        <td>
            <form action="DeleteProductServlet" method="post"
                  onsubmit="return confirm('Are you sure you want to delete this product?');">
                  <input type="hidden" name="product_id" value="<%= p.getProductId() %>">
                  <button type="submit" style="background:red;color:white;">Delete</button>
            </form>
        </td>
    </tr>
<%
    }
%>
</table>

<div class="add-form">
    <h3>Add New Product</h3>

    <form action="AddProductServlet" method="post">
        <input type="text" name="name" placeholder="Product Name" required>
        <input type="text" name="brand" placeholder="Brand" required>
        <input type="text" name="skinType" placeholder="Skin Type" required>
        <textarea name="description" placeholder="Description" required></textarea>
        <input type="text" name="imagePath" placeholder="Image Path (e.g. images/cleansers/test.jpg)" required>
        <select name="category" required>
            <option value="">-- Select Category --</option>
            <option value="Cleansers">Cleansers</option>
            <option value="Moisturizers">Moisturizers</option>
            <option value="Concerns">Concerns</option>
            <option value="Sun Protection">Sun Protection</option>
        </select>

        <button type="submit">Add Product</button>
    </form>
</div>

</div>

</body>
</html>
