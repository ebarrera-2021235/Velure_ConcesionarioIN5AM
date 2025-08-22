<%-- 
    Document   : Principal
    Created on : 15/07/2025, 10:37:41
    Author     : informatica
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Servicios</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>
    <!-- Google Fonts Montserrat -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">

    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        /* Estilos generales de la página */
        body {
            font-family: 'Montserrat', Arial, sans-serif;
            margin: 0;
            min-height: 100vh;
        }

        /* Zona superior de la página con imagen de fondo */
        .zona-superior {
            position: relative;
            min-height: 350px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: url('img/em.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        /* Overlay oscuro para que el texto sea legible sobre la imagen */
        .zona-superior::after {
            content: "";
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: rgba(0, 0, 0, 0.55);
            z-index: 0;
        }

        /* Estilos para títulos y descripción en la zona superior */
        .titulo-servicios, .descripcion-velure {
            position: relative;
            z-index: 1;
            text-align: center;
            color: #fff;
            text-shadow: 2px 2px 8px #000;
        }
        .titulo-servicios {
            font-size: 2.8rem;
            font-weight: 700;
            margin: 18px 0 38px 0;
            letter-spacing: 2px;
        }
        .descripcion-velure {
            padding-top: 40px;
            font-size: 2rem;
            font-weight: 700;
            max-width: 90%;
        }

        /* Sección con descripción de servicios */
        .descripcion-servicios {
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

        /* Zona CRUD para el formulario y la tabla */
        .zona-crud {
            background: #fff;
            border-radius: 24px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.18);
            max-width: 1200px;
            margin: 40px auto 40px auto;
            padding: 40px 30px;
        }
        .crud-container {
            display: flex;
            flex-direction: row;
            gap: 30px;
        }

        /* Estilo de la tarjeta del formulario */
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

        /* Botones del formulario */
        .btn-form {
            padding: 8px 16px;
            font-size: 0.9rem;
            border-radius: 4px;
            font-weight: 400;
            transition: background-color 0.2s ease;
            border: 2px solid;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 4px;
            cursor: pointer;
            background-color: #fff;
            color: inherit;
            margin-right: 10px;
        }
        .btn-agregar {
            border-color: #007bff;
            color: #007bff;
        }
        .btn-agregar:hover {
            background-color: #007bff;
            color: #fff;
        }
        .btn-actualizar {
            border-color: #28a745;
            color: #28a745;
        }
        .btn-actualizar:hover {
            background-color: #28a745;
            color: #fff;
        }

        /* Estilos de la tabla */
        .table-responsive {
            overflow-x: auto;
        }
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

        /* Botones de acciones dentro de la tabla */
        .acciones-btns {
            display: flex;
            gap: 8px;
            justify-content: center;
        }
        .btn-editar {
            background: #fff;
            color: #007bff;
            border: 1px solid #007bff;
            padding: 5px 10px;
            border-radius: 4px;
            text-decoration: none;
        }
        .btn-editar:hover {
            background: #007bff;
            color: #fff;
        }
        .btn-eliminar {
            background: #fff;
            color: #dc3545;
            border: 1px solid #dc3545;
            padding: 5px 10px;
            border-radius: 4px;
            text-decoration: none;
        }
        .btn-eliminar:hover {
            background: #dc3545;
            color: #fff;
        }

        .modal-body {
            text-align: center;
        }

        /* Ajuste de la vista para móviles */
        @media (max-width: 991px) {
            .crud-container {
                flex-direction: column;
                gap: 20px;
            }
        }
    </style>
</head>
<body>

<!-- Zona superior con título y descripción -->
<div class="zona-superior">
    <div class="descripcion-velure">
        Velure es <span style="color:#FFD700;">Velocidad</span> y <span style="color:#FFD700;">Lujosidad</span><br>
        <span style="font-size:1.2rem; font-weight:400;">El mejor lugar para encontrar tu auto deportivo soñado.</span>
    </div>
    <div class="titulo-servicios">
        SERVICIOS
    </div>
</div>

<!-- Sección con la descripción larga de servicios -->
<div class="descripcion-servicios">
    <div class="titulo-equipo">Servicios, excelencia y control</div>
    <p>
        Nuestra plataforma de servicios permite gestionar de manera integral todas las operaciones...
        <!-- Explicación: Esto es un texto informativo que describe la funcionalidad de la aplicación -->
    </p>
</div>

<!-- Zona CRUD -->
<div class="zona-crud">
    <div class="crud-container">

        <!-- FORMULARIO PARA AGREGAR/ACTUALIZAR SERVICIOS -->
        <div class="card card-form col-md-4">
            <div class="card-body">
                <form action="Controlador?menu=Servicios" method="POST" id="formServicio">
                    <!-- Campo oculto para almacenar el id del servicio (necesario para actualizar) -->
                    <input type="hidden" name="codigoServicio" value="${servicio != null ? servicio.codigoServicio : ''}">

                    <!-- Campos del formulario -->
                    <div class="form-group">
                        <label>Nombre del Servicio:</label>
                        <input type="text" name="txtNombreServicio" class="form-control"
                               value="${servicio != null ? servicio.nombreServicio : ''}">
                    </div>
                    <div class="form-group">
                        <label>Descripción:</label>
                        <input type="text" name="txtDescripcion" class="form-control"
                               value="${servicio != null ? servicio.descripcion : ''}">
                    </div>
                    <div class="form-group">
                        <label>Tipo:</label>
                        <input type="text" name="txtTipo" class="form-control"
                               value="${servicio != null ? servicio.tipo : ''}">
                    </div>
                    <div class="form-group">
                        <label>Fecha:</label>
                        <input type="date" name="txtFechaServicio" class="form-control"
                               value="${servicio != null ? servicio.fechaServicio : ''}">
                    </div>
                    <div class="form-group">
                        <label>Código Vehículo:</label>
                        <input type="number" name="txtCodigoVehiculo" class="form-control"
                               value="${servicio != null ? servicio.codigoVehiculo : ''}"
                               ${servicio != null ? 'readonly' : ''}>
                    </div>

                    <!-- Botones de acción -->
                    <!-- Botones de acción -->
                    <input type="submit" name="accion" value="Agregar" 
                           class="btn btn-form btn-agregar" id="btnAgregar" onclick="return validarCampos();">

                    <input type="submit" name="accion" value="Actualizar" 
                           class="btn btn-form btn-actualizar" id="btnActualizar" style="display:none;" onclick="return validarCampos();">

                    <!-- Botón cancelar -->
                    <button type="button" class="btn btn-form btn-cancelar" id="btnCancelar" style="display:none;" onclick="cancelarEdicion();">
                        Cancelar
                    </button>

                </form>
            </div>
        </div>


        <!-- TABLA PARA MOSTRAR LOS SERVICIOS -->
        <div class="col-md-8 table-responsive">
            <table class="table table-cards">
                <thead class="thead-cards">
                    <tr>
                        <th>CODIGO</th>
                        <th>NOMBRE</th>
                        <th>DESCRIPCION</th>
                        <th>TIPO</th>
                        <th>FECHA</th>
                        <th>COD VEHICULO</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Recorre la lista de servicios enviada desde el controlador -->
                    <c:forEach var="s" items="${servicios}">
                        <tr>
                            <td>${s.codigoServicio}</td>
                            <td>${s.nombreServicio}</td>
                            <td>${s.descripcion}</td>
                            <td>${s.tipo}</td>
                            <td>${s.fechaServicio}</td>
                            <td>${s.codigoVehiculo}</td>
                            <td class="acciones-btns">
                                <!-- Botón para editar -->
                                <a href="Controlador?menu=Servicios&accion=Editar&codigoServicio=${s.codigoServicio}" class="btn-editar">Editar</a>
                                <!-- Botón para eliminar con alerta personalizada -->
                                <a href="Controlador?menu=Servicios&accion=Eliminar&codigoServicio=${s.codigoServicio}" class="btn-eliminar" onclick="return confirmarEliminar(this);">Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </div>
</div>
<script>
    // Cuando el controlador envía un servicio (al hacer clic en Editar), ocultamos Agregar y mostramos Actualizar + Cancelar
    window.onload = function () {
        let servicioEnEdicion = "${servicio != null ? servicio.codigoServicio : ''}";
        if (servicioEnEdicion !== "") {
            document.getElementById("btnAgregar").style.display = "none";
            document.getElementById("btnActualizar").style.display = "inline-block";
            document.getElementById("btnCancelar").style.display = "inline-block";
        }
    };

    // Función para cancelar edición
    function cancelarEdicion() {
    // Limpia el formulario
    document.getElementById("formServicio").reset();

    // Limpia manualmente todos los campos (porque JSP los rellena al renderizar)
    document.querySelector("input[name='codigoServicio']").value = "";
    document.querySelector("input[name='txtNombreServicio']").value = "";
    document.querySelector("input[name='txtDescripcion']").value = "";
    document.querySelector("input[name='txtTipo']").value = "";
    document.querySelector("input[name='txtFechaServicio']").value = "";
    document.querySelector("input[name='txtCodigoVehiculo']").value = "";

    // Mostrar/ocultar botones
    document.getElementById("btnAgregar").style.display = "inline-block";
    document.getElementById("btnActualizar").style.display = "none";
    document.getElementById("btnCancelar").style.display = "none";
}

</script>

<!-- Scripts de interacción -->
<script>
    // Función para mostrar alerta de confirmación antes de eliminar
    function confirmarEliminar(link) {
        event.preventDefault(); // Evita que el enlace navegue inmediatamente
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
                window.location.href = link.href; // Si confirma, se redirige al controlador para eliminar
            }
        });
        return false;
    }

    // Función para validar que ningún campo del formulario esté vacío
    function validarCampos() {
        //declaracions JS
        var nombre = document.getElementsByName('txtNombreServicio')[0].value.trim();
        var descripcion = document.getElementsByName('txtDescripcion')[0].value.trim();
        var tipo = document.getElementsByName('txtTipo')[0].value.trim();
        var fecha = document.getElementsByName('txtFechaServicio')[0].value.trim();
        var codigoVehiculo = document.getElementsByName('txtCodigoVehiculo')[0].value.trim();

        if (!nombre || !descripcion || !tipo || !fecha || !codigoVehiculo) {
            Swal.fire({
                title: '¡Campos incompletos!',
                text: 'Todos los campos son obligatorios.',
                icon: 'warning',
                confirmButtonColor: '#3085d6',
                confirmButtonText: 'Aceptar'
            });
            return false; // Cancela el envío del formulario
        }
        return true; // Todos los campos completados, se puede enviar
    }
</script>

</body>
</html>
