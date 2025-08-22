<%-- 
    Document   : DetalleCompra
    Created on : 20/08/2025, 18:45:31
    Author     : Edwin Muxtay
--%>

<%--
    Document   : DetalleCompra
    Created on : 18/08/2025, 22:28:23
    Author     : Pc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Detalles De Compras</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>
    <!-- Google Fonts Montserrat -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap" rel="stylesheet">
    <style>
        /* Mantengo los mismos estilos */
        body {
            font-family: 'Montserrat', Arial, sans-serif;
            margin: 0;
            min-height: 100vh;
        }
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
        .descripcion-velure, .titulo-detalleCompra {
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
        .titulo-detalleCompra {
            font-size: 2.8rem;
            font-weight: 700;
            margin-top: 18px;
            margin-bottom: 38px;
            letter-spacing: 2px;
        }
        .descripcion-detalleCompra {
            max-width: 900px;
            margin: 70px auto 0 auto;
            padding: 40px 30px 30px 30px;
            background: #fff;
            border-radius: 24px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.10);
            color: #222;
        }
        .titulo-UnaMeta {
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
        .tabla-detalleCompra {
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
            .titulo-detalleCompra {
                font-size: 2rem;
            }
            .descripcion-detalleCompra {
                padding: 20px 5px 15px 5px;
            }
            .titulo-UnaMeta {
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
        <div class="titulo-detalleCompra">
            DETALLES DE COMPRAS
        </div>
    </div>
    
    <div class="descripcion-detalleCompra">
        <div class="titulo-UnaMeta">
            Una Meta, Varias Ventas
        </div>
        <p>
            En el corazón de nuestra estrategia, cada Detalle de Compra es una pieza fundamental. No son simplemente líneas en una factura, sino la manifestación tangible de la confianza que nuestros clientes depositan en nosotros y la prueba del meticuloso trabajo de nuestro equipo. Cada artículo, cada cantidad y cada especificación registrada es un testimonio de la dedicación que ponemos en cada transacción, asegurando un crecimiento que es tan preciso como sostenible.
        </p>
        <p>
            Cada compra es más que un simple intercambio; es una oportunidad para fortalecer nuestras relaciones comerciales. No solo estamos procesando un pedido, sino que estamos construyendo una historia de éxito compartida. Estamos resolviendo necesidades, superando expectativas y demostrando que el valor de nuestra marca reside en la exactitud y la fiabilidad de cada producto y servicio que entregamos. Cada registro en un detalle de compra es un "sí" a la calidad y al profesionalismo que nos define.       
        </p>
        <p>
            El éxito de nuestra empresa no es un evento fortuito, sino el resultado de un proceso continuo de excelencia operativa. Es la suma de la disciplina, la atención y la consistencia en cada paso del ciclo de venta. No se trata de un solo pedido grande o de una victoria aislada, sino de la acumulación de cada detalle bien gestionado, de cada problema evitado y de cada cliente satisfecho. Somos un equipo que no se conforma con lo estándar, sino que busca constantemente la perfección en cada transacción.
        </p>
        <p>
            Cada venta no es un fin en sí mismo, sino una semilla que plantamos para cosechar el futuro más próspero.
        </p>
    </div>

    <!-- CRUD -->
    <div class="zona-crud" id="zona-crud">
        <div class="crud-container">
            <div style="flex:1;">
                <div class="card">
                    <div class="card-body">
                        <form action="Controlador?menu=DetalleCompra" method="POST">
                            <div class="form-group">
                                <label><strong>Precio Unitario:</strong></label>
                                <input type="text" value="${detalleCompra.getPrecioUnitario()}" name="txtPrecioUnitario" class="form-control">
                            </div>
                            <div class="form-group">
                                <label><strong>Cantidad:</strong></label>
                                <input type="text" value="${detalleCompra.getCantidad()}" name="txtCantidad" class="form-control">
                            </div>
                            <div class="form-group">
                                    <label><strong>Código Vehículo:</strong></label>
                                    <c:choose>
                                        <c:when test="${modo eq 'editar'}">
                        
                                            <input type="number" value="${detalleCompra.getCodigoVehiculo()}" class="form-control" disabled>
         
                                            <input type="hidden" name="txtCodigoVehiculo" value="${detalleCompra.getCodigoVehiculo()}">
                                        </c:when>
                                        <c:otherwise>
                                            <input type="number" value="<c:out value='${detalleCompra.getCodigoVehiculo()}' default='0'/>" name="txtCodigoVehiculo" class="form-control" placeholder="0">
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <div class="form-group">
                                    <label><strong>Código Compra:</strong></label>
                                    <c:choose>
                                        <c:when test="${modo eq 'editar'}">
                                            <input type="number" value="${detalleCompra.getCodigoCompra()}" class="form-control" disabled>
                                            <input type="hidden" name="txtCodigoCompra" value="${detalleCompra.getCodigoCompra()}">
                                        </c:when>
                                        <c:otherwise>
                                            <input type="number" value="<c:out value='${detalleCompra.getCodigoCompra()}' default='0'/>" name="txtCodigoCompra" class="form-control" placeholder="0">
                                        </c:otherwise>
                                    </c:choose>
                                </div>


                                <div class="d-flex justify-content-between">

                                    <c:choose>
                                        <c:when test="${modo eq 'editar'}" >
                                            <input type="submit" name="accion" value="Actualizar" class="btn-form-minimal btn-update-minimal">
                                            <a class="btn-action-minimal btn-delete-minimal" href="Controlador?menu=DetalleCompra&accion=Cancelar">Cancelar</a>
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
                                    <th>Precio Unitario</th>
                                    <th>Cantidad</th>
                                    <th>Código Vehículo</th>
                                    <th>Código Compra</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="detalleCompra" items="${detalleCompras}">
                                    <tr>
                                        <td>${detalleCompra.getCodigoDetalleCompra()}</td>
                                        <td>${detalleCompra.getPrecioUnitario()}</td>
                                        <td>${detalleCompra.getCantidad()}</td>
                                        <td>${detalleCompra.getCodigoVehiculo()}</td>
                                        <td>${detalleCompra.getCodigoCompra()}</td>
                                        <td>
                                            <div class="acciones-btns">
                                                <a class="btn-action-minimal btn-edit-minimal" href="Controlador?menu=DetalleCompra&accion=Editar&codigoDetalleCompra=${detalleCompra.getCodigoDetalleCompra()}">Editar</a>    
                                                <a class="btn-action-minimal btn-delete-minimal" href="Controlador?menu=DetalleCompra&accion=Eliminar&codigoDetalleCompra=${detalleCompra.getCodigoDetalleCompra()}" onclick="confirmarEliminar(event, this);">Eliminar</a>
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
        // mantener arriba al cargar
        window.addEventListener('load', function () {
            window.scrollTo(0, 0);
        });

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
    </script>
    <script>
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

