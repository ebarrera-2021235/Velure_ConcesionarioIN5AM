<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrarse</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <!-- CSS personalizado -->
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
            background: #1a1a1a;
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
    <div class="d-flex vh-100 justify-content-center align-items-center">
        <div class="card">
            <img src="img/LogoV.png" alt="Logo">
            <h3 class="text-center mb-4">Registrarse</h3>

            <form action="Controlador?menu=Usuario" method="post" onsubmit="return validarRegistro()">
                <div class="form-group">
                    <input type="text" name="nombre" id="nombre" class="form-control mb-3" placeholder="Nombre completo" required>
                </div>
                <div class="form-group">
                    <input type="text" name="usuario" id="usuario" class="form-control mb-3" placeholder="Usuario" required>
                </div>
                <div class="form-group">
                    <input type="email" name="correo" id="correo" class="form-control mb-3" placeholder="Correo electrónico" required>
                </div>
                <div class="form-group input-group">
                    <input type="password" name="password" id="confirmarClave" class="form-control" placeholder="Contraseña" required>
                    <div class="input-group-append">
                        <span class="input-group-text" onclick="togglePassword('confirmarClave','eyeIcon')" style="cursor:pointer;">
                            <i id="eyeIcon" class="bi bi-eye"></i>
                        </span>
                    </div>
                </div>

                <button type="submit" name="accion" value="Agregar" class="btn btn-primary">Registrarse</button>
                <button type="button" class="btn btn-danger" onclick="limpiarDatos()">Cancelar</button>
            </form>

            <p class="text-center mt-3">
                <a href="index.jsp" class="text-primary font-weight-bold" style="text-decoration: none;">
                    <i class="bi bi-box-arrow-in-left"></i> ¿Ya tienes cuenta? Inicia sesión
                </a>
            </p>
        </div>
    </div>

    <script>
        // Toggle de contraseña alineado como en login
        function togglePassword(inputId, iconId) {
            const input = document.getElementById(inputId);
            const icon = document.getElementById(iconId);
            if(input.type === "password") {
                input.type = "text";
            } else {
                input.type = "password";
            }
            icon.classList.toggle("bi-eye");
            icon.classList.toggle("bi-eye-slash");
        }

        function validarRegistro() {
            const nombre = document.getElementById("nombre").value.trim();
            const correo = document.getElementById("correo").value.trim();
            const usuario = document.getElementById("usuario").value.trim();
            const clave = document.getElementById("confirmarClave").value.trim();

            if (!nombre || !correo || !usuario || !clave) {
                alert("Todos los campos son obligatorios.");
                return false;
            }
            return true;
        }

        function limpiarDatos() {
            document.querySelector("form").reset();
        }
    </script>
</body>
</html>
