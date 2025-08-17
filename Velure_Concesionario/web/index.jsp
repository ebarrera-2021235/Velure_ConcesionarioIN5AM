<%-- 
    Document   : index
    Created on : 13/08/2025, 22:14:10
    Author     : Estuardo Gómez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Concesionario Velure</title>

        <!-- Bootstrap y Iconos -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

        <!-- Estilos propios -->
        <link rel="stylesheet" href="css/ConcesionarioAutosCSS.css">
    </head>
    <body>

        <div class="d-flex justify-content-center align-items-center vh-100">
            <div class="card">
                <form action="Validar" method="POST" onsubmit="return validarFormulario()">
                    <div class="text-center">
                        <img src="img/LogoV.png" alt="Logo Suplex Cars">
                        <h4 class="mt-3 text-uppercase font-weight-bold">Inicia sesión</h4>
                        <p class="text-muted small">Suavidad, poder, presencia.</p>
                    </div>



                    <!-- Mensaje de error 
                    <div id="mensajeError" class="alert alert-danger text-center d-none">
                        <i class="bi bi-exclamation-triangle-fill"></i> Usuario o contraseña incorrectos.
                    </div>-->

                    <!-- Usuario -->
                    <div class="form-group">
                        <label><strong>Usuario</strong></label>
                        <input type="text" name="txtUser" id="txtUser" class="form-control" required>
                    </div>

                    <!-- Contraseña -->
                    <div class="form-group">
                        <label><strong>Contraseña</strong></label>
                        <div class="input-group">
                            <input type="password" name="txtPass" id="passwordInput" class="form-control" required>
                            <div class="input-group-append">
                                <span class="input-group-text" onclick="togglePassword()" style="cursor:pointer;">
                                    <i id="eyeIcon" class="bi bi-eye"></i>
                                </span>
                            </div>
                        </div>
                    </div>

                    <!-- Mensaje de error - Solo se muestra si hay error -->

                    <% if ("failed".equals(request.getAttribute("loginError"))) { %>
                    <p class="text-danger text-center mt-2">
                        <i class="bi bi-exclamation-triangle-fill"></i> 
                        Usuario o contraseña incorrectos
                    </p>
                    <% }%>

                    <!-- Botón -->
                    <div class="mt-4">
                        <input type="submit" name="accion" value="Ingresar" class="btn btn-primary">
                    </div>

                    <!-- Registro -->
                    <div class="text-center mt-3">
                        <a href="Registrarse.jsp" class="text-primary font-weight-bold" style="text-decoration: none;">
                            <i class="bi bi-person-plus-fill"></i> ¿No tienes cuenta? Regístrate aquí
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <script>
            // Muestra Oculta la contraseña
            function togglePassword() {
                const input = document.getElementById("passwordInput");
                const icon = document.getElementById("eyeIcon");
                input.type = (input.type === "password") ? "text" : "password";
                icon.classList.toggle("bi-eye");
                icon.classList.toggle("bi-eye-slash");
            }

            // Valida que no haya campos vacíos
            function validarFormulario() {
                const usuario = document.getElementById("txtUser").value.trim();
                const pass = document.getElementById("passwordInput").value.trim();
                if (!usuario || !pass) {
                    mostrarError("Por favor, complete todos los campos.");
                    return false;
                }
                return true;
            }

            // Muestra el mensaje de error
            function mostrarError(mensaje) {
                const errorDiv = document.getElementById("mensajeError");
                errorDiv.textContent = mensaje;
                errorDiv.classList.remove("d-none");
            }

            // Función para obtener parámetros de la URL
            function obtenerParametro(param) {
                const params = new URLSearchParams(window.location.search);
                return params.get(param);
            }


        </script>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
    </body>
</html>
