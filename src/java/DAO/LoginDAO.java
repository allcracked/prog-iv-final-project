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
                String latitude = result.getString(9);
                String longitude = result.getString(10);
                
                RoleDAO roledao = new RoleDAO();
                MembershipDAO membershipdao = new MembershipDAO();
                
                Role userRole = roledao.getUserRoleByUserId(userId);
                Membership userMembership = membershipdao.getUserMembershiptByUserId(userId);
                
                User loggedUser = new User(firstName, lastName, username, userEmail, userPass, country, birthdate, latitude, longitude, userRole, userMembership, userId);
                
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
