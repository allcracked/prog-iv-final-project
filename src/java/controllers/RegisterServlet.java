package controllers;

import DAO.CompanyDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Company;


public class RegisterServlet extends HttpServlet {
    public RegisterServlet() {
        
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CompanyDAO companydao = new CompanyDAO();
        List<Company> registeredCompanies = companydao.getAllCompanies();
        
        request.setAttribute("registeredCompanies", registeredCompanies);
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }
}
