 <%-- Document : Compras 
    Created on : 
    13/08/2025, 22:41:42 
    Author : Jose Cortez  --%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Compras</title>
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
                <div class="titulo-compras">COMPRAS</div>
            </div>
            <div class="descripcion-compras">
                <div class="titulo-equipo">Compras Inteligentes, Resultados Excepcionales</div>
                <p>
                    En Velure, entendemos que el éxito de cada proyecto no solo depende de la visión y el talento
                    humano, sino también de la calidad de las decisiones en nuestras compras. Cada adquisición que
                    realizamos representa un paso estratégico para garantizar que nuestros clientes reciban siempre lo
                    mejor en cada producto y servicio.
                </p>
                <p>
                    Nuestro equipo de compras trabaja con profesionalismo, responsabilidad y transparencia, asegurando
                    que cada proveedor cumpla con los más altos estándares de calidad, eficiencia y confiabilidad.
                    Analizamos cuidadosamente cada opción para optimizar recursos, reducir costos innecesarios y
                    garantizar que cada inversión aporte valor real a la organización y a nuestros clientes.
                </p>
                <p>
                    En Velure fomentamos relaciones sólidas y duraderas con nuestros socios comerciales, basadas en la
                    confianza y el beneficio mutuo. Creemos que elegir correctamente no es solo una tarea
                    administrativa, sino una decisión estratégica que impulsa la innovación, fortalece nuestros procesos
                    y nos permite mantenernos a la vanguardia en el mercado.
                </p>
            </div>

            <!-- CRUD -->
            <div class="zona-crud" id="zona-crud">
                <div class="crud-container">
                    <div style="flex:1;">
                        <div class="card-form">
                            <div class="card-body">
                                <form id="formCompras" action="Controlador?menu=Compras" method="POST">
                                    <div class="form-group">
                                        <label><strong>Fecha:</strong></label>
                                        <input type="date" value="${compra.getFecha()}" name="txtFecha"
                                            class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label><strong>Total:</strong></label>
                                        <input type="number" step="0.01" min="0" value="${compra.getTotal()}"
                                            name="txtTotal" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label><strong>Descripción:</strong></label>
                                        <input type="text" value="${compra.getDescripcion()}" name="txtDescripcion"
                                            class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label><strong>Estado:</strong></label>
                                        <select name="txtEstado" class="form-control" required>
                                            <option value="Activo" ${compra.getEstado()=="Activo" ? "selected" : "" }>
                                                Activo</option>
                                            <option value="Inactivo" ${compra.getEstado()=="Inactivo" ? "selected" : ""
                                                }>Inactivo</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label><strong>Empleado:</strong></label>
                                        <select name="txtCodigoEmpleado" class="form-control" required <c:if
                                            test="${compra != null}">disabled</c:if>>
                                            <option value="" disabled <c:if
                                                test="${compra == null || compra.codigoEmpleado == 0}">selected</c:if>>
                                                Seleccione un empleado
                                            </option>
                                            <c:forEach var="e" items="${empleados}">
                                                <option value="${e.codigoEmpleado}" <c:if
                                                    test="${compra != null && compra.codigoEmpleado == e.codigoEmpleado}">
                                                    selected</c:if>>
                                                    ${e.codigoEmpleado} - ${e.nombresEmpleado}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <!-- Cambiar botones según si es 'editar' o no -->
                                    <div class="d-flex justify-content-between">
                                        <c:choose>
                                            <c:when test="${modo eq 'editar'}">
                                                <input type="submit" name="accion" value="Actualizar"
                                                    class="btn-form-minimal btn-update-minimal">
                                                <a class="btn-action-minimal btn-delete-minimal"
                                                    href="Controlador?menu=Compras&accion=Cancelar">Cancelar</a>
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
                        <div class="tabla-compras">
                            <div class="table-responsive">
                                <table class="table table-cards">
                                    <thead class="thead-cards">
                                        <tr>
                                            <th>CODIGO</th>
                                            <th>FECHA</th>
                                            <th>TOTAL</th>
                                            <th>DESCRIPCIÓN</th>
                                            <th>ESTADO</th>
                                            <th>CODIGOEMPLEADO</th>
                                            <th>ACCIONES</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="compra" items="${compras}">
                                            <tr>
                                                <td>${compra.getCodigoCompra()}</td>
                                                <td>${compra.getFecha()}</td>
                                                <td>${compra.getTotal()}</td>
                                                <td>${compra.getDescripcion()}</td>
                                                <td>${compra.getEstado()}</td>
                                                <td>${compra.getCodigoEmpleado()}</td>
                                                <td>
                                                    <div class="acciones-btns">
                                                        <a class="btn-action-minimal btn-edit-minimal"
                                                            href="Controlador?menu=Compras&accion=Editar&codigoCompra=${compra.getCodigoCompra()}">Editar</a>
                                                        <a class="btn-action-minimal btn-delete-minimal"
                                                            href="Controlador?menu=Compras&accion=Eliminar&codigoCompra=${compra.getCodigoCompra()}"
                                                            onclick="return confirmarEliminar(this);">Eliminar</a>
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

            <!-- Scripts Bootstrap y SweetAlert -->
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

            <!-- Validaciones -->
            <script>
                // Confirmar eliminación
                function confirmarEliminar(link) {
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
        </body>

        </html>