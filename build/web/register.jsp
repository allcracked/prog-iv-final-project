<%@page import="model.Membership"%>
<%@page import="model.Role"%>
<%@page import="java.util.List"%>
<%@page import="model.Company"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        // Obteniendo todos los datos necesarios para el formulario
        List<Company> companies = (List<Company>)request.getAttribute("registeredCompanies");
        List<Role> roles = (List<Role>)request.getAttribute("currentRoles");
        List<Membership> memberships = (List<Membership>)request.getAttribute("currentMemberships");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de usuario</title>
        <%@include file="assets/chunks/header.html" %>
        <link href="assets/css/register.css" rel="stylesheet">
        <script>
            const availableRoles = [
                <%
                    for (Role role: roles) {
                        out.print("{id: "+ role.roleId +", name: '"+ role.roleName +"', description: '"+ role.roleDescription +"'},");
                    }
                %>       
            ];
            
            const availableMemberships = [];
            
            availableRoles.forEach(function (role) {
                availableMemberships[role.id] = [];
            });
            
            <%
                for (Membership membership: memberships) {
                    out.print("availableMemberships["+ membership.roleId +"].push({id: "+ membership.membershipId +", roleId: "+ membership.roleId +", name: '"+ membership.membershipName +"', description: '"+ membership.membershipDescription +"', price: "+ membership.membershipPrice +"});");
                }
            %>
            
        </script>
    </head>
    <body>
        <div class="container">
            <div class="py-5 text-center">
                <img class="d-block mx-auto mb-4" src="assets/img/logo.png" alt="" width="72" height="72">
                <h2>Formulario de Registro</h2>
                <p class="lead">Complete el siguiente formulario para registrar un nuevo usuario, puede seleccionar una empresa o crear una nueva.</p>
            </div>

            <div class="row">
              <div class="col-md-8 order-md-1 offset-md-2">

                <form class="needs-validation">
                    <h4>Empresa</h4>
                    <div class="mb-3">
                        <label for="companyId">Seleccione una empresa</label>
                        <select class="custom-select d-block w-100" id="companyId" name="companyId" required>
                            <option value="">Seleccione</option>
                            <option value="new">Crear una nueva empresa</option>
                            <%
                                if (companies != null) {
                                    for(Company company: companies) {
                                        out.print("<option value='"+ company.id +"'>"+ company.getName() +"</option>");
                                    }
                                }
                            %>
                        </select>
                        <div class="invalid-feedback">
                            Seleccione una empresa o cree una nueva
                        </div>
                    </div>
                            
                    <div id="new-company-form">
                        <input type="hidden" name="new-company" value="true">
                        <div class="mb-3">
                            <label for="companyName">Nombre de la empresa</label>
                            <input type="text" class="form-control" id="companyName" name="companyName" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Un nombre para la empresa es necesario
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="companyPhone">Numero</label>
                                <input type="tel" class="form-control" id="companyPhone" name="companyPhone" placeholder="" value="" required>
                                <div class="invalid-feedback">
                                    Un numero de telefono es necesario
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="companyEmail">Correo Principal</label>
                                <input type="email" class="form-control" id="companyEmail" name="companyEmail" placeholder="" value="" required>
                                <div class="invalid-feedback">
                                    Un correo para la empresa es necesario
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="companyAddress">Direcci&oacute;n de la empresa</label>
                            <input type="text" class="form-control" id="companyAddress" name="companyAddress" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Una direcci&oacute;n para la empresa es necesaria
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="companyLatitude">Latitud</label>
                                <input type="text" class="form-control" id="companyLatitude" name="companyLatitude" placeholder="" value="" required>
                                <div class="invalid-feedback">
                                    Una latitud es necesaria
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="companyLongitude">Longitud</label>
                                <input type="email" class="form-control" id="companyLongitude" name="companyLongitude" placeholder="" value="" required>
                                <div class="invalid-feedback">
                                    Una longitud es necesaria
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="companyMission">Misi&oacute;n de la empresa</label>
                            <textarea rows="3" class="form-control" id="companyMission" name="companyMission" required></textarea>
                            <div class="invalid-feedback">
                                Una misi&oacute;n para la empresa es necesaria
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="companyVission">Visi&oacute;n de la empresa</label>
                            <textarea rows="3" class="form-control" id="companyVission" name="companyVission" required></textarea>
                            <div class="invalid-feedback">
                                Una visi&oacute;n para la empresa es necesaria
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="companyObjectives">Objetivos de la empresa</label>
                            <textarea rows="3" class="form-control" id="companyObjectives" name="companyObjectives" required></textarea>
                            <div class="invalid-feedback">
                                Objetivos para la empresan son necesarios
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="companyPolicies">Pol&iacute;ticas de la empresa</label>
                            <textarea rows="3" class="form-control" id="companyPolicies" name="companyPolicies" required></textarea>
                            <div class="invalid-feedback">
                                Pol&iacute;ticas para la empresan son necesarios
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="companyOrgChart">Enlace de organigrama de la empresa</label>
                            <input type="url" class="form-control" id="companyOrgChart" name="companyOrgChart" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Un enlace del organigrama es necesario
                            </div>
                        </div>
                    </div>
                        
                    <hr class="mb-4">
                    
                    <h4>Usuario</h4>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="firstName">Nombre</label>
                            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                El nombre es necesario
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="lastName">Apellido</label>
                            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                El apellido es necesario
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                      <label for="username">Nombre de usuario</label>
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text">@</span>
                        </div>
                        <input type="text" class="form-control" id="username" name="username" placeholder="" required>
                        <div class="invalid-feedback" style="width: 100%;">
                          Un nombre de usuario es necesario
                        </div>
                      </div>
                    </div>

                    <div class="mb-3">
                        <label for="email">Correo Electr&oacute;nico</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="usuario@dominio.com" required>
                        <div class="invalid-feedback">
                            Por favor introduzca un email valido
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="password">Contrase&ntilde;a</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="" required>
                        <div class="invalid-feedback">
                            Contrase&ntilde;a no v&aacu&aacute;lida
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="country">Pais</label>
                            <input type="text" class="form-control" id="country" name="country" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Un pais es necesario
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="birthdate">Fecha de Nacimiento</label>
                            <input type="date" class="form-control" id="birthdate" name="birthdate" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                La fecha de nacimiento es necesaria
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="latitude">Latitud</label>
                            <input type="text" class="form-control" id="latitude" name=latitude"" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Latitud es necesaria
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="longitude">Longitud</label>
                            <input type="text" class="form-control" id="longitude" name="longitude" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Longitud es necesaria
                            </div>
                        </div>
                    </div>
                    
                    <hr class="mb-4">
                    
                    <h4>Membres&iacute;a</h4>
                    <div class="mb-3">
                        <label for="userRole">Seleccione un rol para su usuario</label>
                        <select class="custom-select d-block w-100" id="userRole" name="userRole" required>
                            <option value="">Seleccione</option>
                            <%
                                if (roles != null) {
                                    for(Role role: roles) {
                                        out.print("<option value='"+ role.roleId +"'>"+ role.roleName +"</option>");
                                    }
                                }
                            %>
                        </select>
                        <div class="invalid-feedback">
                            Seleccione un rol
                        </div>
                    </div>
                        
                    <div class="mb-3">
                        <label for="userMembership">Seleccione una membresia</label>
                        <select class="custom-select d-block w-100" id="userMembership" name="userMembership" required>
                            <option value="">Seleccione</option>
                            <%
                                if (memberships != null) {
                                    for(Membership membership: memberships) {
                                        out.print("<option value='"+ membership.membershipId +"'>"+ membership.membershipName +"</option>");
                                    }
                                }
                            %>
                        </select>
                        <div class="invalid-feedback">
                            Seleccione una membresia
                        </div>
                    </div>
                        
                    <div class="card text-center" id="membership-description" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>

                  
                  <hr class="mb-4">
                  <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="same-address">
                    <label class="custom-control-label" for="same-address">Shipping address is the same as my billing address</label>
                  </div>
                  <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="save-info">
                    <label class="custom-control-label" for="save-info">Save this information for next time</label>
                  </div>
                  <hr class="mb-4">

                  <h4 class="mb-3">Payment</h4>

                  <div class="d-block my-3">
                    <div class="custom-control custom-radio">
                      <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                      <label class="custom-control-label" for="credit">Credit card</label>
                    </div>
                    <div class="custom-control custom-radio">
                      <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
                      <label class="custom-control-label" for="debit">Debit card</label>
                    </div>
                    <div class="custom-control custom-radio">
                      <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
                      <label class="custom-control-label" for="paypal">PayPal</label>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6 mb-3">
                      <label for="cc-name">Name on card</label>
                      <input type="text" class="form-control" id="cc-name" placeholder="" required>
                      <small class="text-muted">Full name as displayed on card</small>
                      <div class="invalid-feedback">
                        Name on card is required
                      </div>
                    </div>
                    <div class="col-md-6 mb-3">
                      <label for="cc-number">Credit card number</label>
                      <input type="text" class="form-control" id="cc-number" placeholder="" required>
                      <div class="invalid-feedback">
                        Credit card number is required
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-3 mb-3">
                      <label for="cc-expiration">Expiration</label>
                      <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
                      <div class="invalid-feedback">
                        Expiration date required
                      </div>
                    </div>
                    <div class="col-md-3 mb-3">
                      <label for="cc-cvv">CVV</label>
                      <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
                      <div class="invalid-feedback">
                        Security code required
                      </div>
                    </div>
                  </div>
                  <hr class="mb-4">
                  <button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button>
                </form>
              </div>
            </div>

            <footer class="my-5 pt-5 text-muted text-center text-small">
              <p class="mb-1">&copy; 2017-2019 Company Name</p>
              <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Privacy</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Support</a></li>
              </ul>
            </footer>
        </div>
                            
        <script src="assets/js/register.js"></script>
    </body>
</html>
