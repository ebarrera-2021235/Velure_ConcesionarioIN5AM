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
                background-color: #f0f2f5; 
            }
            
            .zona-crud {
                background: #fff;
                border-radius: 24px;
                box-shadow: 0 8px 32px rgba(0,0,0,0.18);
                max-width: 2000px;
                margin: 70px auto 40px auto;
                padding: 40px 30px;
            }
            
            .crud-container {
                display: flex;
                flex-direction: row;
                gap: 30px;
            }
            
            .tabla-clientes {
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
                
                .titulo-clientes {
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
        <div class="zona-crud">
            <div class="crud-container">
                <div class="card-form">
                    <div style="flex:1;">
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
                    <div class="tabla-clientes">
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

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" xintegrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" xintegrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" xintegrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

        <script>
            function Eliminar(link) {
            event.preventDefault();
            Swal.fire({
            title: '¿Está seguro?',
            text: "¡No podrá deshacer esta acción!",
            icon: 'warning', 
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