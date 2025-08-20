<%-- 
    Document   : Clientes
    Created on : 13/08/2025, 22:41:42
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <style>
            body {
                font-family: 'Montserrat', Arial, sans-serif;
                margin: 0;
                min-height: 100vh;
            }
            .zona-superior {
                background: url('img/hos.jpg') no-repeat center center fixed;
                background-size: cover;
                position: relative;
                min-height: 450px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }
            .zona-superior::after {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: rgba(0,0,0,0.55);
                z-index: 0;
            }
            .descripcion-velure, .titulo-empleados {
                position: relative;
                z-index: 1;
                text-align: center;
                color: #fff;
                text-shadow: 2px 2px 8px #000;
            }
            .descripcion-velure {
                padding-top: 40px;
                font-size: 2rem;
                font-weight: 700;
            }
            .titulo-empleados {
                font-size: 2.8rem;
                font-weight: 700;
                margin-top: 18px;
                margin-bottom: 38px;
                letter-spacing: 2px;
            }
            .descripcion-empleados {
                max-width: 900px;
                margin: 70px auto 0 auto;
                padding: 40px 30px 30px 30px;
                background: #fff;
                border-radius: 24px;
                box-shadow: 0 8px 32px rgba(0,0,0,0.10);
                color: #222;
            }
            .titulo-equipo {
                font-size: 2.3rem;
                font-weight: 700;
                text-align: center;
                margin-bottom: 22px;
                color: #1a1a1a;
                letter-spacing: 1px;
            }
            .zona-crud {
                background: #fff;
                border-radius: 24px;
                box-shadow: 0 8px 32px rgba(0,0,0,0.18);
                max-width: 1500px;
                margin: 70px auto 40px auto;
                padding: 40px 30px;
            }
            .crud-container {
                display: flex;
                flex-direction: row;
                gap: 30px;
            }
            .tabla-empleados {
                background: transparent;
                box-shadow: none;
                border-radius: 0;
                width: 100%;
                min-width: 0;
                padding: 0;
            }

            /* FORMULARIO CARDS STYLE */
            .card-form {
                background: white;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.08);
                border: none;
                transition: all 0.3s ease;
            }
            .card-form:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            }
            .card-form .card-body {
                padding: 20px;
            }

            /* Botones del formulario con el mismo estilo */
            .btn-form-minimal {
                padding: 8px 16px;
                font-size: 0.9rem;
                border-radius: 4px;
                font-weight: 400;
                transition: background-color 0.2s ease;
                border: 1px solid;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                gap: 4px;
                cursor: pointer;
            }
            .btn-add-minimal {
                background: #fff;
                color: #17a2b8;
                border-color: #17a2b8;
            }
            .btn-add-minimal:hover {
                background: #17a2b8;
                color: white;
            }
            .btn-update-minimal {
                background: #fff;
                color: #28a745;
                border-color: #28a745;
            }
            .btn-update-minimal:hover {
                background: #28a745;
                color: white;
            }

            /* TABLA CARDS STYLE */
            .table-cards {
                border: none;
                background: transparent;
            }
            .table-cards .thead-cards th {
                background: #000000;
                color: white;
                padding: 24px 20px;
                font-weight: 600;
                text-align: center;
                border: none;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                font-size: 0.9rem;
            }
            .table-cards tbody tr {
                background: white;
                margin-bottom: 8px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.08);
                transition: all 0.3s ease;
            }
            .table-cards tbody tr:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            }
            .table-cards tbody td {
                border: none;
                padding: 15px 12px;
                vertical-align: middle;
            }
            .table-cards tbody tr td:first-child {
                border-radius: 8px 0 0 8px;
            }
            .table-cards tbody tr td:last-child {
                border-radius: 0 8px 8px 0;
            }

            /* Botones minimalistas */
            .btn-action-minimal {
                padding: 5px 10px;
                font-size: 0.8rem;
                border-radius: 4px;
                font-weight: 400;
                transition: background-color 0.2s ease;
                border: 1px solid;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                gap: 4px;
            }
            .btn-edit-minimal {
                background: #fff;
                color: #007bff;
                border-color: #007bff;
            }
            .btn-edit-minimal:hover {
                background: #007bff;
                color: white;
                text-decoration: none;
            }
            .btn-delete-minimal {
                background: #fff;
                color: #dc3545;
                border-color: #dc3545;
            }
            .btn-delete-minimal:hover {
                background: #dc3545;
                color: white;
                text-decoration: none;
            }
            .acciones-btns {
                display: flex;
                gap: 8px;
                justify-content: center;
            }

            /* Animación suave para el scroll */
            html {
                scroll-behavior: smooth;
            }

            @media (max-width: 991px) {
                .zona-crud {
                    padding: 20px 5px;
                }
                .crud-container {
                    flex-direction: column;
                    gap: 20px;
                }
                .titulo-empleados {
                    font-size: 2rem;
                }
                .descripcion-empleados {
                    padding: 20px 5px 15px 5px;
                }
                .titulo-equipo {
                    font-size: 1.5rem;
                }
                .table-responsive {
                    font-size: 0.85rem;
                }
                .btn-action-minimal {
                    padding: 4px 8px;
                    font-size: 0.75rem;
                }
                .btn-form-minimal {
                    padding: 6px 12px;
                    font-size: 0.8rem;
                }

                .card-form .form-control{
                    width: 1600px;
                }
            }
        </style>

    </head>
    <body>
        <div class="zona-superior">
            <div class="descripcion-velure">
                Velure es <span style="color:#FFD700;">Velocidad</span> y <span style="color:#FFD700;">Lujosidad</span><br>
                <span style="font-size:1.2rem; font-weight:400;">El mejor lugar para encontrar tu auto deportivo soñado.</span>
            </div>
            <div class="titulo-empleados">
                CLIENTES
            </div>
        </div>
        <div class="descripcion-empleados">
            <div class="titulo-equipo">
                Tu Confianza es Nuestra Máxima Velocidad
            </div>
            <p>
                En Velure, tu satisfacción es nuestro motor y la fuerza que nos impulsa a ir más allá. Sabemos que comprar un auto deportivo es una decisión que va más allá de la mecánica; es la culminación de un sueño, la expresión de tu pasión por la velocidad y la elegancia. Por eso, nuestra misión no es solo venderte un vehículo, sino construir una relación de confianza contigo.
            </p>
            <p>
                Desde el primer momento en que nos contactas, nos comprometemos a escuchar tus necesidades y entender tus deseos. Nuestro equipo de expertos está dedicado a guiarte en cada paso del proceso, ofreciéndote un servicio personalizado y transparente. Te garantizamos una experiencia tan emocionante y fluida como la conducción de nuestros autos, sin sorpresas, solo con la máxima dedicación.
            </p>
            <p>
                En Velure, no solo te entregamos las llaves de tu próximo auto soñado, te damos la seguridad de que estás tomando la mejor decisión. Te invitamos a descubrir por qué nuestros clientes no solo encuentran un vehículo de lujo, sino que se unen a una comunidad que valora la excelencia y la confianza.
            </p>
            <p>
                Tu confianza en nosotros es el lujo más grande que podemos tener.
            </p>
        </div>

        <div class="zona-crud">
            <div class="crud-container">
                <div style="flex:1;">
                    <div class="card-form">
                        <div class="card-body">
                            <form action="Controlador?menu=Clientes" method="POST">
                                <div class="form-group">
                                    <label><strong>Nombres:</strong></label>
                                    <input type="text" value="${cliente.nombresCliente}" name="txtNombresCliente" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label><strong>DPI:</strong></label>
                                    <input type="text" value="${cliente.DPICliente}" name="txtDPICliente" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label><strong>Direccion:</strong></label>
                                    <input type="text" value="${cliente.direccionCliente}" name="txtDireccionCliente" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label><strong>Estado:</strong></label>
                                    <input type="text" value="${cliente.estado}" name="txtEstado" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label><strong>Teléfono:</strong></label>
                                    <input type="text" value="${cliente.telefonoCliente}" name="txtTelefonoCliente" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label><strong>Correo:</strong></label>
                                    <input type="text" value="${cliente.correoCliente}" name="txtCorreoCliente" class="form-control">
                                </div>
                                <input type="submit" name="accion" value="Agregar" class="btn-form-minimal btn-add-minimal">
                                <input type="submit" name="accion" value="Actualizar" class="btn-form-minimal btn-update-minimal">
                            </form>
                        </div>
                    </div>
                </div>

                <div style="flex:1;">
                    <div class="tabla-empleados">
                        <div class="table-responsive">
                            <table class="table table-cards">
                                <thead class="thead-cards">
                                    <tr>
                                        <th>CODIGO</th>
                                        <th>NOMBRES</th>
                                        <th>DPI</th>
                                        <th>DIRECCION</th>
                                        <th>ESTADO</th>
                                        <th>TELEFONO</th>
                                        <th>CORREO</th>
                                        <th>ACCIONES</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="cli" items="${clientes}">
                                        <tr>
                                            <td>${cli.codigoCliente}</td>
                                            <td>${cli.nombresCliente}</td>
                                            <td>${cli.DPICliente}</td>
                                            <td>${cli.direccionCliente}</td>
                                            <td>${cli.estado}</td>
                                            <td>${cli.telefonoCliente}</td>
                                            <td>${cli.correoCliente}</td>
                                            <td>
                                                <div class="acciones-btns">
                                                    <a class="btn-action-minimal btn-edit-minimal" href="Controlador?menu=Clientes&accion=Editar&codigoCliente=${cli.codigoCliente}">Editar</a>
                                                    <a class="btn-action-minimal btn-delete-minimal" href="Controlador?menu=Clientes&accion=Eliminar&codigoCliente=${cli.codigoCliente}" onclick="return Eliminar(this);">Eliminar</a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

        <script>
                                                        function Eliminar(link) {
                                                            event.preventDefault();
                                                            Swal.fire({
                                                                title: '¿Está seguro?',
                                                                text: "¡No podrá deshacer esta acción!",
                                                                icon: 'warning', // Cambiado a 'warning' para que el icono se muestre correctamente
                                                                showCancelButton: true,
                                                                confirmButtonColor: '#d33',
                                                                cancelButtonColor: '#3085d6',
                                                                confirmButtonText: 'Sí, eliminar',
                                                                cancelButtonText: 'Cancelar'
                                                            }).then((result) => {
                                                                if (result.isConfirmed) {
                                                                    window.location.href = link.href;
                                                                }
                                                            });
                                                            return false;
                                                        }
        </script>

        <script>
            // Este bloque de código verifica si existe un mensaje de error
            // en los atributos de la solicitud y lo muestra con SweetAlert2.
            var error = "${error}";
            if (error && error !== "null") {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: error,
                    confirmButtonText: 'Aceptar'
                });
            }
        </script>
    </body>
</html>