package controller.servlet;

import dao.ProductDAO;
import model.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/AddProductServlet")  
public class AddProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String brand = request.getParameter("brand");
        String skinType = request.getParameter("skinType");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        String imagePath = request.getParameter("imagePath");

        if (!skinType.equals("Dry") &&
            !skinType.equals("Oily") &&
            !skinType.equals("Combination") &&
            !skinType.equals("All")) {

            response.sendRedirect("manageProducts.jsp?error=invalidSkinType");
            return;
        }

        if (!category.equals("Cleansers") &&
            !category.equals("Moisturizers") &&
            !category.equals("Concerns") &&
            !category.equals("Sun Protection")) {

            response.sendRedirect("manageProducts.jsp?error=invalidCategory");
            return;
        }

        Product p = new Product();
        p.setName(name);
        p.setBrand(brand);
        p.setSkinType(skinType);
        p.setDescription(description);
        p.setCategory(category);
        p.setImagePath(imagePath);

        ProductDAO dao = new ProductDAO();
        dao.addProduct(p);

        response.sendRedirect("manageProducts.jsp?success=added");
    }
}
