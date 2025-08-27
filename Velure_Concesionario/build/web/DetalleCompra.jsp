    <%-- Document : Detalle Compra
    DetalleCompra Created on : 
    20/08/2025, 18:45:31 
    Author : Edwin Muxtay --%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Detalles De Compras</title>
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
                    <div class="titulo-detalleCompra">DETALLES DE COMPRAS</div>
                </div>

                <div class="descripcion-detalleCompra">
                    <div class="titulo-UnaMeta">Una Meta, Varias Ventas</div>
                    <p>En el corazón de nuestra estrategia, cada Detalle de Compra es una pieza fundamental...</p>
                    <p>Cada compra es más que un simple intercambio; es una oportunidad para fortalecer nuestras
                        relaciones comerciales...</p>
                    <p>El éxito de nuestra empresa no es un evento fortuito, sino el resultado de un proceso continuo de
                        excelencia operativa...</p>
                    <p>Cada venta no es un fin en sí mismo, sino una semilla que plantamos para cosechar el futuro más
                        próspero.</p>
                </div>

                <!-- CRUD -->
                <div class="zona-crud" id="zona-crud">
                    <div class="crud-container">
                        <div style="flex:1;">
                            <div class="card">
                                <div class="card-body">
                                    <form action="Controlador?menu=DetalleCompra" method="POST">
                                        <div class="form-group">
                                            <label><strong>Precio Unitario:</strong></label>
                                            <input type="text" value="${detalleCompra.precioUnitario}"
                                                name="txtPrecioUnitario" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label><strong>Cantidad:</strong></label>
                                            <input type="text" value="${detalleCompra.cantidad}" name="txtCantidad"
                                                class="form-control" required>
                                        </div>

                                        <!-- ComboBox Código Vehículo - SOLUCIONADO -->
                                        <div class="form-group">
                                            <label><strong>Código Vehículo:</strong></label>
                                            <c:choose>
                                                <c:when test="${detalleCompra != null && modo == 'editar'}">
                                                    <!-- Modo edición: mostrar valor actual readonly y campo hidden -->
                                                    <c:forEach var="v" items="${vehiculos}">
                                                        <c:if
                                                            test="${detalleCompra.codigoVehiculo == v.codigoVehiculo}">
                                                            <input type="text" class="form-control readonly-field"
                                                                value="${v.codigoVehiculo} - ${v.modelo}" readonly>
                                                        </c:if>
                                                    </c:forEach>
                                                    <input type="hidden" name="txtCodigoVehiculo"
                                                        value="${detalleCompra.codigoVehiculo}">
                                                </c:when>
                                                <c:otherwise>
                                                    <!-- Modo creación: combobox normal -->
                                                    <select name="txtCodigoVehiculo" class="form-control" required>
                                                        <option value="" disabled selected>Seleccione un vehículo
                                                        </option>
                                                        <c:forEach var="v" items="${vehiculos}">
                                                            <option value="${v.codigoVehiculo}">
                                                                ${v.codigoVehiculo} - ${v.modelo}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>

                                        <!-- ComboBox Código Compra - SOLUCIONADO -->
                                        <div class="form-group">
                                            <label><strong>Código Compra:</strong></label>
                                            <c:choose>
                                                <c:when test="${detalleCompra != null && modo == 'editar'}">
                                                    <!-- Modo edición: mostrar valor actual readonly y campo hidden -->
                                                    <c:forEach var="c" items="${compras}">
                                                        <c:if test="${detalleCompra.codigoCompra == c.codigoCompra}">
                                                            <input type="text" class="form-control readonly-field"
                                                                value="${c.codigoCompra} - ${c.descripcion}" readonly>
                                                        </c:if>
                                                    </c:forEach>
                                                    <input type="hidden" name="txtCodigoCompra"
                                                        value="${detalleCompra.codigoCompra}">
                                                </c:when>
                                                <c:otherwise>
                                                    <!-- Modo creación: combobox normal -->
                                                    <select name="txtCodigoCompra" class="form-control" required>
                                                        <option value="" disabled selected>Seleccione una compra
                                                        </option>
                                                        <c:forEach var="c" items="${compras}">
                                                            <option value="${c.codigoCompra}">
                                                                ${c.codigoCompra} - ${c.descripcion}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>

                                        <div class="d-flex justify-content-between">
                                            <c:choose>
                                                <c:when test="${modo eq 'editar'}">
                                                    <input type="submit" name="accion" value="Actualizar"
                                                        class="btn-form-minimal btn-update-minimal">
                                                    <a class="btn-action-minimal btn-delete-minimal"
                                                        href="Controlador?menu=DetalleCompra&accion=cancelar">Cancelar</a>
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
                                                <th>Precio Unitario</th>
                                                <th>Cantidad</th>
                                                <th>Código Vehículo</th>
                                                <th>Código Compra</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="detalleCompra" items="${detalleCompras}">
                                                <tr>
                                                    <td>${detalleCompra.codigoDetalleCompra}</td>
                                                    <td>${detalleCompra.precioUnitario}</td>
                                                    <td>${detalleCompra.cantidad}</td>
                                                    <td>${detalleCompra.codigoVehiculo}</td>
                                                    <td>${detalleCompra.codigoCompra}</td>
                                                    <td>
                                                        <div class="acciones-btns">
                                                            <a class="btn-action-minimal btn-edit-minimal"
                                                                href="Controlador?menu=DetalleCompra&accion=Editar&codigoDetalleCompra=${detalleCompra.codigoDetalleCompra}">Editar</a>
                                                            <a class="btn-action-minimal btn-delete-minimal"
                                                                href="Controlador?menu=DetalleCompra&accion=Eliminar&codigoDetalleCompra=${detalleCompra.codigoDetalleCompra}"
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
                            if (result.isConfirmed) {
                                window.location.href = link.href;
                            }
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