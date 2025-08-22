<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Servicios</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>
    <!-- Google Fonts Montserrat -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Montserrat', Arial, sans-serif; margin: 0; min-height: 100vh; }
        .zona-superior {
            background: url('img/P.jpg') no-repeat center -250px fixed;
            background-size: cover;
            position: relative;
            min-height: 400px;
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
        .descripcion-velure, .titulo-servicio {
            position: relative;
            z-index: 1;
            text-align: center;
            color: #fff;
            text-shadow: 2px 2px 8px #000;
        }
        .descripcion-velure { padding-top: 40px; font-size: 2rem; font-weight: 700; }
        .titulo-servicio { font-size: 2.8rem; font-weight: 700; margin-top: 18px; margin-bottom: 38px; letter-spacing: 2px; }
        .descripcion-servicio {
            max-width: 900px;
            margin: 70px auto 0 auto;
            padding: 40px 30px 30px 30px;
            background: #fff;
            border-radius: 24px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.10);
            color: #222;
        }
        .titulo-UnaMeta { font-size: 2.3rem; font-weight: 700; text-align: center; margin-bottom: 22px; color: #1a1a1a; letter-spacing: 1px; }
        .zona-crud {
            background: #fff;
            border-radius: 24px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.18);
            max-width: 1200px;
            margin: 70px auto 40px auto;
            padding: 40px 30px;
        }
        .crud-container { display: flex; flex-direction: row; gap: 30px; }
        .card-form { background: white; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.08); border: none; transition: all 0.3s ease; }
        .card-form:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(0,0,0,0.15); }
        .card-form .card-body { padding: 20px; }
        .btn-form-minimal { padding: 8px 16px; font-size: 0.9rem; border-radius: 4px; font-weight: 400; transition: background-color 0.2s ease; border: 1px solid; text-decoration: none; display: inline-flex; align-items: center; justify-content: center; gap: 4px; cursor: pointer; }
        .btn-add-minimal { background: #fff; color: #17a2b8; border-color: #17a2b8; }
        .btn-add-minimal:hover { background: #17a2b8; color: white; }
        .btn-update-minimal { background: #fff; color: #28a745; border-color: #28a745; }
        .btn-update-minimal:hover { background: #28a745; color: white; }
        .table-cards { border: none; background: transparent; }
        .table-cards .thead-cards th { background: #000000; color: white; padding: 16px 12px; font-weight: 600; text-align: center; border: none; text-transform: uppercase; letter-spacing: 0.5px; font-size: 0.9rem; }
        .table-cards tbody tr { background: white; margin-bottom: 8px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.08); transition: all 0.3s ease; }
        .table-cards tbody tr:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(0,0,0,0.15); }
        .table-cards tbody td { border: none; padding: 15px 12px; vertical-align: middle; }
        .table-cards tbody tr td:first-child { border-radius: 8px 0 0 8px; }
        .table-cards tbody tr td:last-child { border-radius: 0 8px 8px 0; }
        .btn-action-minimal { padding: 5px 10px; font-size: 0.8rem; border-radius: 4px; font-weight: 400; transition: background-color 0.2s ease; border: 1px solid; text-decoration: none; display: inline-flex; align-items: center; gap: 4px; }
        .btn-edit-minimal { background: #fff; color: #007bff; border-color: #007bff; }
        .btn-edit-minimal:hover { background: #007bff; color: white; text-decoration: none; }
        .btn-delete-minimal { background: #fff; color: #dc3545; border-color: #dc3545; }
        .btn-delete-minimal:hover { background: #dc3545; color: white; text-decoration: none; }
        .acciones-btns { display: flex; gap: 8px; justify-content: center; }
        html { scroll-behavior: smooth; }
        @media (max-width: 991px) {
            .zona-crud { padding: 20px 5px; }
            .crud-container { flex-direction: column; gap: 20px; }
            .titulo-servicio { font-size: 2rem; }
            .descripcion-servicio { padding: 20px 5px 15px 5px; }
            .titulo-UnaMeta { font-size: 1.5rem; }
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
        <div class="titulo-servicio">SERVICIOS</div>
    </div>
    
    <div class="descripcion-servicio">
        <div class="titulo-UnaMeta">Una Meta, Varios Servicios</div>
        <p>En el corazón de nuestra estrategia, cada Servicio es una pieza fundamental...</p>
        <p>Cada servicio es más que un simple mantenimiento; es una oportunidad para fortalecer nuestras relaciones comerciales...</p>
        <p>El éxito de nuestra empresa no es un evento fortuito, sino el resultado de un proceso continuo de excelencia operativa...</p>
        <p>Cada servicio no es un fin en sí mismo, sino una semilla que plantamos para cosechar el futuro más próspero.</p>
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
                                <input type="text" value="${servicio.getNombreServicio()}" name="txtNombreServicio" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label><strong>Descripción:</strong></label>
                                <textarea name="txtDescripcion" class="form-control" rows="3" required>${servicio.getDescripcion()}</textarea>
                            </div>
                            <div class="form-group">
                                <label><strong>Tipo:</strong></label>
                                <input type="text" value="${servicio.getTipo()}" name="txtTipo" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label><strong>Fecha Servicio:</strong></label>
                                <input type="date" value="${servicio.getFechaServicio()}" name="txtFechaServicio" class="form-control" required>
                            </div>

                            <!-- ComboBox Código Vehículo -->
                            <div class="form-group">
                                <label><strong>Código Vehículo:</strong></label>
                                <c:choose>
                                    <c:when test="${modoEdicion}">
                                        <select name="txtCodigoVehiculo" class="form-control" disabled>
                                            <c:forEach var="v" items="${vehiculos}">
                                                <option value="${v.codigoVehiculo}" 
                                                    <c:if test="${servicio != null && servicio.codigoVehiculo == v.codigoVehiculo}">selected</c:if>>
                                                    ${v.codigoVehiculo}
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <input type="hidden" name="txtCodigoVehiculo" value="${servicio.getCodigoVehiculo()}">
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
                                        <input type="submit" name="accion" value="Actualizar" class="btn-form-minimal btn-update-minimal">
                                        <a class="btn-action-minimal btn-delete-minimal" href="Controlador?menu=Servicios&accion=Cancelar">Cancelar</a>
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
                                                <a class="btn-action-minimal btn-edit-minimal" href="Controlador?menu=Servicios&accion=Editar&codigoServicio=${servicio.getCodigoServicio()}">Editar</a>    
                                                <a class="btn-action-minimal btn-delete-minimal" href="Controlador?menu=Servicios&accion=Eliminar&codigoServicio=${servicio.getCodigoServicio()}" onclick="confirmarEliminar(event, this);">Eliminar</a>
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