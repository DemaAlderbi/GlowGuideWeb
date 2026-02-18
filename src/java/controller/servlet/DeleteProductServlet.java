package controller.servlet;

import dao.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/DeleteProductServlet")  
public class DeleteProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("product_id"));

        ProductDAO dao = new ProductDAO();
        dao.deleteProduct(productId);

        response.sendRedirect("manageProducts.jsp?success=deleted");
    }
}
