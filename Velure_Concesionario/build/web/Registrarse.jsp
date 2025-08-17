<%-- 
    Document   : Registrarse
    Created on : 17/08/2025, 11:54:48
    Author     : Estuardo Gomez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Concesionario Velure - Registro</title>

        <!-- Bootstrap e Iconos -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

        <!-- Estilos propios -->
        <link rel="stylesheet" href="css/ConcesionarioAutosCSS.css">
    </head>
    <body>
        <div class="d-flex justify-content-center align-items-center vh-100">
            <div class="card p-4" style="width: 100%; max-width: 400px;">
                <form action="RegistrarUsuario?accion=Guardar" method="POST" onsubmit="return validarRegistro()">
                    <div class="text-center">
                        <img src="img/LogoV.png" alt="Logo Suplex Cars">
                        <h4 class="mt-3 text-uppercase font-weight-bold">Registro</h4>
                        <p class="text-muted small">¡Únete a Velure!</p>
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
                        <label><strong>Correo electrónico</strong></label>
                        <input type="email" name="correo" class="form-control">
                    </div>

                    <!-- Usuario -->
                    <div class="form-group">
                        <label><strong>Usuario</strong></label>
                        <input type="text" name="usuario" id="usuario" class="form-control" required>
                    </div>

                    <!-- Contraseña -->
                    <div class="form-group">
                        <label><strong>Contraseña</strong></label>
                        <div class="input-group">
                            <input type="password" name="pass" id="confirmarClave" class="form-control" required>
                            <div class="input-group-append">
                                <span class="input-group-text" onclick="togglePassword('clave', 'eyeIcon1')" style="cursor:pointer;">
                                    <i id="eyeIcon1" class="bi bi-eye"></i>
                                </span>
                            </div>
                        </div>
                    </div>


                    <!-- Botón -->
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
                            No se encontró un empleado con ese correo.
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
            // Mostrar/Ocultar contraseña
            function togglePassword(inputId, iconId) {
                const input = document.getElementById(inputId);
                const icon = document.getElementById(iconId);
                input.type = (input.type === "password") ? "text" : "password";
                icon.classList.toggle("bi-eye");
                icon.classList.toggle("bi-eye-slash");
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
                    mostrarError("Las contraseñas no coinciden.");
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
