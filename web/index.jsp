<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.awt.Color"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.Dba"%>
<%@page import="controllers.databasePath" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
        <%@include file="assets/chunks/header.html" %>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            databasePath path = new databasePath();
            // out.print(path.getDatabasePath());
            try {
                // Windows location
                Dba db = new Dba(application.getRealPath("") + "db\\daw.mdb");
                // Mac location
                // Dba db = new Dba(application.getRealPath("db/daw.mdb"));
                
                db.conectar();
                db.query.execute("select userId, username from users");
                
                ResultSet rs=db.query.getResultSet();
                
                while(rs.next()){
                    out.print(rs.getString(1) + " " + rs.getString(2) + "<br>");
                }
            } catch (Exception error) {
                error.printStackTrace();
            }
            

        %>
    </body>
</html>
