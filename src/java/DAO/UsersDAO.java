/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import model.Role;
import database.Dba;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Membership;

/**
 *
 * @author allcr
 */
public class UsersDAO {
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
    
    public Membership getUserMembershiptByUserId(int userId) {
        try {
            Dba database = new Dba();
            
            database.conectar();
            database.query.execute(
                    "select m.membershipId, m.roleId, m.membershipName, m.membershipDescription, m.membershipPrice "+
                    "from userRoles as u, memberships as m "+
                    "where u.userId=" + userId + " and m.membershipId=u.membershipId"
            );
            ResultSet result = database.query.getResultSet();
            
            if (result.next()) {
                Membership userMembership = new Membership(result.getInt(1), result.getInt(2), result.getString(3), result.getString(4), result.getFloat(5));
                
                database.desconectar();
                return userMembership;
            }
            
            database.desconectar();
            return null;
            
        } catch (SQLException error) {
            return null;
        }
    }
}
