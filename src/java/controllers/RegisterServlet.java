package controllers;

import DAO.CompanyDAO;
import DAO.MembershipDAO;
import DAO.RegisterDAO;
import DAO.RoleDAO;
import java.io.IOException;
import static java.lang.Integer.parseInt;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Company;
import model.Membership;
import model.Role;
import model.User;


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
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String country = request.getParameter("country");
        Date birthdate = Date.valueOf(request.getParameter("birthdate"));
        String latitude = request.getParameter("latitude");
        String longitude = request.getParameter("longitude");
        int userRole = parseInt(request.getParameter("userRole"));
        int userMembership = parseInt(request.getParameter("userMembership"));
        
        RegisterDAO registerdao = new RegisterDAO();
        User registeredUser = registerdao.registerUser(firstName, lastName, email, password, username, birthdate, country, latitude, longitude, userRole, userMembership);
        
        if (registeredUser != null) {
            request.setAttribute("loggedUser", registeredUser);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            request.setAttribute("registrationError", "Ocurrio un problema durante el registro de su usuario. Intente de nuevo mas tarde.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }
}
