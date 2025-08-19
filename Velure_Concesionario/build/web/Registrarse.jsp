<%-- 
    Document   : Registrarse
    Created on : 13/08/2025, 17:42:00
    Author     : luisf
--%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Concesionario Velure - Registro</title>

        <!-- Bootstrap y Iconos -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

        <!-- Estilos propios -->
        <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&family=Orbitron:wght@700&display=swap');

        body {
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            background: linear-gradient(135deg, #24242c, #353738);
            color: #edeeee;
            background: url('img/Auto.gif') center/cover no-repeat fixed; 
        }

        .card {
            background-color: #1f2021;
            border-radius: 16px;
            border-top: 6px solid rgba(13, 71, 161, 0.6);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            width: 400px;
            padding: 25px 30px;
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .card img {
            width: 140px;
            display: block;
            margin: 0 auto 15px;
            transition: transform 0.3s ease;
        }

        .card img:hover { 
            transform: scale(1.05); 
        }

        .form-control {
            height: 42px;
            border-radius: 12px; 
            border: 1.8px solid #8c8c8c;
            padding: 0 12px;
            font-size: 1rem;
            transition: box-shadow 0.3s ease;
            box-sizing: border-box;
        }

        .form-control:focus {
            border-color: #0b0b0b;
            box-shadow: 0 0 8px rgba(13, 71, 161, 0.6);
            outline: none;
        }

        .input-group {
            display: flex;
            align-items: center;
        }

        .input-group .form-control {
            border-radius: 12px 0 0 12px;
            border-right: none;
        }

        .input-group-text {
            baccomkground: #1a1a1a;
            cursor: pointer;
            padding: 0 12px;
            display: flex;
            align-items: center;
            height: 42px;
            border-radius: 0 12px 12px 0;
            border: 1.8px solid #8c8c8c;
            border-left: none;
            box-sizing: border-box;
        }

        .input-group-text i {
            font-size: 1.3rem;
            color: #0d0d0d;
            transition: color 0.3s ease;
        }

        .input-group-text:hover i {
            color: #333;
        }

        .btn-primary {
            background-color: #0a3d91;
            border-color: #093572;
            color: #fff;
            font-weight: 600;
            font-size: 1.1rem;
            border-radius: 12px;
            padding: 12px 25px;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
            display: block;
            width: 250px;
            margin: 15px auto 0 auto;
            box-shadow: 0 4px 15px rgba(10, 61, 145, 0.6);
        }

        .btn-primary:hover {
            background-color: #08306b;
            border-color: #06254d;
            box-shadow: 0 6px 18px rgba(8, 48, 107, 0.8);
        }

        .btn-danger {
            background-color: #c82333;
            border-color: #bd2130;
            color: #fff;
            font-weight: 600;
            font-size: 1.1rem;
            border-radius: 12px;
            padding: 12px 25px;
            cursor: pointer;
            display: block;
            width: 250px;
            margin: 10px auto 0 auto;
            box-shadow: 0 4px 15px rgba(200, 35, 51, 0.6);
        }

        .btn-danger:hover {
            background-color: #a71d2a;
            border-color: #921826;
            box-shadow: 0 6px 18px rgba(167, 29, 42, 0.8);
        }

        @media (max-width: 576px) {
            .card {
                width: 95%;
                padding: 20px;
            }
        }
    </style>
    </head>
    <body>
        <div class="d-flex justify-content-center align-items-center vh-100">
            <div class="card p-4" style="width: 100%; max-width: 400px;">
                <form action="RegistrarUsuario" method="POST" onsubmit="return validarRegistro()">
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



                    <!-- Agregar Imagen -->
                    <!-- comment <div class="form-group">
                        <label><strong>Añadir foto perfil</strong></label>
                        <input type="file" name="fileImagen">
                    </div> 
                    
                    <div class="card-footer">
                        <button class="btn btn-outline-primary" name="accion" value="Guardar">Guardar imagen</button>
                    </div> -->

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
                            No se encontró un empleado con ese correo. Comuniquese con el administrador.
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
</html>
