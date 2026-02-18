package model;

public class SkinQuizResult {

    private int resultId;
    private int userId;
    private String skinType;
    private String analysisText;

    public int getResultId() {
        return resultId;
    }
    public void setResultId(int resultId) {
        this.resultId = resultId;
    }

    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getSkinType() {
        return skinType;
    }
    public void setSkinType(String skinType) {
        this.skinType = skinType;
    }

    public String getAnalysisText() {
        return analysisText;
    }
    public void setAnalysisText(String analysisText) {
        this.analysisText = analysisText;
    }
}
