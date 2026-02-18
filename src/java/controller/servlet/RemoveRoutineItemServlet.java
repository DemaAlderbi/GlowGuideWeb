package controller.servlet;

import dao.RoutineDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.User;

@WebServlet("/RemoveRoutineItemServlet")
public class RemoveRoutineItemServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int routineId = Integer.parseInt(request.getParameter("routine_id"));
        int productId = Integer.parseInt(request.getParameter("product_id"));

        RoutineDAO dao = new RoutineDAO();
        dao.removeItem(routineId, productId);

        response.sendRedirect("profile.jsp");
    }
}
