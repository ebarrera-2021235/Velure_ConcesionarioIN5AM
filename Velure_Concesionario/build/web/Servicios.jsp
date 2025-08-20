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

    <!-- Bootstrap CSS: para estilos y diseño responsive -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>
    <!-- Google Fonts Montserrat: fuente elegante para títulos y textos -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">

    <!-- SweetAlert2: librería para alertas bonitas y personalizables -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- ESTILOS CSS -->
    <style>
        /* Configuración base del body */
        body {
            font-family: 'Montserrat', Arial, sans-serif;
            margin: 0;
            min-height: 100vh;
        }

        /* Zona superior con imagen de fondo y overlay oscuro */
        .zona-superior {
            position: relative;
            min-height: 350px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: url('img/Servicios.jpg') no-repeat center center fixed;
            background-size: cover;
        }
        /* Capa oscura encima de la imagen para dar contraste al texto */
        .zona-superior::after {
            content: "";
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: rgba(0, 0, 0, 0.55);
        }

        /* Títulos y descripción en la zona superior */
        .titulo-servicios, .descripcion-velure {
            position: relative;
            z-index: 1; /* Para que esté sobre el overlay */
            text-align: center;
            color: #fff;
            text-shadow: 2px 2px 8px #000; /* Sombra para mejor lectura */
        }
        .titulo-servicios {
            font-size: 2.8rem;
            font-weight: 700;
            margin: 18px 0 38px 0;
        }
        .descripcion-velure {
            padding-top: 40px;
            font-size: 1.2rem;
            font-weight: 400;
        }

        /* Bloque con descripción de los servicios */
        .descripcion-servicios {
            max-width: 900px;
            margin: 70px auto 0 auto; /* centrado horizontal y margen superior */
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
        }

        /* Zona CRUD: formulario y tabla */
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

        /* Formulario dentro de tarjeta */
        .card-form {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            border: none;
        }
        .card-form .card-body {
            padding: 20px;
        }

        /* Botones de formulario */
        .btn-form {
            padding: 8px 16px;
            font-size: 0.9rem;
            border-radius: 4px;
            font-weight: 400;
            border: 2px solid;
            display: inline-flex;
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

        /* Tabla de servicios */
        .table-responsive {
            overflow-x: auto; /* Permite scroll horizontal en pantallas pequeñas */
        }
        .table-cards {
            border: none;
            background: transparent;
        }
        .table-cards .thead-cards th {
            background: #000;
            color: white;
            padding: 16px 12px;
            font-weight: 600;
            text-align: center;
            border: none;
        }
        .table-cards tbody tr {
            background: white;
            margin-bottom: 8px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
        }
        .table-cards tbody td {
            border: none;
            padding: 15px 12px;
            vertical-align: middle;
            text-align: center;
        }

        /* Botones de acción en la tabla */
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

        /* Modal cuerpo centrado */
        .modal-body {
            text-align: center;
        }

        /* Adaptación responsive para pantallas pequeñas */
        @media (max-width: 991px) {
            .crud-container {
                flex-direction: column;
                gap: 20px;
            }
        }
    </style>
</head>
<body>

<!-- Zona superior con imagen y título -->
<div class="zona-superior">
    <div class="descripcion-velure">
        Velure es <span style="color:#FFD700;">Velocidad</span> y <span style="color:#FFD700;">Lujosidad</span><br>
        <span style="font-size:1.2rem; font-weight:400;">El mejor lugar para encontrar tu auto deportivo soñado.</span>
    </div>
    <div class="titulo-servicios">
        SERVICIOS
    </div>
</div>

<!-- Descripción de los servicios -->
<div class="descripcion-servicios">
    <div class="titulo-equipo">Servicios, excelencia y control</div>
    <p>
        Nuestra plataforma de servicios está diseñada para gestionar de manera integral todas las operaciones relacionadas con los vehículos de nuestra empresa. Desde el registro y seguimiento de mantenimientos, hasta la planificación de servicios especializados, ofrecemos una solución eficiente que garantiza la calidad, la trazabilidad y la optimización de los recursos. Nuestro sistema facilita la gestión diaria, mejora la experiencia de los clientes y asegura que cada vehículo reciba la atención adecuada en el momento preciso, fortaleciendo la confianza y la excelencia operativa de nuestra compañía.
    </p>
</div>

<!-- Zona CRUD -->
<div class="zona-crud">
    <div class="crud-container">

        <!-- FORMULARIO -->
        <div class="card card-form col-md-4">
            <div class="card-body">
                <!-- Formulario para agregar o actualizar servicios -->
                <form action="Controlador?menu=Servicios" method="POST" onsubmit="return validarFormulario();">
                    <!-- Campo oculto para el código del servicio (solo para editar) -->
                    <input type="hidden" name="txtCodigoServicio" value="${servicio != null ? servicio.codigoServicio : ''}">

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

                    <!-- Código del vehículo: bloqueado si estamos editando -->
                    <div class="form-group">
                        <label>Código Vehículo:</label>
                        <input type="number" name="txtCodigoVehiculo" class="form-control"
                               value="${servicio != null ? servicio.codigoVehiculo : ''}"
                               ${servicio != null ? 'readonly' : ''}>
                    </div>

                    <!-- Botones: Agregar se deshabilita si estamos editando -->
                    <input type="submit" name="accion" value="Agregar" class="btn btn-form btn-agregar"
                           <!-- Con esto desabilitamos el boton de agregar cuando presionemos editar-->
                           ${servicio != null ? 'disabled' : ''}
                    <input type="submit" name="accion" value="Actualizar" class="btn btn-form btn-actualizar">
                </form>
            </div>
        </div>

        <!-- TABLA DE SERVICIOS -->
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
                    <!-- Recorrer lista de servicios -->
                    <c:forEach var="s" items="${servicios}">
                        <tr>
                            <td>${s.codigoServicio}</td>
                            <td>${s.nombreServicio}</td>
                            <td>${s.descripcion}</td>
                            <td>${s.tipo}</td>
                            <td>${s.fechaServicio}</td>
                            <td>${s.codigoVehiculo}</td>
                            <td class="acciones-btns">
                                <!-- Botón Editar -->
                                <a href="Controlador?menu=Servicios&accion=Editar&codigoServicio=${s.codigoServicio}" class="btn-editar">Editar</a>
                                <!-- Botón Eliminar con alerta de confirmación -->
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
// Confirmación de eliminación 
function confirmarEliminar(link) {
    // Evita acción por defecto del link
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
            // Redirige a eliminar
            window.location.href = link.href; 
        }
    });
    return false;
}

// Validación antes de enviar el formulario: campos vacíos
function validarFormulario() {
    var nombre = document.getElementsByName('txtNombreServicio')[0].value.trim();
    var descripcion = document.getElementsByName('txtDescripcion')[0].value.trim();
    var tipo = document.getElementsByName('txtTipo')[0].value.trim();
    var fecha = document.getElementsByName('txtFechaServicio')[0].value.trim();
    var codigoVehiculo = document.getElementsByName('txtCodigoVehiculo')[0].value.trim();

    if(nombre === "" || descripcion === "" || tipo === "" || fecha === "" || codigoVehiculo === "") {
        Swal.fire({
            icon: 'error',
            title: 'Campos vacíos',
            text: 'Por favor completa todos los campos antes de agregar.'
        });
        // Detiene el envío del formulario
        return false; 
    }
    // Permite enviar formulario si todo está completo
    return true; 
}
</script>

</body>
</html>
