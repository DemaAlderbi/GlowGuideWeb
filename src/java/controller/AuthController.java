package controller;

import dao.UserDAO;
import model.User;
import utils.PasswordHash;

public class AuthController {

    private UserDAO userDAO = new UserDAO();

    public boolean register(String username, String email, String password, int age, String gender) {
        User u = new User();
        u.setUsername(username);
        u.setEmail(email);
        u.setAge(age);
        u.setGender(gender);
        u.setPasswordHash(PasswordHash.hash(password));

        return userDAO.register(u);
    }

    public User login(String email, String password) {
        String hash = PasswordHash.hash(password);
        return userDAO.login(email, hash);
    }
}
