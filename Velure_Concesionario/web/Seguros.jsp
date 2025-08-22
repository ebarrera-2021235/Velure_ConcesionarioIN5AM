     <%-- Document : Seguros
    Created on : 
    13/08/2025, 22:41:42 
    Author : Emilio Bolaños --%>

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
    <link href="styles/styleSheet.css" rel="stylesheet">
    
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