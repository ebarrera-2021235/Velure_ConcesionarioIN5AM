    <%-- Document : Clientes 
    Created on : 
    13/08/2025, 22:41:42 
    Author : ANGELO GARCIA --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Cliente</title>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" />
                <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">
                <link href="styles/styleSheet.css" rel="stylesheet">
                <script
                    src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
                                    <input type="text" value="${cliente.estado}" name="txtEstado" maxlength="1" minlength="1" pattern="\d{1}" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label><strong>Teléfono:</strong></label>
                                    <input type="text" value="${cliente.telefonoCliente}" name="txtTelefonoCliente" maxlength="8" minlength="8" pattern="\d{8}" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label><strong>Correo:</strong></label>
                                    <input type="text" value="${cliente.correoCliente}" name="txtCorreoCliente" class="form-control">
                                </div>
                                <div class="d-flex justify-content-between">
                                    <c:choose>
                                        <c:when test="${modo eq 'editar'}">
                                            <input type="submit" name="accion" value="Actualizar" class="btn-form-minimal btn-update-minimal">
                                            <a class="btn-action-minimal btn-delete-minimal" href="Controlador?menu=Clientes&accion=Cancelar">Cancelar</a>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="submit" name="accion" value="Agregar" class="btn-form-minimal btn-add-minimal">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
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
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                    integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
                    crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
                    integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
                    crossorigin="anonymous"></script>

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