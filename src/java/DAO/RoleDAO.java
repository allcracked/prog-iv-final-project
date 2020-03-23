package DAO;

import database.Dba;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Role;

public class RoleDAO {
    public List<Role> getRoles() {
        try {
            Dba database = new Dba();
            
            database.conectar();
            database.query.execute("select * from roles");
            
            ResultSet result = database.query.getResultSet();
            
            List<Role> roles = new ArrayList<>();
            
            while (result.next()) {
                roles.add(new Role(result.getInt(1), result.getString(2), result.getString(3)));
            }
            
            database.desconectar();
            
            if (!roles.isEmpty()) {
                return roles;
            }
            
            return null;
        } catch (SQLException error) {
            return null;
        }
    }
    
    public Role getUserRoleByUserId(int userId) {
        try {
            Dba database = new Dba();
            
            database.conectar();
            database.query.execute(
                    "select r.roleId, r.roleName, r.roleDescription "+
                    "from userRoles as u, roles as r "+
                    "where  u.userId=" + userId + " and r.roleId=u.roleId");
            
            ResultSet result = database.query.getResultSet();
            
            if (result.next()) {
                Role userRole = new Role(result.getInt(1), result.getString(2), result.getString(3));
                
                database.desconectar();
                return userRole;
            }
            
            database.desconectar();
            return null;
            
        } catch (SQLException error) {
            return null;
        }
    }
    
    public Role getRoleById(int roleId) {
        try {
            Dba database = new Dba();
            
            database.conectar();
            
            database.query.execute("select * from roles where roleId=" + roleId);
            
            ResultSet result = database.query.getResultSet();
            
            if (result.next()) {
                Role role = new Role(result.getInt(1), result.getString(2), result.getString(3));
                
                database.desconectar();
                return role;
            }
            
            database.desconectar();
            return null;
            
        } catch (SQLException error) {
            return null;
        }
    }
}
