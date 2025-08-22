<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Seguros</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>
    <!-- Google Fonts Montserrat -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Montserrat', Arial, sans-serif;
            margin: 0;
            min-height: 100vh;
        }
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
        .descripcion-velure, .titulo-seguros {
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
        .titulo-seguros {
            font-size: 2.8rem;
            font-weight: 700;
            margin-top: 18px;
            margin-bottom: 38px;
            letter-spacing: 2px;
        }
        .descripcion-seguros {
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
        .tabla-seguros {
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

        /* Botones del formulario con el mismo estilo */
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

        /* Botones minimalistas */
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

        /* Animación suave para el scroll */
        html {
            scroll-behavior: smooth;
        }

        @media (max-width: 991px) {
            .zona-crud {
                padding: 20px 5px;
            }
            .crud-container {
                flex-direction: column;
                gap: 20px;
            }
            .titulo-seguros {
                font-size: 2rem;
            }
            .descripcion-seguros{
                padding: 20px 5px 15px 5px;
            }
            .titulo-equipo {
                font-size: 1.5rem;
            }
            .table-responsive {
                font-size: 0.85rem;
            }
            .btn-action-minimal {
                padding: 4px 8px;
                font-size: 0.75rem;
            }
            .btn-form-minimal {
                padding: 6px 12px;
                font-size: 0.8rem;
            }
        }
    </style>
</head>
<body>
    <div class="zona-superior">
        <div class="descripcion-velure">
            Velure es <span style="color:#FFD700;">Velocidad</span> y <span style="color:#FFD700;">Lujosidad</span><br>
            <span style="font-size:1.2rem; font-weight:400;">El mejor lugar para encontrar tu auto deportivo soñado.</span>
        </div>
        <div class="titulo-seguros">SEGUROS</div>
    </div>
    
    <div class="descripcion-seguros">
        <div class="titulo-equipo">Nuestros Seguros, Tu Tranquilidad</div>
        <p>En Velure, sabemos que proteger tu vehículo es tan importante como disfrutarlo. Por eso ofrecemos seguros confiables, adaptados a tus necesidades, con coberturas completas desde Básica hasta Riesgo sin franquicia.</p>
        <p>Nuestros seguros están diseñados para brindarte tranquilidad y confianza, respaldando tu inversión y cuidando lo que más valoras. Cada póliza se gestiona con transparencia y claridad, para que entiendas exactamente los beneficios de tu cobertura.</p>
        <p>Contamos con un equipo de expertos que evalúa cada caso de manera personalizada, asegurando soluciones rápidas y efectivas ante cualquier eventualidad. Nuestro soporte y atención están disponibles cuando los necesitas.</p>
        <p>Porque en Velure no solo ofrecemos seguros, también construimos seguridad, confianza y tranquilidad para cada cliente que confía en nosotros, protegiendo tu vehículo y tu bienestar en todo momento.</p>
        <p>Además, ponemos a tu disposición herramientas digitales fáciles de usar. Queremos que tu experiencia con Velure sea siempre sencilla, segura y confiable, acompañándote en cada paso para cuidar lo que más valoras.</p>
    </div>

    <div class="zona-crud" id="zona-crud">
        <div class="crud-container">
            <div style="flex:1;">
                <div class="card">
                    <div class="card-body">
                        <form action="Controlador?menu=Seguro" method="POST">
                            <div class="form-group">
                                <label><strong>Tipo de Cobertura:</strong></label>
                                <select name="txtTipoCobertura" class="form-control" required>
                                    <option value="" disabled <c:if test="${seguro == null}">selected</c:if>>Seleccione tipo de cobertura</option>
                                    <option value="Básica" <c:if test="${seguro != null && seguro.tipoCobertura == 'Básica'}">selected</c:if>>Básica</option>
                                    <option value="Limitada" <c:if test="${seguro != null && seguro.tipoCobertura == 'Limitada'}">selected</c:if>>Limitada</option>
                                    <option value="Amplia" <c:if test="${seguro != null && seguro.tipoCobertura == 'Amplia'}">selected</c:if>>Amplia</option>
                                    <option value="Riesgo y franquicia" <c:if test="${seguro != null && seguro.tipoCobertura == 'Riesgo y franquicia'}">selected</c:if>>Riesgo y franquicia</option>
                                    <option value="Riesgo sin franquicia" <c:if test="${seguro != null && seguro.tipoCobertura == 'Riesgo sin franquicia'}">selected</c:if>>Riesgo sin franquicia</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label><strong>Descripción:</strong></label>
                                <input type="text" value="${seguro.descripcion}" name="txtDescripcion" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label><strong>Fecha Inicio:</strong></label>
                                <input type="date" value="${seguro.fechaInicio}" name="txtFechaInicio" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label><strong>Fecha Fin:</strong></label>
                                <input type="date" value="${seguro.fechaFin}" name="txtFechaFin" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label><strong>Costo:</strong></label>
                                <input type="number" step="0.01" value="${seguro.costo}" name="txtCosto" class="form-control" required>
                            </div>
                            
                            <!-- ComboBox Código Vehículo aplicando tu patrón -->
                            <div class="form-group">
                                <label><strong>Código Vehículo:</strong></label>
                                <select name="txtCodigoVehiculo" class="form-control" required
                                        <c:if test="${seguro != null && seguro.codigoVehiculo != 0}">disabled</c:if>>
                                    <option value="" disabled <c:if test="${seguro == null}">selected</c:if>>
                                        Seleccione un vehículo
                                    </option>
                                    <c:forEach var="v" items="${vehiculos}">
                                        <option value="${v.codigoVehiculo}"
                                                <c:if test="${seguro != null && seguro.codigoVehiculo == v.codigoVehiculo}">selected</c:if>>
                                            ${v.codigoVehiculo} - ${v.marca} ${v.modelo}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            
                            <div class="d-flex justify-content-between">
                                <c:choose>
                                    <c:when test="${seguro != null}">
                                        <!-- Campo hidden para enviar el código del seguro al actualizar -->
                                        <input type="hidden" name="codigoSeguro" value="${seguro.codigoSeguro}">
                                        <input type="submit" name="accion" value="Actualizar" class="btn-form-minimal btn-update-minimal">
                                        <a class="btn-action-minimal btn-delete-minimal" href="Controlador?menu=Seguro&accion=Cancelar">Cancelar</a>
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
                <div class="tabla-seguros">
                    <div class="table-responsive">
                        <table class="table table-cards">
                            <thead class="thead-cards">
                                <tr>
                                    <th>CODIGO</th>
                                    <th>TIPO DE COBERTURA</th>
                                    <th>DESCRIPCION</th>
                                    <th>FECHA INICIO</th>
                                    <th>FECHA FIN</th>
                                    <th>COSTO</th>
                                    <th>VEHICULO</th>
                                    <th>ACCIONES</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="seguro" items="${seguros}">
                                    <tr>
                                        <td>${seguro.codigoSeguro}</td>
                                        <td>${seguro.tipoCobertura}</td>
                                        <td>${seguro.descripcion}</td>
                                        <td>${seguro.fechaInicio}</td>
                                        <td>${seguro.fechaFin}</td>
                                        <td>${seguro.costo}</td>
                                        <td>
                                            <c:forEach var="v" items="${vehiculos}">
                                                <c:if test="${seguro.codigoVehiculo == v.codigoVehiculo}">
                                                    ${v.codigoVehiculo} - ${v.marca} ${v.modelo}
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <div class="acciones-btns">
                                                <a class="btn-action-minimal btn-edit-minimal" href="Controlador?menu=Seguro&accion=Editar&codigoSeguro=${seguro.codigoSeguro}">Editar</a>
                                                <a class="btn-action-minimal btn-delete-minimal" href="Controlador?menu=Seguro&accion=Eliminar&codigoSeguro=${seguro.codigoSeguro}" onclick="confirmarEliminar(event, this);">Eliminar</a>
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