
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Params</title>
    </head>
    <body>
        <%
            // out.print("<p>userId: "+ request.getAttribute("userId") +"</p>");
            out.print("<p>firstName: " + request.getParameter("firstName") + "</p>");
            out.print("<p>lastName: " + request.getParameter("lastName") + "</p>");
            out.print("<p>username: " + request.getParameter("username") + "</p>");
            out.print("<p>email: " + request.getParameter("email") + "</p>");
            out.print("<p>password: " + request.getParameter("password") + "</p>");
            out.print("<p>country: " + request.getParameter("country") + "</p>");
            out.print("<p>birthdate: " + request.getParameter("birthdate") + " SQL.date "+ Date.valueOf(request.getParameter("birthdate")) +"</p>");
            out.print("<p>latitude: " + request.getParameter("latitude") + "</p>");
            out.print("<p>longitude: " + request.getParameter("longitude") + "</p>");
            out.print("<p>userRole: " + request.getParameter("userRole") + "</p>");
            out.print("<p>userMembership: " + request.getParameter("userMembership") + "</p>");
            
        %>
    </body>
</html>
