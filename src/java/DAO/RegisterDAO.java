package DAO;

import model.Role;
import database.Dba;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Membership;
import model.User;

public class RegisterDAO {
    public User registerUser(String firstName, String lastName, String email, String password, String username, Date birthdate, String country, String latitude, String longitude, int roleId, int membershipId) {
        try {
            Dba database = new Dba();
            database.conectar();
            
            int insertResult = database.query.executeUpdate("INSERT INTO users(firstName, lastName, email, password, username, birthdate, country, latitude, longitude) "+
                    "VALUES(\""+ firstName +"\", \""+ lastName +"\", \""+ email +"\", \""+ password +"\", \""+ username +"\", #"+ birthdate +"#, \""+ country +"\", \""+ latitude +"\", \""+ longitude +"\")");
            
            int userId;
            
            if (insertResult > 0) {
                ResultSet result = database.query.getGeneratedKeys();
                if (result.next()) {
                    userId = result.getInt(1);
                    database.desconectar();

                    boolean insertUserRole = this.registerRoleForUser(userId, roleId, membershipId);
                    
                    if (!insertUserRole) return null;
                    
                    RoleDAO roledao = new RoleDAO();
                    Role userRole = roledao.getRoleById(roleId);

                    MembershipDAO membershipdao = new MembershipDAO();
                    Membership userMembership = membershipdao.getMembershipById(membershipId);

                    User registeredUser = new User(firstName, lastName, username, email, password, country, birthdate, latitude, longitude, userRole, userMembership, userId);
                    return registeredUser;
                } else {
                    database.desconectar();
                    return null;
                }
            } else {
                return null;
            }
        } catch (SQLException error) {
            Logger.getLogger("DATABASE ERROR").log(Level.INFO, error.getMessage());
            return null;
        }
    }
    
    public boolean registerRoleForUser(int userId, int roleId, int membershipId) {
        try {
            Dba database = new Dba();
            
            database.conectar();
            
            int insertResult = database.query.executeUpdate("insert into userRoles (userId, roleId, membershipId) values ("+ userId +", "+ roleId +", "+ membershipId +")");
            
            if (insertResult > 0) {
                database.desconectar();
                
                return true;
            } else {
                database.desconectar();
                
                return false;
            }
            
        } catch(SQLException error) {
            return false;
        }
    }
}
