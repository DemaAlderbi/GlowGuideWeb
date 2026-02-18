package dao;

import model.User;
import utils.PasswordHash;
import java.util.List;
import java.util.ArrayList;
import java.sql.*;

public class UserDAO {
    
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM User";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setUsername(rs.getString("username"));
                u.setEmail(rs.getString("email"));
                u.setSkinType(rs.getString("skin_type"));
                u.setRole(rs.getString("role")); 

                users.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }


    public boolean register(User user) {

        String sql = "INSERT INTO user (username, email, password_hash, age, gender) VALUES (?,?,?,?,?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPasswordHash());
            ps.setInt(4, user.getAge());
            ps.setString(5, user.getGender());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace(); 
            return false;
        }
    }

    public User login(String email, String inputPassword) {

        String sql = "SELECT * FROM user WHERE email = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String storedHash = rs.getString("password_hash");

                if (PasswordHash.verify(inputPassword, storedHash)) {

                    User u = new User();
                    u.setUserId(rs.getInt("user_id"));
                    u.setUsername(rs.getString("username"));
                    u.setEmail(rs.getString("email"));
                    u.setPasswordHash(storedHash);
                    u.setAge(rs.getInt("age"));
                    u.setGender(rs.getString("gender"));
                    u.setSkinType(rs.getString("skin_type"));
                    u.setRole(rs.getString("role"));
                    return u;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
