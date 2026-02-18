package controller;

import dao.QuizDAO;
import model.SkinQuizQuestion;
import model.SkinQuizResult;
import java.util.List;

public class QuizController {

    private QuizDAO quizDAO = new QuizDAO();

    // Get all questions
    public List<SkinQuizQuestion> loadQuestions() {
        return quizDAO.getAllQuestions();
    }

    // Determine skin type (simple version)
    public String determineSkinType(int oily, int dry, int sensitive) {

        if (oily > dry && oily > sensitive) {
            return "Oily";
        } else if (dry > oily && dry > sensitive) {
            return "Dry";
        } else if (sensitive > oily && sensitive > dry) {
            return "Sensitive";
        } else {
            return "Combination";
        }
    }

    // Save result
    public boolean saveResult(int userId, String skinType, String analysisText) {
        SkinQuizResult r = new SkinQuizResult();
        r.setUserId(userId);
        r.setSkinType(skinType);
        r.setAnalysisText(analysisText);

        return quizDAO.saveQuizResult(r);
    }

    // Get last result
    public SkinQuizResult getLastResult(int userId) {
        return quizDAO.getLastResultByUser(userId);
    }
}
