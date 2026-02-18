package controller.servlet;

import dao.UserDAO;
import model.User;
import utils.PasswordHash;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");

        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPasswordHash(PasswordHash.hash(password));
        user.setAge(age);
        user.setGender(gender);

        UserDAO userDAO = new UserDAO();
        boolean created = userDAO.register(user);

        if (created) {
            response.sendRedirect("signup.jsp?success=1");
        } else {
            response.sendRedirect("signup.jsp?error=1");
        }
    }
}
