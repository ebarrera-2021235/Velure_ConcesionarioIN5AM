    <%-- Document : Proveedor
    Created on : 
    13/08/2025, 22:41:42 
    Author : Luis Castro --%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Proveedores</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">
    <link href="styles/styleSheet.css" rel="stylesheet">
</head>
<body>
      <div class="zona-superior">
        <div class="descripcion-velure">
            Velure es <span style="color:#FFD700;">Velocidad</span> y <span style="color:#FFD700;">Lujosidad</span><br>
            <span style="font-size:1.2rem; font-weight:400;">El mejor lugar para encontrar tu auto deportivo soñado.</span>
        </div>
        <div class="titulo-principal">PROVEEDORES</div> 
    </div>
    
    <div class="descripcion-proveedor">
        <div class="titulo-descripcion-proveedor">Nuestros Proveedores, Nuestra Garantía</div>
        <p>En Velure Motors, entendemos que cada vehículo que entregamos es el resultado de una cadena de suministros meticulosamente seleccionada. Nuestros proveedores son el corazón de nuestro concesionario, proporcionando los mejores autos y repuestos de la industria.</p>
        <p>Trabajamos con los fabricantes más prestigiosos y con talleres especializados que nos permiten ofrecer vehículos de alta calidad, tecnología avanzada y la mejor experiencia para nuestros clientes.</p>
        <p>La confianza y compromiso de nuestros proveedores nos permite mantener una flota de vehículos en excelente estado, garantizando seguridad, durabilidad y un servicio postventa que se extiende más allá de la compra.</p>
        <p>En Velure Motors, sabemos que un buen vehículo empieza con un buen proveedor. Por eso, seleccionamos con cuidado a cada uno de nuestros socios estratégicos, quienes comparten nuestra visión de calidad y excelencia.</p>
    </div>

    <div class="zona-crud" id="zona-crud">
        <div class="crud-container">
            <div style="flex:1;">
                <div class="card-form">
                    <div class="card-body">
                        <form action="Controlador?menu=Proveedor" method="POST">
                            <div class="form-group">
                                <label><strong>Nombre:</strong></label>
                                <input type="text" value="${proveedor.nombreProveedor}" name="txtNombreProveedor" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label><strong>Teléfono:</strong></label>
                                <input type="tel" value="${proveedor.telefonoProveedor}" name="txtTelefonoProveedor" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label><strong>Dirección:</strong></label>
                                <input type="text" value="${proveedor.direccionProveedor}" name="txtDireccionProveedor" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label><strong>Correo:</strong></label>
                                <input type="email" value="${proveedor.correoProveedor}" name="txtCorreoProveedor" class="form-control" required>
                            </div>
                            <div class="d-flex justify-content-between">
                                <c:choose>
                                    <c:when test="${modo eq 'editar'}">
                                        <input type="submit" name="accion" value="Actualizar" class="btn-form-minimal btn-update-minimal">
                                        <a class="btn-action-minimal btn-delete-minimal" href="Controlador?menu=Proveedor&accion=Cancelar">Cancelar</a>
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
                <div class="tabla-proveedor">
                    <div class="table-responsive">
                        <table class="table table-cards">
                            <thead class="thead-cards">
                                <tr>
                                    <th>CÓDIGO</th>
                                    <th>NOMBRE</th>
                                    <th>TELÉFONO</th>
                                    <th>DIRECCIÓN</th>
                                    <th>CORREO</th>
                                    <th>ACCIONES</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="proveedor" items="${proveedores}">
                                    <tr>
                                        <td>${proveedor.codigoProveedor}</td>
                                        <td>${proveedor.nombreProveedor}</td>
                                        <td>${proveedor.telefonoProveedor}</td>
                                        <td>${proveedor.direccionProveedor}</td>
                                        <td>${proveedor.correoProveedor}</td>
                                        <td>
                                            <div class="acciones-btns">
                                                <a class="btn-action-minimal btn-edit-minimal" href="Controlador?menu=Proveedor&accion=Editar&codigoProveedor=${proveedor.codigoProveedor}">Editar</a>
                                                <a class="btn-action-minimal btn-delete-minimal" href="Controlador?menu=Proveedor&accion=Eliminar&codigoProveedor=${proveedor.codigoProveedor}" onclick="return confirmarEliminar(this);">Eliminar</a>
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

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
    </script>
    <script>
            // Este bloque de código verifica si existe un mensaje de error
            // en los atributos de la solicitud y lo muestra con SweetAlert2.
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