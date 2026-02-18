package dao;

import model.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    public List<Product> getProductsByCategory(String category) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE category = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, category);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = buildProduct(rs);
                products.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    public List<Product> getProductsBySkinType(String skinType) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE skin_type = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, skinType);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = buildProduct(rs);
                products.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    public List<Product> getByCategoryAndSkinType(String category, String skinType) {
        List<Product> products = new ArrayList<>();
        String sql =
            "SELECT * FROM Product " +
            "WHERE category = ? AND (skin_type = ? OR skin_type = 'All')";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, category);
            ps.setString(2, skinType);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = buildProduct(rs);
                products.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    public boolean addProduct(Product p) {
        String sql =
            "INSERT INTO Product (name, brand, skin_type, description, category, image_path) " +
            "VALUES (?, ?, ?, ?, ?, ?)";


        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, p.getName());
            ps.setString(2, p.getBrand());
            ps.setString(3, p.getSkinType());
            ps.setString(4, p.getDescription());
            ps.setString(5, p.getCategory());
            ps.setString(6, p.getImagePath());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean deleteProduct(int productId) {
        String sql = "DELETE FROM Product WHERE product_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, productId);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    private Product buildProduct(ResultSet rs) throws SQLException {
        Product p = new Product();
        p.setProductId(rs.getInt("product_id"));
        p.setName(rs.getString("name"));
        p.setBrand(rs.getString("brand"));
        p.setSkinType(rs.getString("skin_type"));
        p.setDescription(rs.getString("description"));
        p.setCategory(rs.getString("category"));
        p.setImagePath(rs.getString("image_path"));
        return p;
    }
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM Product";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setBrand(rs.getString("brand"));
                p.setSkinType(rs.getString("skin_type"));
                p.setDescription(rs.getString("description"));
                p.setCategory(rs.getString("category"));
                p.setImagePath(rs.getString("image_path"));
                products.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

}
