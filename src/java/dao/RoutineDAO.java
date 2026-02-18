package dao;

import java.sql.*;

public class RoutineDAO {

    public int getOrCreateRoutine(int userId) {

        String checkSQL = "SELECT routine_id FROM Routine WHERE user_id = ?";
        String insertSQL = "INSERT INTO Routine (user_id, routine_name) VALUES (?, ?)";

        try (Connection conn = DBConnection.getConnection()) {

            PreparedStatement check = conn.prepareStatement(checkSQL);
            check.setInt(1, userId);
            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                return rs.getInt("routine_id");  
            }

            PreparedStatement insert = conn.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);
            insert.setInt(1, userId);
            insert.setString(2, "My Skincare Routine");
            insert.executeUpdate();

            ResultSet keys = insert.getGeneratedKeys();
            if (keys.next()) {
                return keys.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return -1;
    }
    
    public boolean removeItem(int routineId, int productId) {

    String sql = "DELETE FROM RoutineItem WHERE routine_id = ? AND product_id = ?";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, routineId);
        ps.setInt(2, productId);

        return ps.executeUpdate() > 0;

    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}


    public boolean addItem(int routineId, int productId, int stepOrder) {

        String checkSQL = "SELECT * FROM RoutineItem WHERE routine_id=? AND product_id=?";
        String insertSQL =
            "INSERT INTO RoutineItem (routine_id, product_id, step_order) VALUES (?,?,?)";

        try (Connection conn = DBConnection.getConnection()) {

            PreparedStatement check = conn.prepareStatement(checkSQL);
            check.setInt(1, routineId);
            check.setInt(2, productId);

            ResultSet rs = check.executeQuery();
            if (rs.next()) {
                return false; 
            }

            PreparedStatement ps = conn.prepareStatement(insertSQL);
            ps.setInt(1, routineId);
            ps.setInt(2, productId);
            ps.setInt(3, stepOrder);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
