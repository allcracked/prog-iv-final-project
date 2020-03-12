<%@page import="java.util.List"%>
<%@page import="model.Company"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de usuario</title>
    </head>
    
    <%
        List<Company> companies = (List<Company>)request.getAttribute("registeredCompanies");
    %>
    
    <body>
        <select name="company">
            <%
                if (companies != null) {
                    out.print("<option value='none' selected>Seleccione una empresa de la lista</option>");
                    for(Company company: companies) {
                        out.print("<option value='"+ company.id +"'>"+ company.getName() +"</option>");
                    }
                } else {
                    out.print("<option value='none' selected>Cree una nueva empresa</option>");
                }
            %>
        </select>
    </body>
</html>
