<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%@include file="assets/chunks/header.html" %>
        <link href="assets/css/login.css" rel="stylesheet">
    </head>
    <body class='text-center'>
        <form class="form-signin" method="post" enctype="application/x-www-form-urlencoded" action="login">
        <img class="mb-4" src="assets/img/logo.png" alt="" width="72" height="72">
        <h1 class="h3 mb-3 font-weight-normal">Por favor inicie sesi&oacute;n</h1>
        <%
            if (request.getParameter("email") != null) {
        %>
                
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    Las credenciales ingresadas no son correctas.
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            
        <%
            }
        %>
        <label for="inputEmail" class="sr-only">Correo electr&oacute;nico</label>
        <input type="email" id="inputEmail" name="email" class="form-control" placeholder="Correo electr&oacute;nico" value="" required autofocus>
        <label for="inputPassword" class="sr-only">Contrase&ntilde;a</label>
        <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Contrase&ntilde;a" required>
        <div class="checkbox mb-3">
            <label>
                <input type="checkbox" value="remember-me"> Recordarme
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Inciar Sesi&oacute;n</button>
        <a href="register">o Registrarse</a>
    </form>
    </body>
</html>
