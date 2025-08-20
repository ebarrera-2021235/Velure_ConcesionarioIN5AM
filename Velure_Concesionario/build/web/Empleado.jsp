<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Empleado</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>
    <!-- Google Fonts Montserrat -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <style>
        /* FUENTES Y BODY */
        body {
            font-family: 'Montserrat', Arial, sans-serif;
            margin: 0;
            min-height: 100vh;
        }

        /* ZONA SUPERIOR */
        .zona-superior {
            background: url('img/em.jpg') no-repeat center center fixed;
            background-size: cover;
            position: relative;
            min-height: 350px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .zona-superior::after {
            content: "";
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: rgba(0,0,0,0.55);
            z-index: 0;
        }

        /* DESCRIPCIONES Y TITULOS ZONA SUPERIOR */
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

        /* DESCRIPCION EMPLEADOS */
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

        /* ZONA CRUD */
        .zona-crud {
            background: #fff;
            border-radius: 24px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.18);
            max-width: 1200px;
            margin: 70px auto 40px auto;
            padding: 40px 30px;
        }

        .crud-container {
            display: flex;
            flex-direction: row;
            gap: 30px;
        }

        /* TABLA EMPLEADOS */
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

        /* BOTONES FORMULARIO MINIMAL */
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
            padding: 16px 12px;
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

        /* BOTONES MINIMALISTAS */
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

        /* ANIMACIÓN SUAVE SCROLL */
        html {
            scroll-behavior: smooth;
        }

        /* MEDIA QUERIES RESPONSIVE */
        @media (max-width: 991px) {
            .zona-crud { padding: 20px 5px; }
            .crud-container { flex-direction: column; gap: 20px; }
            .titulo-empleados { font-size: 2rem; }
            .descripcion-empleados { padding: 20px 5px 15px 5px; }
            .titulo-equipo { font-size: 1.5rem; }
            .table-responsive { font-size: 0.85rem; }
            .btn-action-minimal { padding: 4px 8px; font-size: 0.75rem; }
            .btn-form-minimal { padding: 6px 12px; font-size: 0.8rem; }
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
            EMPLEADOS
        </div>
    </div>

    <div class="descripcion-empleados">
        <div class="titulo-equipo">
            Nuestro Equipo, Nuestra Fuerza
        </div>
        <p>
            En Velure, creemos que el éxito de una empresa no se mide únicamente por sus resultados financieros, sino por la calidad humana y profesional de las personas que la conforman. Nuestros empleados son el motor que impulsa cada uno de nuestros proyectos, aportando su talento, dedicación y compromiso para ofrecer siempre lo mejor a nuestros clientes.
        </p>
        <p>
            Contamos con un equipo diverso y altamente capacitado, que trabaja con pasión y responsabilidad en cada área de la organización. Desde la atención al cliente hasta la gestión administrativa y técnica, cada colaborador desempeña un papel fundamental para garantizar que nuestros procesos sean eficientes, innovadores y de excelencia.
        </p>
        <p>
            En Velure fomentamos un ambiente laboral donde se valora el esfuerzo individual y se promueve el trabajo en equipo. Nos enorgullece brindar oportunidades de crecimiento profesional, estabilidad y desarrollo personal, contribuyendo así a mejorar la calidad de vida de quienes forman parte de nuestra gran familia.
        </p>
        <p>
            Porque en Velure no solo construimos proyectos, también construimos sueños, y cada uno de nuestros empleados es pieza clave para que estos se hagan realidad.
        </p>
    </div>

    <!-- Mensaje de alerta -->
    <c:if test="${not empty mensaje}">
        <div class="alert alert-danger">${mensaje}</div>
    </c:if>

    <!-- ZONA CRUD -->
    <div class="d-flex">
        <div class="card col-sm-4 card-form">
            <div class="card-body">
                <form action="Controlador?menu=Empleado" method="POST">
                    <div class="form-group">
                        <label><strong>DPI:</strong></label>
                        <input type="text" value="${empleado.getDPIEmpleado()}" name="txtDPIEmpleado" class="form-control" required inputmode="numeric" maxlength="13" pattern="[0-9]+" title="Solo se permiten números" oninput="this.value=this.value.replace(/[^0-9]/g,'')">
                    </div>
                    <div class="form-group">
                        <label><strong>Nombres:</strong></label>
                        <input type="text" value="${empleado.getNombresEmpleado()}" name="txtNombresEmpleado" class="form-control" required pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+" title="Solo se permiten letras y espacios" oninput="this.value=this.value.replace(/[^A-Za-zÁÉÍÓÚáéíóúÑñ\s]/g,'')">
                    </div>
                    <div class="form-group">
                        <label><strong>Teléfono:</strong></label>
                        <input type="text" value="${empleado.getTelefonoEmpleado()}" name="txtTelefonoEmpleado" class="form-control" required inputmode="numeric" maxlength="8" pattern="[0-9]+" title="Solo se permiten números" oninput="this.value=this.value.replace(/[^0-9]/g,'')">
                    </div>
                    <div class="form-group">
                        <label><strong>Estado:</strong></label>
                        <input type="text" value="${empleado.getEstado()}" name="txtEstadoEmpleado" class="form-control" required inputmode="numeric" maxlength="1" pattern="[12]" title="Solo se permite 1 o 2" oninput="this.value=this.value.replace(/[^12]/g,'')">
                    </div>
                    <div class="form-group">
                        <label><strong>Usuario:</strong></label>
                        <input type="text" value="${empleado.getUsuario()}" name="txtUsuarioEmpleado" class="form-control" required>
                    </div>

                    <!-- BOTONES DINÁMICOS SEGÚN MODO -->
                    <c:choose>
                        <c:when test="${modo eq 'editar'}">
                            <input type="submit" name="accion" value="Actualizar" class="btn btn-success btn-form-minimal btn-update-minimal">
                        </c:when>
                        <c:otherwise>
                            <input type="submit" name="accion" value="Agregar" class="btn btn-info btn-form-minimal btn-add-minimal">
                        </c:otherwise>
                    </c:choose>

                </form>
            </div>
        </div>

        <div class="col-sm-8 table-responsive">
            <table class="table table-hover table-cards">
                <thead class="thead-cards">
                    <tr>
                        <th>CODIGO</th>
                        <th>DPI</th>
                        <th>NOMBRES</th>
                        <th>TELEFONO</th>
                        <th>ESTADO</th>
                        <th>USUARIO</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="empleado" items="${empleados}"> 
                        <tr>
                            <td>${empleado.getCodigoEmpleado()}</td>
                            <td>${empleado.getDPIEmpleado()}</td>
                            <td>${empleado.getNombresEmpleado()}</td>
                            <td>${empleado.getTelefonoEmpleado()}</td>
                            <td>${empleado.getEstado()}</td>
                            <td>${empleado.getUsuario()}</td>
                            <td class="acciones-btns">
                                <a class="btn btn-warning btn-action-minimal btn-edit-minimal" href="Controlador?menu=Empleado&accion=Editar&codigoEmpleado=${empleado.getCodigoEmpleado()}">Editar</a>
                                <a class="btn btn-danger btn-action-minimal btn-delete-minimal" href="Controlador?menu=Empleado&accion=Eliminar&codigoEmpleado=${empleado.getCodigoEmpleado()}" onclick="return confirmarEliminar(this);">Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
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

        // Mantener scroll arriba al cargar
        window.addEventListener('load', function() {
            window.scrollTo(0, 0);
        });
    </script>
</body>
</html>
