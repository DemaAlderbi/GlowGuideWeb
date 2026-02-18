package controller;

import dao.ProductDAO;
import model.Product;
import java.util.List;

public class RecommendationEngine {

    private ProductDAO productDAO = new ProductDAO();

    public List<Product> getCleansers(String skinType) {
        return productDAO.getByCategoryAndSkinType("Cleansers", skinType);
    }

    public List<Product> getMoisturizers(String skinType) {
        return productDAO.getByCategoryAndSkinType("Moisturizers", skinType);
    }

    public List<Product> getConcerns(String skinType) {
        return productDAO.getByCategoryAndSkinType("Concerns", skinType);
    }

    public List<Product> getSunProtection(String skinType) {
        return productDAO.getByCategoryAndSkinType("Sun Protection", skinType);
    }
}
