<%-- 
    Document   : Venta.jsp
    Created on : 21/08/2025, 19:45:40
    Author     : Roberto Catalán
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ventas</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>
    <!-- Google Fonts Montserrat -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">
    <link href="styles/styleSheet.css" rel="stylesheet">
</head>
<body>
    <div class="zona-superior">
        <div class="descripcion-velure">
            Velure es <span style="color:#FFD700;">Velocidad</span> y <span style="color:#FFD700;">Lujosidad</span><br>
            <span style="font-size:1.2rem; font-weight:400;">El mejor lugar para encontrar tu auto deportivo soñado.</span>
        </div>
        <div class="titulo-ventas"> VENTAS </div>
    </div>

    <div class="descripcion-ventas">
        <div class="titulo-equipo"> Nuestro Equipo, Nuestra Fuerza </div>
        <p> En Velure, entendemos que el área de ventas es mucho más que un proceso de transacción: es el puente que conecta nuestros proyectos con las necesidades y sueños de cada cliente. </p>
        <p>Nuestro equipo de ventas es la primera voz de confianza que acompaña al cliente desde el inicio, escuchando, asesorando y ofreciendo soluciones que se adaptan a sus expectativas.</p>
        <p>Porque en Velure, las ventas no son solo números: son historias, proyectos y sueños que juntos hacemos realidad, llevando a cada cliente la seguridad de haber tomado la mejor decisión.</p>
    </div>

    <div class="zona-crud" id="zona-crud">
        <div class="crud-container">
            <!-- FORM -->
            <div style="flex:1;">
                <div class="card-form">
                    <div class="card-body">
                        <form id="venta-form" action="Controlador?menu=Venta" method="POST">
                            <div class="form-group">
                                <label><strong>Fecha:</strong></label>
                                <input type="date" value="${venta.getFecha()}" name="txtFecha" class="form-control">
                            </div>
                            <div class="form-group">
                                <label><strong>Total:</strong></label>
                                <input type="number" step="0.01" min="0" value="${venta.getTotal()}" name="txtTotal" class="form-control" placeholder="0.00">
                            </div>
                            <div class="form-group">
                                <label><strong>Descripción:</strong></label>
                                <input type="text" value="${venta.getDescripcion()}" name="txtDescripcion" maxlength="250" class="form-control">
                            </div>
                            <div class="form-group">
                                <label><strong>Tipo de Pago:</strong></label>
                                <select name="txtTipoDePago" class="form-control">
                                    <option value="Efectivo" ${venta.getTipoDePago() == "Efectivo" ? "selected" : ""}>Efectivo</option>
                                    <option value="Tarjeta" ${venta.getTipoDePago() == "Tarjeta" ? "selected" : ""}>Tarjeta</option>
                                    <option value="Transferencia" ${venta.getTipoDePago() == "Transferencia" ? "selected" : ""}>Transferencia</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label><strong>Cliente:</strong></label>
                                <select name="txtCodigoCliente" class="form-control" required
                                        <c:if test="${modo eq 'editar'}">disabled</c:if>>
                                    <option value="" disabled <c:if test="${venta == null || venta.codigoCliente == 0}">selected</c:if>>
                                        Seleccione un cliente
                                    </option>
                                    <c:forEach var="c" items="${clientes}">
                                        <option value="${c.codigoCliente}"
                                                <c:if test="${venta != null && venta.codigoCliente == c.codigoCliente}">selected</c:if>>
                                            ${c.codigoCliente} - ${c.nombresCliente}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label><strong>Empleado:</strong></label>
                                <select name="txtCodigoEmpleado" class="form-control" required
                                        <c:if test="${modo eq 'editar'}">disabled</c:if>>
                                    <option value="" disabled <c:if test="${venta == null || venta.codigoEmpleado == 0}">selected</c:if>>
                                        Seleccione un empleado
                                    </option>
                                    <c:forEach var="e" items="${empleados}">
                                        <option value="${e.codigoEmpleado}"
                                                <c:if test="${venta != null && venta.codigoEmpleado == e.codigoEmpleado}">selected</c:if>>
                                            ${e.codigoEmpleado} - ${e.nombresEmpleado}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="d-flex justify-content-between">
                                <c:choose>
                                    <c:when test="${modo eq 'editar'}">
                                        <input type="submit" name="accion" value="Actualizar" class="btn-form-minimal btn-update-minimal">
                                        <a class="btn-action-minimal btn-delete-minimal" href="Controlador?menu=Venta&accion=Cancelar">Cancelar</a>
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
            <!-- TABLA -->
            <div style="flex:1;">
                <div class="tabla-ventas">
                    <div class="table-responsive">
                        <table class="table table-cards">
                            <thead class="thead-cards">
                                <tr>
                                    <th>CÓDIGO</th>
                                    <th>FECHA</th>
                                    <th>TOTAL</th>
                                    <th>DESCRIPCIÓN</th>
                                    <th>TIPO DE PAGO</th>
                                    <th>CÓDIGO CLIENTE</th>
                                    <th>CÓDIGO EMPLEADO</th>
                                    <th>ACCIONES</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="venta" items="${ventas}">
                                    <tr>
                                        <td>${venta.getCodigoVenta()}</td>
                                        <td>${venta.getFecha()}</td>
                                        <td>${venta.getTotal()}</td>
                                        <td>${venta.getDescripcion()}</td>
                                        <td>${venta.getTipoDePago()}</td>
                                        <td>${venta.getCodigoCliente()}</td>
                                        <td>${venta.getCodigoEmpleado()}</td>
                                        <td>
                                            <div class="acciones-btns">
                                                <a class="btn-action-minimal btn-edit-minimal" href="Controlador?menu=Venta&accion=Editar&codigoVenta=${venta.getCodigoVenta()}">Editar</a>
                                                <a class="btn-action-minimal btn-delete-minimal" href="Controlador?menu=Venta&accion=Eliminar&codigoVenta=${venta.getCodigoVenta()}" onclick="return confirmarEliminar(this);">Eliminar</a>
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

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
    <script>
        // Mantener arriba al cargar
        window.addEventListener('load', function() { window.scrollTo(0, 0); });

        // Validaciones simples
        document.getElementById('venta-form').addEventListener('submit', function(event) {
            const total = parseFloat(this.txtTotal.value);
            const descripcion = this.txtDescripcion.value;
            if (isNaN(total) || total < 0) {
                alert("El Total debe ser un número válido mayor o igual a 0.");
                event.preventDefault();
                return;
            }
            if (!descripcion.trim()) {
                alert("La descripción no puede estar vacía.");
                event.preventDefault();
                return;
            }
            if (descripcion.length > 250) {
                alert("La descripción no puede superar los 250 caracteres.");
                event.preventDefault();
                return;
            }
        });
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <script>
            function confirmarEliminar(link) {
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
</body>
</html>