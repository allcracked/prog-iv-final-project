<%@page import="model.Membership"%>
<%@page import="model.Role"%>
<%@page import="java.util.List"%>
<%@page import="model.Company"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de usuario</title>
        <%@include file="assets/chunks/header.html" %>
    </head>
    
    <%
        // Obteniendo todos los datos necesarios para el formulario
        List<Company> companies = (List<Company>)request.getAttribute("registeredCompanies");
        List<Role> roles = (List<Role>)request.getAttribute("currentRoles");
        List<Membership> memberships = (List<Membership>)request.getAttribute("currentMemberships");
    %>
    
    <body>
        <div class="container">
            <div class="py-5 text-center">
                <img class="d-block mx-auto mb-4" src="assets/img/logo.png" alt="" width="72" height="72">
                <h2>Formulario de Registro</h2>
                <p class="lead">Complete el siguiente formulario para registrar un nuevo usuario, puede seleccionar una empresa o crear una nueva.</p>
            </div>

            <div class="row">
              <div class="col-md-8 order-md-1 offset-md-2">
                  
                 
                  
                  
                
                <form class="needs-validation" novalidate>
                    <h4>Empresa</h4>
                    <div class="mb-3">
                        <label for="companyId">Seleccione una empresa</label>
                        <select class="custom-select d-block w-100" id="companyId" required>
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
                            
                    <div class="mb-3">
                        <label for="companyName">Nombre de la empresa</label>
                        <input type="text" class="form-control" id="companyName" placeholder="" value="" required>
                        <div class="invalid-feedback">
                            Un nombre para la empresa es necesario
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="companyPhone">Numero</label>
                            <input type="tel" class="form-control" id="companyPhone" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Un numero de telefono es necesario
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="companyEmail">Correo Principal</label>
                            <input type="email" class="form-control" id="companyEmail" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Un correo para la empresa es necesario
                            </div>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="companyAddress">Direcci&oacute;n de la empresa</label>
                        <input type="text" class="form-control" id="companyAddress" placeholder="" value="" required>
                        <div class="invalid-feedback">
                            Una direcci&oacute;n para la empresa es necesaria
                        </div>
                    </div>
                        
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="companyLatitude">Latitud</label>
                            <input type="text" class="form-control" id="companyLatitude" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Una latitud es necesaria
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="companyLongitude">Longitud</label>
                            <input type="email" class="form-control" id="companyLongitude" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Una longitud es necesaria
                            </div>
                        </div>
                    </div>
                        
                    <div class="mb-3">
                        <label for="companyMission">Misi&oacute;n de la empresa</label>
                        <textarea rows="3" class="form-control" id="companyMission" required></textarea>
                        <div class="invalid-feedback">
                            Una misi&oacute;n para la empresa es necesaria
                        </div>
                    </div>
                        
                    <div class="mb-3">
                        <label for="companyVission">Visi&oacute;n de la empresa</label>
                        <textarea rows="3" class="form-control" id="companyVission" required></textarea>
                        <div class="invalid-feedback">
                            Una visi&oacute;n para la empresa es necesaria
                        </div>
                    </div>
                        
                    <div class="mb-3">
                        <label for="companyObjectives">Objetivos de la empresa</label>
                        <textarea rows="3" class="form-control" id="companyObjectives" required></textarea>
                        <div class="invalid-feedback">
                            Objetivos para la empresan son necesarios
                        </div>
                    </div>
                        
                    <div class="mb-3">
                        <label for="companyPolicies">Pol&iacute;ticas de la empresa</label>
                        <textarea rows="3" class="form-control" id="companyPolicies" required></textarea>
                        <div class="invalid-feedback">
                            Pol&iacute;ticas para la empresan son necesarios
                        </div>
                    </div>
                        
                    <div class="mb-3">
                        <label for="companyOrgChart">Enlace de organigrama de la empresa</label>
                        <input type="url" class="form-control" id="companyOrgChart" placeholder="" value="" required>
                        <div class="invalid-feedback">
                            Un enlace del organigrama es necesario
                        </div>
                    </div>
                        

                  <div class="mb-3">
                    <label for="username">Username</label>
                    <div class="input-group">
                      <div class="input-group-prepend">
                        <span class="input-group-text">@</span>
                      </div>
                      <input type="text" class="form-control" id="username" placeholder="Username" required>
                      <div class="invalid-feedback" style="width: 100%;">
                        Your username is required.
                      </div>
                    </div>
                  </div>

                  <div class="mb-3">
                    <label for="email">Email <span class="text-muted">(Optional)</span></label>
                    <input type="email" class="form-control" id="email" placeholder="you@example.com">
                    <div class="invalid-feedback">
                      Please enter a valid email address for shipping updates.
                    </div>
                  </div>

                  <div class="mb-3">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" id="address" placeholder="1234 Main St" required>
                    <div class="invalid-feedback">
                      Please enter your shipping address.
                    </div>
                  </div>

                  <div class="mb-3">
                    <label for="address2">Address 2 <span class="text-muted">(Optional)</span></label>
                    <input type="text" class="form-control" id="address2" placeholder="Apartment or suite">
                  </div>

                  <div class="row">
                    <div class="col-md-5 mb-3">
                      <label for="country">Country</label>
                      <select class="custom-select d-block w-100" id="country" required>
                        <option value="">Choose...</option>
                        <option>United States</option>
                      </select>
                      <div class="invalid-feedback">
                        Please select a valid country.
                      </div>
                    </div>
                    <div class="col-md-4 mb-3">
                      <label for="state">State</label>
                      <select class="custom-select d-block w-100" id="state" required>
                        <option value="">Choose...</option>
                        <option>California</option>
                      </select>
                      <div class="invalid-feedback">
                        Please provide a valid state.
                      </div>
                    </div>
                    <div class="col-md-3 mb-3">
                      <label for="zip">Zip</label>
                      <input type="text" class="form-control" id="zip" placeholder="" required>
                      <div class="invalid-feedback">
                        Zip code required.
                      </div>
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
