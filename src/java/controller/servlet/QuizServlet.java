package controller.servlet;

import dao.DBConnection;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/QuizServlet")
public class QuizServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        model.User user = (model.User) session.getAttribute("user");

        // If user is not logged in, go back to login
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getUserId();

        // -------------------- READ ALL QUIZ ANSWERS -------------------- //
        String q1  = request.getParameter("q1");
        String q2  = request.getParameter("q2");
        String q3  = request.getParameter("q3");
        String q4  = request.getParameter("q4");
        String q5  = request.getParameter("q5");
        String q6  = request.getParameter("q6");
        String q7  = request.getParameter("q7");
        String q8  = request.getParameter("q8");
        String q9  = request.getParameter("q9");
        String q10 = request.getParameter("q10");
        String q11 = request.getParameter("q11");

        // ✅ IMPORTANT: name="q12" in the quiz JSP
        //   so we must use getParameterValues("q12")
        String[] goalsArray = request.getParameterValues("q12[]");
        String goals = (goalsArray != null && goalsArray.length > 0)
                ? String.join(",", goalsArray)
                : "";

        // -------------------- SIMPLE SKIN-TYPE SCORING -------------------- //
        int dry = 0, normal = 0, oily = 0;

        if ("dry".equalsIgnoreCase(q1)) dry++;
        if ("normal".equalsIgnoreCase(q1)) normal++;
        if ("oily".equalsIgnoreCase(q1)) oily++;

        if ("dry".equalsIgnoreCase(q2)) dry++;
        if ("normal".equalsIgnoreCase(q2)) normal++;
        if ("oily".equalsIgnoreCase(q2)) oily++;

        if ("dry".equalsIgnoreCase(q3)) dry++;
        if ("normal".equalsIgnoreCase(q3)) normal++;
        if ("oily".equalsIgnoreCase(q3)) oily++;

        if ("dry".equalsIgnoreCase(q4)) dry++;
        if ("normal".equalsIgnoreCase(q4)) normal++;
        if ("oily".equalsIgnoreCase(q4)) oily++;

        if ("normal".equalsIgnoreCase(q5)) normal++;
        if ("sensitive".equalsIgnoreCase(q5)) dry++;

        String skinType;
        if (oily > dry && oily > normal) {
            skinType = "Oily";
        } else if (dry > oily && dry > normal) {
            skinType = "Dry";
        } else {
            skinType = "Combination";
        }

        String readableGoals = goals.replace(",", ", ");

        String analysisText =
                "Based on your answers, your skin type is " + skinType +
                ". Your skincare goals include: " + readableGoals +
                ". Recommended routine and products are generated accordingly.";

        // -------------------- SAVE TO DATABASE -------------------- //
        try (Connection conn = DBConnection.getConnection()) {

            // 1) Save all raw answers (including concerns) into quiz_answers
            String insertAnswers = "INSERT INTO quiz_answers " +
                    "(user_id, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps1 = conn.prepareStatement(insertAnswers);
            ps1.setInt(1, userId);
            ps1.setString(2, q1);
            ps1.setString(3, q2);
            ps1.setString(4, q3);
            ps1.setString(5, q4);
            ps1.setString(6, q5);
            ps1.setString(7, q6);
            ps1.setString(8, q7);
            ps1.setString(9, q8);
            ps1.setString(10, q9);
            ps1.setString(11, q10);
            ps1.setString(12, q11);
            ps1.setString(13, goals);
            ps1.executeUpdate();

            // 2) Save/update quiz result summary
            String insertResult =
                    "INSERT INTO SkinQuizResult (user_id, skin_type, analysis_text) " +
                    "VALUES (?, ?, ?) " +
                    "ON DUPLICATE KEY UPDATE " +
                    "skin_type = VALUES(skin_type), " +
                    "analysis_text = VALUES(analysis_text)";

            PreparedStatement ps2 = conn.prepareStatement(insertResult);
            ps2.setInt(1, userId);
            ps2.setString(2, skinType);
            ps2.setString(3, analysisText);
            ps2.executeUpdate();

            // 3) Update user table with latest skin type
            String updateUser = "UPDATE user SET skin_type = ? WHERE user_id = ?";
            PreparedStatement ps3 = conn.prepareStatement(updateUser);
            ps3.setString(1, skinType);
            ps3.setInt(2, userId);
            ps3.executeUpdate();

            // 4) Update session copy
            user.setSkinType(skinType);
            session.setAttribute("user", user);

            // Also keep concerns in session if you ever want to use them directly
            session.setAttribute("concerns", goals);

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Go to recommendations page
        response.sendRedirect("recommendations.jsp");
    }
}
