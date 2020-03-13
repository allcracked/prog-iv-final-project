package DAO;

import database.Dba;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Membership;

public class MembershipDAO {
    public List<Membership> getMemberships() {
        try {
            Dba database = new Dba();
            
            database.conectar();
            database.query.execute("select * from memberships");
            
            ResultSet result = database.query.getResultSet();
            
            List<Membership> memberships = new ArrayList<>();
            
            while (result.next()) {
                memberships.add(new Membership(result.getInt(1), result.getInt(2), result.getString(3), result.getString(4), result.getInt(5)));
            }
            
            database.desconectar();
            
            if (!memberships.isEmpty()) {
                return memberships;
            }
            
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
                Membership userMembership = new Membership(result.getInt(1), result.getInt(2), result.getString(3), result.getString(4), result.getInt(5));
                
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
