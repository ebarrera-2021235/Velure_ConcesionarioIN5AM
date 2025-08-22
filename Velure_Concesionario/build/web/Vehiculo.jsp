<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Vehículos</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>
    <!-- Google Fonts Montserrat -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
        .descripcion-velure, .titulo-vehiculos {
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
        .titulo-vehiculos {
            font-size: 2.8rem;
            font-weight: 700;
            margin-top: 18px;
            margin-bottom: 38px;
            letter-spacing: 2px;
        }
        .descripcion-vehiculos {
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
            max-width: 1400px;
            margin: 70px auto 40px auto;
            padding: 40px 30px;
        }
        .crud-container {
            display: flex;
            flex-direction: row;
            gap: 30px;
        }
        .tabla-vehiculos {
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
        .btn-cancel-minimal {
            background: #fff;
            color: #dc3545;
            border-color: #dc3545;
        }
        .btn-cancel-minimal:hover {
            background: #dc3545;
            color: white;
            text-decoration: none;
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
            .titulo-vehiculos {
                font-size: 2rem;
            }
            .descripcion-vehiculos {
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
        <div class="titulo-vehiculos">
            VEHÍCULOS
        </div>
    </div>
    <div class="descripcion-vehiculos">
        <div class="titulo-equipo">
            Nuestra Colección, Nuestro Orgullo
        </div>
        <p>
            Explora nuestra amplia variedad de vehículos. Cada unidad está seleccionada cuidadosamente para ofrecer la mejor experiencia en rendimiento y lujo.
        </p>
        <p>
            Desde autos deportivos hasta SUVs, nuestra flota combina potencia, estilo y tecnología de vanguardia para satisfacer a los conductores más exigentes.
        </p>
        <p>
            En Velure no solo vendemos vehículos, también creamos experiencias inolvidables. Cada auto en nuestro inventario pasa por rigurosos estándares de calidad para garantizar la máxima satisfacción y confianza de nuestros clientes.
        </p>
        <p>
            Porque en Velure no solo construimos relaciones, también construimos sueños sobre ruedas, y cada uno de nuestros vehículos es pieza clave para que estos se hagan realidad.
        </p>
    </div>
    
    <!-- Mensaje de error si existe -->
    <c:if test="${not empty mensaje}">
        <div class="alert alert-danger text-center" style="max-width: 1400px; margin: 20px auto;">${mensaje}</div>
    </c:if>
    
    <!-- Ancla invisible para el área CRUD -->
    <div class="zona-crud" id="zona-crud">
        <div class="crud-container">
            <div style="flex:1.2;">
                <div class="card-form">
                    <div class="card-body">
                        <form action="Controlador?menu=Vehiculo" method="POST">
                            <div class="form-group">
                                <label><strong>Modelo:</strong></label>
                                <input type="text" value="${vehiculo.getModelo()}" name="txtModelo" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label><strong>Descripción:</strong></label>
                                <input type="text" value="${vehiculo.getDescripcion()}" name="txtDescripcion" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label><strong>Marca:</strong></label>
                                <input type="text" value="${vehiculo.getMarca()}" name="txtMarca" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label><strong>Color:</strong></label>
                                <input type="text" value="${vehiculo.getColor()}" name="txtColor" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label><strong>Stock:</strong></label>
                                <input type="number" value="${vehiculo.getStock()}" name="txtStock" class="form-control" required min="0">
                            </div>
                            <div class="form-group">
                                <label><strong>Precio:</strong></label>
                                <input type="number" value="${vehiculo.getPrecio()}" step="0.01" name="txtPrecio" class="form-control" required min="0">
                            </div>
                            <div class="form-group">
                                <label><strong>Año:</strong></label>
                                <input type="text" value="${vehiculo.getAnio()}" name="txtAnio" class="form-control">
                            </div>
                            <div class="form-group">
                                <label><strong>Proveedor:</strong></label>
                                <select name="txtCodigoProveedor" class="form-control" required
                                        <c:if test="${modo eq 'editar'}">disabled</c:if>>
                                    <option value="" disabled <c:if test="${vehiculo == null || vehiculo.codigoProveedor == 0}">selected</c:if>>
                                        Seleccione un proveedor
                                    </option>
                                    <c:forEach var="p" items="${proveedores}">
                                        <option value="${p.codigoProveedor}"
                                                <c:if test="${vehiculo != null && vehiculo.codigoProveedor == p.codigoProveedor}">selected</c:if>>
                                            ${p.codigoProveedor} - ${p.nombreProveedor}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            
                            <div class="d-flex justify-content-between">
                                <c:choose>
                                    <c:when test="${modo eq 'editar'}">
                                        <input type="submit" name="accion" value="Actualizar" class="btn-form-minimal btn-update-minimal">
                                        <a class="btn-form-minimal btn-cancel-minimal" href="Controlador?menu=Vehiculo&accion=Cancelar">Cancelar</a>
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
            <div style="flex:1.8;">
                <div class="tabla-vehiculos">
                    <div class="table-responsive">
                        <table class="table table-cards">
                            <thead class="thead-cards">
                                <tr>
                                    <th>CÓDIGO</th>
                                    <th>MODELO</th>
                                    <th>DESCRIPCIÓN</th>
                                    <th>MARCA</th>
                                    <th>COLOR</th>
                                    <th>STOCK</th>
                                    <th>PRECIO</th>
                                    <th>AÑO</th>
                                    <th>COD.PROVEEDOR</th>
                                    <th>ACCIONES</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="v" items="${vehiculos}">
                                    <tr>
                                        <td>${v.getCodigoVehiculo()}</td>
                                        <td>${v.getModelo()}</td>
                                        <td>${v.getDescripcion()}</td>
                                        <td>${v.getMarca()}</td>
                                        <td>${v.getColor()}</td>
                                        <td>${v.getStock()}</td>
                                        <td>${v.getPrecio()}</td>
                                        <td>${v.getAnio()}</td>
                                        <td>${v.getCodigoProveedor()}</td>
                                        <td>
                                            <div class="acciones-btns">
                                                <a class="btn-action-minimal btn-edit-minimal" href="Controlador?menu=Vehiculo&accion=Editar&codigoVehiculo=${v.getCodigoVehiculo()}">Editar</a>
                                                <a class="btn-action-minimal btn-delete-minimal" href="Controlador?menu=Vehiculo&accion=Eliminar&codigoVehiculo=${v.getCodigoVehiculo()}" onclick="return confirmarEliminar(this);">Eliminar</a>
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

        // Solo mantener la página arriba al entrar
        window.addEventListener('load', function() {
            window.scrollTo(0, 0);
        });
    </script>
</body>
</html> 