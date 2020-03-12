package DAO;

import database.Dba;
import java.sql.ResultSet;
import java.sql.Date;
import java.sql.SQLException;
import model.Membership;
import model.Role;
import model.User;

/**
 *
 * @author allcr
 */
public class LoginDAO {
    public User loginUserWithEmailAndPassword(String email, String password) {
        try {
            Dba database = new Dba();
            
            database.conectar();
            database.query.execute("select * from users where email='" + email + "' and password='" + password + "'");
            ResultSet result = database.query.getResultSet();
            
            if (result.next()) {
                int userId = result.getInt(1);
                String firstName = result.getString(2);
                String lastName = result.getString(3);
                String userEmail = result.getString(4);
                String userPass = result.getString(5);
                String username = result.getString(6);
                Date birthdate = result.getDate(7);
                String country = result.getString(8);
                String mapLocation = result.getString(9);
                
                UsersDAO userdao = new UsersDAO();
                
                Role userRole = userdao.getUserRoleByUserId(userId);
                Membership userMembership = userdao.getUserMembershiptByUserId(userId);
                
                User loggedUser = new User(firstName, lastName, username, userEmail, userPass, country, birthdate, mapLocation, userRole, userMembership, userId);
                
                database.desconectar();
                return loggedUser;
            }
            
            database.desconectar();
            return null;
            
        } catch (SQLException error) {
            return null;
        }
    }
}
