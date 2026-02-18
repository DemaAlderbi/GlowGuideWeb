package controller.servlet;

import dao.RoutineDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.User;

@WebServlet("/RoutineServlet")
public class RoutineServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)

            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getUserId();
        int productId = Integer.parseInt(request.getParameter("product_id"));
        int stepOrder = Integer.parseInt(request.getParameter("step_order"));

        RoutineDAO dao = new RoutineDAO();

        int routineId = dao.getOrCreateRoutine(userId);

        if (routineId != -1) {
            dao.addItem(routineId, productId, stepOrder);
        }

        response.sendRedirect("recommendations.jsp");
    }
}
