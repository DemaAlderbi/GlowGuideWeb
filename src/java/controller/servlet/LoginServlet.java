package controller.servlet;

import dao.UserDAO;
import model.User;
import utils.PasswordHash;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.login(email, password); 

        if (user != null) {
            // Store user in session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            if (user.getRole() != null && user.getRole().equals("ADMIN")) {
                response.sendRedirect("adminDashboard.jsp");   // Admin page
            } else {
                response.sendRedirect("home.jsp");        // Normal user page
            }
        } else {
            // Login failed — redirect with error
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
