package DAO;

import database.Dba;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Company;

/**
 *
 * @author allcr
 */
public class CompanyDAO {
    public List<Company> getAllCompanies() {
        try {
          Dba database = new Dba();
          database.conectar();
          
          database.query.execute("select * from companies");
          
          ResultSet result = database.query.getResultSet();
          
          List<Company> companies = new ArrayList<>();
          
          while (result.next()) {
              int companyId = result.getInt(1);
              String companyName = result.getString(2);
              String mission = result.getString(3);
              String vission = result.getString(4);
              String objectives = result.getString(5);
              String policies = result.getString(6);
              String orgChart = result.getString(7);
              String phone = result.getString(8);
              String mainEmail = result.getString(9);
              String address = result.getString(10);
              String latitude = result.getString(11);
              String longitude = result.getString(12);
              
              companies.add(new Company(companyName, mission, vission, objectives, policies, orgChart, phone, mainEmail, address, latitude, longitude, companyId));
          }
          
          database.desconectar();
          
          if (!companies.isEmpty()) {
              return companies;
          } else {
              return null;
          }
            
        } catch (SQLException error) {
            return null;
        }
    }
}
