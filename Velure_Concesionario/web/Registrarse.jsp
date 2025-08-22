<%-- 
    Document   : Registrarse
    Created on : 13/08/2025, 17:42:00
    Author     : Estuardo Gomez
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Concesionario Velure - Registro</title>

        <!-- Bootstrap y Iconos -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link href="styles/registrar.css" rel="stylesheet">
        <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&family=Orbitron:wght@700&display=swap');
        </style>
    </head>
    <body>
        <div class="d-flex justify-content-center align-items-center vh-100">
            <div class="card p-4" style="width: 100%; max-width: 400px;">
                <form action="RegistrarUsuario" method="POST" onsubmit="return validarRegistro()">
                    <div class="text-center">
                        <img src="img/V.png" height="120px" alt="Logo Suplex Cars">
                        <h4 class="mt-3 text-uppercase font-weight-bold">Registro</h4>
                        <p class="text-muted small">Unete a Velure</p>
                    </div>

                    <!-- Mensaje de error -->
                    <div id="mensajeError" class="alert alert-danger text-center d-none">
                        <i class="bi bi-exclamation-triangle-fill"></i> Error en el registro.
                    </div>

                    <!-- Nombre -->
                    <div class="form-group">
                        <label><strong>Nombre completo</strong></label>
                        <input type="text" name="nombre" id="nombre" class="form-control" required>
                    </div>

                    <!-- Correo -->
                    <div class="form-group">
                        <label><strong>Correo electronico</strong></label>
                        <input type="email" name="correo"  class="form-control">
                    </div>
                    
                    <!-- DPI -->
                    <div class="form-group">
                        <label><strong>DPI</strong></label>
                        <input type="text" name="dpi" maxlength="13" minlength="13" pattern="\d{13}" title="El DPI debe de contener 13 dígitos" class="form-control">
                    </div>
                    
                    <!-- Telefono -->
                    <div class="form-group">
                        <label><strong>Telefono</strong></label>
                        <input type="text" name="telefono" maxlength="8" minlength="8" pattern="\d{8}" title="El número de teléfono debe ser de 8 dígitos" class="form-control">
                    </div>

                    <!-- Usuario -->
                    <div class="form-group">
                        <label><strong>Usuario</strong></label>
                        <input type="text" name="usuario" id="usuario" class="form-control" required>
                    </div>

                    <!-- Contrase�a -->
                    <div class="form-group">
                        <label><strong>Contraseña</strong></label>
                        <div class="input-group">
                            <input type="password" name="pass" id="txtPass" class="form-control" required>
                            <div class="input-group-append">
                                <span class="input-group-text" onclick="togglePassword('clave', 'eyeIcon1')" style="cursor:pointer;">
                                    <i id="eyeIcon1" class="bi bi-eye"></i>
                                </span>
                            </div>
                        </div>
                    </div>


                    <!-- Bot�n -->
                    <div class="mt-4">
                        <input type="submit" name="accion" value="Registrarse" class="btn btn-primary btn-block">
                    </div>
                    
                    <div class="mt-4">
                        <input type="submit" value="Cancelar" class="btn btn-danger btn-block" onclick="limpiarDatos()">
                    </div>

                    <!-- Mensajes de error -->
                    <%
                        String error = (String) request.getAttribute("error");
                        if (error != null) {
                    %>
                    <p class="text-danger text-center mt-2">
                        <i class="bi bi-exclamation-triangle-fill"></i> 
                        <%if ("existeEmp".equals(error)){ %>
                            No se encontro un empleado con ese correo.
                        <% }else if ("existeUser".equals(error)){ %>
                            Nombre de Usuario existente, ingrese otro.
                        <% }else if ("existeUserEmp".equals(error)){ %>
                            Este empleado ya tiene un usuario existente. 
                        <% }else if ("noExiste".equals(error)){ %>
                            Error.
                        <% }else if ("campoVacio".equals(error)){ %>
                            Correo electronico invalido, ingrese uno correctamente.
                        <% } %>
                    </p>
                    <% }%> <!-- Finaliza if -->

                    <!-- Ir a login -->
                    <div class="text-center mt-3">
                        <a href="index.jsp" class="text-primary font-weight-bold" style="text-decoration: none;">
                            <i class="bi bi-box-arrow-in-left"></i> ¿Ya tienes cuenta? Inicia sesión
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <script>
            // Mostrar/Ocultar contrase�a
            function togglePassword() {
                const input = document.getElementById("txtPass");
                const icon = document.getElementById("eyeIcon");
                if (input.type === "password") {
                    input.type = "text";
                    icon.classList.remove("bi-eye");
                    icon.classList.add("bi-eye-slash");
                } else {
                    input.type = "password";
                    icon.classList.remove("bi-eye-slash");
                    icon.classList.add("bi-eye");
                }
        }

            // Validar formulario de registro
            function validarRegistro() {
                const nombre = document.getElementById("nombre").value.trim();
                const correo = document.getElementById("correo").value.trim();
                const usuario = document.getElementById("usuario").value.trim();
                const clave = document.getElementById("pass").value.trim();
                const confirmarClave = document.getElementById("confirmarClave").value.trim();

                if (!nombre || !correo || !usuario || !clave || !confirmarClave) {
                    mostrarError("Todos los campos son obligatorios.");
                    return false;
                }

                if (clave !== confirmarClave) {
                    mostrarError("Las contrase�as no coinciden.");
                    return false;
                }

                return true;
            }

            function mostrarError(mensaje) {
                const errorDiv = document.getElementById("mensajeError");
                errorDiv.textContent = mensaje;
                errorDiv.classList.remove("d-none");
            }
            
            function limpiarDatos(){
                document.querySelector("form").reset(); //limpia los campos dle form
            }
        </script>

        <!-- Scripts de Bootstrap -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
    </body>
</html>
