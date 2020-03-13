package controllers;

import DAO.CompanyDAO;
import DAO.MembershipDAO;
import DAO.RoleDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Company;
import model.Membership;
import model.Role;


public class RegisterServlet extends HttpServlet {
    public RegisterServlet() {
        
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CompanyDAO companydao = new CompanyDAO();
        RoleDAO roledao = new RoleDAO();
        MembershipDAO membershipdao = new MembershipDAO();
        
        List<Company> registeredCompanies = companydao.getAllCompanies();
        List<Role> currentRoles = roledao.getRoles();
        List<Membership> currentMemberships = membershipdao.getMemberships();
        
        request.setAttribute("registeredCompanies", registeredCompanies);
        request.setAttribute("currentRoles", currentRoles);
        request.setAttribute("currentMemberships", currentMemberships);
        
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }
}
