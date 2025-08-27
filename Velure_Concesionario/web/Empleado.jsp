     <%-- Document : Empleado 
    Created on : 
    13/08/2025, 22:41:42 
    Author : Antony Tun--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Empleado</title>
            <!-- Bootstrap CSS -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" />
            <!-- Google Fonts Montserrat -->
            <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">
            <!-- SweetAlert2 -->
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <link href="styles/empleados.css" rel="stylesheet">



        </head>

        <body>
            <div class="zona-superior">
                <div class="descripcion-velure">
                    Velure es <span style="color:#FFD700;">Velocidad</span> y <span
                        style="color:#FFD700;">Lujosidad</span><br>
                    <span style="font-size:1.2rem; font-weight:400;">El mejor lugar para encontrar tu auto deportivo
                        soñado.</span>
                </div>
                <div class="titulo-empleados">
                    EMPLEADOS
                </div>
            </div>

            <div class="descripcion-empleados">
                <div class="titulo-equipo">
                    Nuestro Equipo, Nuestra Fuerza
                </div>
                <p>
                    En Velure, creemos que el éxito de una empresa no se mide únicamente por sus resultados financieros,
                    sino por la calidad humana y profesional de las personas que la conforman. Nuestros empleados son el
                    motor que impulsa cada uno de nuestros proyectos, aportando su talento, dedicación y compromiso para
                    ofrecer siempre lo mejor a nuestros clientes.
                </p>
                <p>
                    Contamos con un equipo diverso y altamente capacitado, que trabaja con pasión y responsabilidad en
                    cada área de la organización. Desde la atención al cliente hasta la gestión administrativa y
                    técnica, cada colaborador desempeña un papel fundamental para garantizar que nuestros procesos sean
                    eficientes, innovadores y de excelencia.
                </p>
                <p>
                    En Velure fomentamos un ambiente laboral donde se valora el esfuerzo individual y se promueve el
                    trabajo en equipo. Nos enorgullece brindar oportunidades de crecimiento profesional, estabilidad y
                    desarrollo personal, contribuyendo así a mejorar la calidad de vida de quienes forman parte de
                    nuestra gran familia.
                </p>
                <p>
                    Porque en Velure no solo construimos proyectos, también construimos sueños, y cada uno de nuestros
                    empleados es pieza clave para que estos se hagan realidad.
                </p>
            </div>

            <!-- Mensaje de alerta -->
            <c:if test="${not empty mensaje}">
                <div class="alert alert-danger">${mensaje}</div>
            </c:if>

            <!-- ZONA CRUD -->
            <div class="zona-crud">
                <div class="crud-container">
                    <div class="card card-form">
                        <div class="card-body">
                            <form action="Controlador?menu=Empleado" method="POST">
                                <div class="form-group">
                                    <label><strong>DPI:</strong></label>
                                    <input type="text" value="${empleado.getDPIEmpleado()}" name="txtDPIEmpleado"
                                        class="form-control" required inputmode="numeric" maxlength="13"
                                        pattern="[0-9]+" title="Solo se permiten números"
                                        oninput="this.value=this.value.replace(/[^0-9]/g,'')">
                                </div>
                                <div class="form-group">
                                    <label><strong>Nombres:</strong></label>
                                    <input type="text" value="${empleado.getNombresEmpleado()}"
                                        name="txtNombresEmpleado" class="form-control" required
                                        pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+" title="Solo se permiten letras y espacios"
                                        oninput="this.value=this.value.replace(/[^A-Za-zÁÉÍÓÚáéíóúÑñ\s]/g,'')">
                                </div>
                                <div class="form-group">
                                    <label><strong>Teléfono:</strong></label>
                                    <input type="text" value="${empleado.getTelefonoEmpleado()}"
                                        name="txtTelefonoEmpleado" class="form-control" required inputmode="numeric"
                                        maxlength="8" pattern="[0-9]+" title="Solo se permiten números"
                                        oninput="this.value=this.value.replace(/[^0-9]/g,'')">
                                </div>
                                <div class="form-group">
                                    <label><strong>Estado:</strong></label>
                                    <input type="text" value="${empleado.getEstado()}" name="txtEstadoEmpleado"
                                        class="form-control" required inputmode="numeric" maxlength="1" pattern="[12]"
                                        title="Solo se permite 1 o 2"
                                        oninput="this.value=this.value.replace(/[^12]/g,'')">
                                </div>
                                <div class="form-group">
                                    <label><strong>Correo:</strong></label>
                                    <input type="email" value="${empleado.getCorreoEmpleado()}" name="txtCorreoEmpleado"
                                        class="form-control" required>
                                </div>

                                <c:choose>
                                    <c:when test="${modo eq 'editar'}">
                                        <input type="submit" name="accion" value="Actualizar"
                                            class="btn btn-success btn-form-minimal btn-update-minimal">
                                        <a class="btn btn-danger btn-action-minimal"
                                            href="Controlador?menu=Empleado&accion=Cancelar">Cancelar</a>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="submit" name="accion" value="Agregar"
                                            class="btn btn-info btn-form-minimal btn-add-minimal">
                                    </c:otherwise>
                                </c:choose>
                            </form>
                        </div>
                    </div>

                    <div class="table-responsive tabla-empleados">
                        <table class="table table-hover table-cards">
                            <thead class="thead-cards">
                                <tr>
                                    <th>CODIGO</th>
                                    <th>DPI</th>
                                    <th>NOMBRES</th>
                                    <th>TELEFONO</th>
                                    <th>ESTADO</th>
                                    <th>CORREO</th>
                                    <th>ACCIONES</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="e" items="${empleados}">
                                    <tr>
                                        <td>${e.getCodigoEmpleado()}</td>
                                        <td>${e.getDPIEmpleado()}</td>
                                        <td>${e.getNombresEmpleado()}</td>
                                        <td>${e.getTelefonoEmpleado()}</td>
                                        <td>${e.getEstado()}</td>
                                        <td>${e.getCorreoEmpleado()}</td>
                                        <td class="acciones-btns">
                                            <a class="btn btn-warning btn-action-minimal btn-edit-minimal"
                                                href="Controlador?menu=Empleado&accion=Editar&codigoEmpleado=${e.getCodigoEmpleado()}">Editar</a>
                                            <a class="btn btn-danger btn-action-minimal btn-delete-minimal"
                                                href="Controlador?menu=Empleado&accion=Eliminar&codigoEmpleado=${e.getCodigoEmpleado()}"
                                                onclick="return confirmarEliminar(this);">Eliminar</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Scripts Bootstrap -->
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>

            <!-- Confirmación SweetAlert2 -->
            <script>
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

                window.addEventListener('load', function () {
                    window.scrollTo(0, 0);
                });
            </script>
        </body>

        </html>