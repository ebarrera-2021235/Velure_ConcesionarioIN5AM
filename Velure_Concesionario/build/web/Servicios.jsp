    <%-- Document : Servicios 
    Created on : 
    13/08/2025, 22:41:42 
    Author : Gerardo Mendez --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Servicios</title>
            <!-- Bootstrap CSS -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" />
            <!-- Google Fonts Montserrat -->
            <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">
            <link href="styles/styleSheet.css" rel="stylesheet">
        </head>

        <body>
            <div class="zona-superior">
                <div class="descripcion-velure">
                    Velure es <span style="color:#FFD700;">Velocidad</span> y <span
                        style="color:#FFD700;">Lujosidad</span><br>
                    <span style="font-size:1.2rem; font-weight:400;">El mejor lugar para encontrar tu auto deportivo
                        soñado.</span>
                </div>
                <div class="titulo-servicio">SERVICIOS</div>
            </div>

            <div class="descripcion-servicio">
                <div class="titulo-UnaMeta">Una Meta, Varios Servicios</div>
                <p>En el corazón de nuestra estrategia, cada Servicio es una pieza fundamental...</p>
                <p>Cada servicio es más que un simple mantenimiento; es una oportunidad para fortalecer nuestras
                    relaciones comerciales...</p>
                <p>El éxito de nuestra empresa no es un evento fortuito, sino el resultado de un proceso continuo de
                    excelencia operativa...</p>
                <p>Cada servicio no es un fin en sí mismo, sino una semilla que plantamos para cosechar el futuro más
                    próspero.</p>
            </div>

            <!-- CRUD -->
            <div class="zona-crud" id="zona-crud">
                <div class="crud-container">
                    <div style="flex:1;">
                        <div class="card">
                            <div class="card-body">
                                <form action="Controlador?menu=Servicios" method="POST">
                                    <div class="form-group">
                                        <label><strong>Nombre Servicio:</strong></label>
                                        <input type="text" value="${servicio.getNombreServicio()}"
                                            name="txtNombreServicio" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label><strong>Descripción:</strong></label>
                                        <textarea name="txtDescripcion" class="form-control" rows="3"
                                            required>${servicio.getDescripcion()}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label><strong>Tipo:</strong></label>
                                        <input type="text" value="${servicio.getTipo()}" name="txtTipo"
                                            class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label><strong>Fecha Servicio:</strong></label>
                                        <input type="date" value="${servicio.getFechaServicio()}"
                                            name="txtFechaServicio" class="form-control" required>
                                    </div>

                                    <!-- ComboBox Código Vehículo -->
                                    <div class="form-group">
                                        <label><strong>Código Vehículo:</strong></label>
                                        <c:choose>
                                            <c:when test="${modoEdicion}">
                                                <select name="txtCodigoVehiculo" class="form-control" disabled>
                                                    <c:forEach var="v" items="${vehiculos}">
                                                        <option value="${v.codigoVehiculo}" <c:if
                                                            test="${servicio != null && servicio.codigoVehiculo == v.codigoVehiculo}">
                                                            selected</c:if>>
                                                            ${v.codigoVehiculo}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                                <input type="hidden" name="txtCodigoVehiculo"
                                                    value="${servicio.getCodigoVehiculo()}">
                                            </c:when>
                                            <c:otherwise>
                                                <select name="txtCodigoVehiculo" class="form-control" required>
                                                    <option value="" disabled selected>Seleccione un vehículo</option>
                                                    <c:forEach var="v" items="${vehiculos}">
                                                        <option value="${v.codigoVehiculo}">${v.codigoVehiculo}</option>
                                                    </c:forEach>
                                                </select>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <div class="d-flex justify-content-between">
                                        <c:choose>
                                            <c:when test="${modoEdicion}">
                                                <input type="submit" name="accion" value="Actualizar"
                                                    class="btn-form-minimal btn-update-minimal">
                                                <a class="btn-action-minimal btn-delete-minimal"
                                                    href="Controlador?menu=Servicios&accion=Cancelar">Cancelar</a>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="submit" name="accion" value="Agregar"
                                                    class="btn-form-minimal btn-add-minimal">
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
                                            <th>Código</th>
                                            <th>Nombre Servicio</th>
                                            <th>Descripción</th>
                                            <th>Tipo</th>
                                            <th>Fecha Servicio</th>
                                            <th>Código Vehículo</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="servicio" items="${servicios}">
                                            <tr>
                                                <td>${servicio.getCodigoServicio()}</td>
                                                <td>${servicio.getNombreServicio()}</td>
                                                <td>${servicio.getDescripcion()}</td>
                                                <td>${servicio.getTipo()}</td>
                                                <td>${servicio.getFechaServicio()}</td>
                                                <td>${servicio.getCodigoVehiculo()}</td>
                                                <td>
                                                    <div class="acciones-btns">
                                                        <a class="btn-action-minimal btn-edit-minimal"
                                                            href="Controlador?menu=Servicios&accion=Editar&codigoServicio=${servicio.getCodigoServicio()}">Editar</a>
                                                        <a class="btn-action-minimal btn-delete-minimal"
                                                            href="Controlador?menu=Servicios&accion=Eliminar&codigoServicio=${servicio.getCodigoServicio()}"
                                                            onclick="confirmarEliminar(event, this);">Eliminar</a>
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

            <!-- Scripts Bootstrap -->
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script>
                window.addEventListener('load', function () { window.scrollTo(0, 0); });

                function confirmarEliminar(event, link) {
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
                        if (result.isConfirmed) { window.location.href = link.href; }
                    });
                }

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