package dao;

import model.SkinQuizQuestion;
import model.SkinQuizResult;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QuizDAO {

    // 1) Load all quiz questions
    public List<SkinQuizQuestion> getAllQuestions() {
        List<SkinQuizQuestion> list = new ArrayList<>();
        String sql = "SELECT * FROM SkinQuizQuestion";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                SkinQuizQuestion q = new SkinQuizQuestion();
                q.setQuestionId(rs.getInt("question_id"));
                q.setQuestionText(rs.getString("question_text"));
                list.add(q);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // 2) Save quiz result
    public boolean saveQuizResult(SkinQuizResult result) {
        String sql = "INSERT INTO SkinQuizResult(user_id, skin_type, analysis_text) VALUES (?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, result.getUserId());
            ps.setString(2, result.getSkinType());
            ps.setString(3, result.getAnalysisText());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 3) Get latest quiz result for a user
    public SkinQuizResult getLastResultByUser(int userId) {
        String sql = "SELECT * FROM SkinQuizResult WHERE user_id = ? ORDER BY result_id DESC LIMIT 1";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                SkinQuizResult r = new SkinQuizResult();
                r.setResultId(rs.getInt("result_id"));
                r.setUserId(rs.getInt("user_id"));
                r.setSkinType(rs.getString("skin_type"));
                r.setAnalysisText(rs.getString("analysis_text"));
                return r;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // 4) 🔹 NEW: get latest concerns (q12) from quiz_answers
    public String getLatestConcerns(int userId) {
        String sql = "SELECT q12 FROM quiz_answers WHERE user_id = ? ORDER BY quiz_id DESC LIMIT 1";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getString("q12");   // may be null
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
