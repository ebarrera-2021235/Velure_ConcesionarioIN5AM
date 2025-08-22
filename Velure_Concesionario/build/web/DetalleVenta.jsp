    <%-- Document : Detalle Venta 
       Created on : 
       13/08/2025, 22:41:42 
       Author : Edwin Muxtay --%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Detalles De Ventas</title>
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
                    <div class="titulo-detalleVenta">
                        DETALLES DE VENTAS
                    </div>
                </div>

                <div class="descripcion-detalleVenta">
                    <div class="titulo-UnaMeta">
                        Una Meta, Varias Ventas
                    </div>
                    <p>
                        En el corazón de nuestra organización, cada detalle cuenta. Las cifras de ventas que vemos en
                        los reportes no son solo dígitos; son la manifestación tangible del esfuerzo, la pasión y el
                        compromiso inquebrantable de cada miembro de este equipo. Son la prueba irrefutable de que
                        nuestra dedicación diaria se traduce en resultados concretos y en un crecimiento sostenible.
                    </p>
                    <p>
                        Cada interacción con un cliente, ya sea una llamada, una reunión o una simple consulta, es una
                        oportunidad invaluable para forjar relaciones duraderas. No estamos simplemente vendiendo un
                        producto o servicio; estamos construyendo puentes de confianza, resolviendo problemas y
                        demostrando el valor inherente que nuestra marca aporta. Cada "sí" que obtenemos es la
                        validación de que nuestra propuesta es sólida y necesaria en el mercado.
                    </p>
                    <p>
                        El éxito no es un destino al que se llega de repente, sino la culminación de un proceso
                        continuo. Es el resultado de la disciplina, la resiliencia y la consistencia en cada acción. No
                        se trata de un solo golpe de suerte o una victoria aislada, sino de la suma acumulativa de cada
                        pequeña decisión bien tomada, de cada obstáculo superado y de cada lección aprendida. Somos un
                        equipo que no se conforma con lo fácil, sino que busca constantemente la excelencia.
                    </p>
                    <p>
                        Sigamos construyendo juntos el futuro que deseamos, uno donde nuestro trabajo no solo se refleje
                        en los números, sino en el impacto positivo que generamos en el mundo de los negocios.
                    </p>
                </div>

                <!-- CRUD -->
                <div class="zona-crud" id="zona-crud">
                    <div class="crud-container">
                        <div style="flex:1;">
                            <div class="card">
                                <div class="card-body">
                                    <form action="Controlador?menu=DetalleVenta" method="POST">
                                        <div class="form-group">
                                            <label><strong>Cantidad:</strong></label>
                                            <input type="number" name="txtCantidad" value="${detalleVenta.cantidad}"
                                                class="form-control" required min="1" step="1">
                                        </div>

                                        <div class="form-group">
                                            <label><strong>Precio Venta:</strong></label>
                                            <input type="number" step="0.01" name="txtPrecioVenta"
                                                value="${detalleVenta.precioVenta}" class="form-control" required
                                                min="0.01">
                                        </div>

                                        <!-- ComboBox Código Vehículo - SOLUCIONADO -->
                                        <div class="form-group">
                                            <label><strong>Código Vehículo:</strong></label>
                                            <c:choose>
                                                <c:when test="${detalleVenta != null && modo == 'editar'}">
                                                    <!-- Modo edición: mostrar valor actual readonly y campo hidden -->
                                                    <c:forEach var="v" items="${vehiculos}">
                                                        <c:if test="${detalleVenta.codigoVehiculo == v.codigoVehiculo}">
                                                            <input type="text" class="form-control readonly-field"
                                                                value="${v.codigoVehiculo} - ${v.marca} ${v.modelo}"
                                                                readonly>
                                                        </c:if>
                                                    </c:forEach>
                                                    <input type="hidden" name="txtCodigoVehiculo"
                                                        value="${detalleVenta.codigoVehiculo}">
                                                </c:when>
                                                <c:otherwise>
                                                    <!-- Modo creación: combobox normal -->
                                                    <select name="txtCodigoVehiculo" class="form-control" required>
                                                        <option value="" disabled selected>Seleccione un vehículo
                                                        </option>
                                                        <c:forEach var="v" items="${vehiculos}">
                                                            <option value="${v.codigoVehiculo}">
                                                                ${v.codigoVehiculo} - ${v.marca} ${v.modelo}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>

                                        <!-- ComboBox Código Venta - SOLUCIONADO -->
                                        <div class="form-group">
                                            <label><strong>Código Venta:</strong></label>
                                            <c:choose>
                                                <c:when test="${detalleVenta != null && modo == 'editar'}">
                                                    <!-- Modo edición: mostrar valor actual readonly y campo hidden -->
                                                    <c:forEach var="venta" items="${ventas}">
                                                        <c:if test="${detalleVenta.codigoVenta == venta.codigoVenta}">
                                                            <input type="text" class="form-control readonly-field"
                                                                value="${venta.codigoVenta} - ${venta.fecha}" readonly>
                                                        </c:if>
                                                    </c:forEach>
                                                    <input type="hidden" name="txtCodigoVenta"
                                                        value="${detalleVenta.codigoVenta}">
                                                </c:when>
                                                <c:otherwise>
                                                    <!-- Modo creación: combobox normal -->
                                                    <select name="txtCodigoVenta" class="form-control" required>
                                                        <option value="" disabled selected>Seleccione una venta</option>
                                                        <c:forEach var="venta" items="${ventas}">
                                                            <option value="${venta.codigoVenta}">
                                                                ${venta.codigoVenta} - ${venta.fecha}
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
                                                        href="Controlador?menu=DetalleVenta&accion=cancelar">Cancelar</a>
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
                                                <th>Cantidad</th>
                                                <th>Precio Venta</th>
                                                <th>Vehículo</th>
                                                <th>Venta</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="detalleVenta" items="${detalleVentas}">
                                                <tr>
                                                    <td>${detalleVenta.codigoDetalleVenta}</td>
                                                    <td>${detalleVenta.cantidad}</td>
                                                    <td>${detalleVenta.precioVenta}</td>
                                                    <td>
                                                        <c:forEach var="v" items="${vehiculos}">
                                                            <c:if
                                                                test="${detalleVenta.codigoVehiculo == v.codigoVehiculo}">
                                                                ${v.codigoVehiculo} - ${v.marca} ${v.modelo}
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <td>
                                                        <c:forEach var="venta" items="${ventas}">
                                                            <c:if
                                                                test="${detalleVenta.codigoVenta == venta.codigoVenta}">
                                                                ${venta.codigoVenta} - ${venta.fecha}
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <td>
                                                        <div class="acciones-btns">
                                                            <a class="btn-action-minimal btn-edit-minimal"
                                                                href="Controlador?menu=DetalleVenta&accion=Editar&codigoDetalleVenta=${detalleVenta.codigoDetalleVenta}">Editar</a>
                                                            <a class="btn-action-minimal btn-delete-minimal"
                                                                href="Controlador?menu=DetalleVenta&accion=Eliminar&codigoDetalleVenta=${detalleVenta.codigoDetalleVenta}"
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
                    // mantener arriba al cargar
                    window.addEventListener('load', function () {
                        window.scrollTo(0, 0);
                    });

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