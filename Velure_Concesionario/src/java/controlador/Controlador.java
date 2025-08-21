package controlador;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;
import modelo.ClienteDAO;
import modelo.Compra;
import modelo.CompraDAO;
import modelo.DetalleCompra;
import modelo.DetalleCompraDAO;
import modelo.Empleado;
import modelo.EmpleadoDAO;
import modelo.Proveedor;
import modelo.ProveedorDAO;
import modelo.Servicios;
import modelo.ServiciosDAO;

/**
 *
 * @author informatica
 */
public class Controlador extends HttpServlet {

    // Objetos para Empleado
    Empleado empleado = new Empleado();
    EmpleadoDAO empleadoDAO = new EmpleadoDAO();
    int codEmpleado;

    // Objetos para Cliente
    Cliente cliente = new Cliente();
    ClienteDAO clienteDAO = new ClienteDAO();
    int codCliente;

    // Objetos para Servicios
    Servicios servicio = new Servicios();
    ServiciosDAO servicioDAO = new ServiciosDAO();
    int codServicio;
    
    // Objetos para Proveedor
    Proveedor proveedor = new Proveedor();
    ProveedorDAO proveedorDao = new ProveedorDAO();
    int codProveedor;
    
    //Objetos para Compra
    Compra compra = new Compra();
    CompraDAO compraDao = new CompraDAO();
    int codCompra;
    
    DetalleCompra detalleCompra = new DetalleCompra();
    DetalleCompraDAO detalleDaoC = new DetalleCompraDAO();
    int codDetalleCompra;


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        if (menu == null || menu.isEmpty() || accion == null || accion.isEmpty()) {
            request.getRequestDispatcher("Principal.jsp").forward(request, response);
            return;
        }

        // --- PRINCIPAL ---
        if ("Principal".equals(menu)) {
            request.getRequestDispatcher("Principal.jsp").forward(request, response);

        // --- CLIENTES ---
        } else if ("Clientes".equals(menu)) {
            switch (accion) {
                case "Listar":
                    List listaClientes = clienteDAO.listarCliente();
                    request.setAttribute("clientes", listaClientes);
                    break;

                case "Agregar":
                    String nombresCliente = request.getParameter("txtNombresCliente");
                    String dpiCliente = request.getParameter("txtDPICliente");
                    String direccionCliente = request.getParameter("txtDireccionCliente");
                    String estado = request.getParameter("txtEstado");
                    String telefonoCliente = request.getParameter("txtTelefonoCliente");
                    String correoCliente = request.getParameter("txtCorreoCliente");

                    if (nombresCliente == null || nombresCliente.isEmpty()
                            || dpiCliente == null || dpiCliente.isEmpty()
                            || direccionCliente == null || direccionCliente.isEmpty()
                            || estado == null || estado.isEmpty()
                            || telefonoCliente == null || telefonoCliente.isEmpty()
                            || correoCliente == null || correoCliente.isEmpty()) {

                        request.setAttribute("error", "Todos los campos deben estar llenos.");
                        request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                        return;
                    }

                    if (correoCliente == null || correoCliente.isEmpty()
                            || (!correoCliente.endsWith("@gmail.com")
                            && !correoCliente.endsWith("@outlook.com")
                            && !correoCliente.endsWith("@yahoo.com"))) {

                        request.setAttribute("error", "El correo debe terminar con  @gmail.com, @outlook.com o @yahoo.com");
                        request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                        return;
                    }

                    if (telefonoCliente == null || !telefonoCliente.matches("\\d{8}")) {
                        request.setAttribute("error", "El teléfono debe contener exactamente 8 numeros.");
                        request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                        return;
                    }

                    if (estado == null || !estado.matches("\\d{1}")) {
                        request.setAttribute("error", "El campo de Estado debe ser un número");
                        request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                        return;
                    }

                    if (dpiCliente == null || !dpiCliente.matches("\\d{13}")) {
                        request.setAttribute("error", "El DPI debe contener exactamente 13 digitos.");
                        request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                        return;
                    }

                    if (nombresCliente == null || nombresCliente.trim().isEmpty() || !nombresCliente.matches("^[a-zA-Z\\s]+$")) {
                        request.setAttribute("error", "El espacio de Nombres solo puede contener letras y espacios, sin acentos ni caracteres especiales.");
                        request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                        return;
                    }

                    cliente.setNombresCliente(nombresCliente);
                    cliente.setDPICliente(dpiCliente);
                    cliente.setDireccionCliente(direccionCliente);
                    cliente.setEstado(estado);
                    cliente.setTelefonoCliente(telefonoCliente);
                    cliente.setCorreoCliente(correoCliente);

                    clienteDAO.agregarCliente(cliente);
                    response.sendRedirect("Controlador?menu=Clientes&accion=Listar");
                    return;

                case "Editar":
                    codCliente = Integer.parseInt(request.getParameter("codigoCliente"));
                    Cliente cl = clienteDAO.listarCodigoCliente(codCliente);
                    request.setAttribute("cliente", cl);
                    break;

                case "Actualizar":
                    nombresCliente = request.getParameter("txtNombresCliente");
                    dpiCliente = request.getParameter("txtDPICliente");
                    direccionCliente = request.getParameter("txtDireccionCliente");
                    estado = request.getParameter("txtEstado");
                    telefonoCliente = request.getParameter("txtTelefonoCliente");
                    correoCliente = request.getParameter("txtCorreoCliente");

                    if (nombresCliente == null || nombresCliente.isEmpty()
                            || dpiCliente == null || dpiCliente.isEmpty()
                            || direccionCliente == null || direccionCliente.isEmpty()
                            || estado == null || estado.isEmpty()
                            || telefonoCliente == null || telefonoCliente.isEmpty()
                            || correoCliente == null || correoCliente.isEmpty()) {

                        request.setAttribute("error", "Todos los campos deben estar llenos.");
                        request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                        return;
                    }

                    if (correoCliente == null || correoCliente.isEmpty()
                            || (!correoCliente.endsWith("@gmail.com")
                            && !correoCliente.endsWith("@outlook.com")
                            && !correoCliente.endsWith("@yahoo.com"))) {

                        request.setAttribute("error", "El correo debe terminar con  @gmail.com, @outlook.com o @yahoo.com");
                        request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                        return;
                    }

                    if (telefonoCliente == null || !telefonoCliente.matches("\\d{8}")) {
                        request.setAttribute("error", "El teléfono debe contener exactamente 8 numeros.");
                        request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                        return;
                    }

                    if (estado == null || !estado.matches("\\d{1}")) {
                        request.setAttribute("error", "El campo de Estado debe ser un número");
                        request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                        return;
                    }

                    if (dpiCliente == null || !dpiCliente.matches("\\d{13}")) {
                        request.setAttribute("error", "El DPI debe contener exactamente 13 digitos.");
                        request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                        return;
                    }

                    if (nombresCliente == null || nombresCliente.trim().isEmpty() || !nombresCliente.matches("^[a-zA-Z\\s]+$")) {
                        request.setAttribute("error", "El espacio de Nombres solo puede contener letras y espacios, sin acentos ni caracteres especiales.");
                        request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                        return;
                    }

                    cliente.setNombresCliente(request.getParameter("txtNombresCliente"));
                    cliente.setDPICliente(request.getParameter("txtDPICliente"));
                    cliente.setDireccionCliente(request.getParameter("txtDireccionCliente"));
                    cliente.setEstado(request.getParameter("txtEstado"));
                    cliente.setTelefonoCliente(request.getParameter("txtTelefonoCliente"));
                    cliente.setCorreoCliente(request.getParameter("txtCorreoCliente"));
                    cliente.setCodigoCliente(codCliente);
                    clienteDAO.actualizar(cliente);
                    response.sendRedirect("Controlador?menu=Clientes&accion=Listar");
                    return;

                case "Eliminar":
                    codCliente = Integer.parseInt(request.getParameter("codigoCliente"));
                    clienteDAO.eliminar(codCliente);
                    response.sendRedirect("Controlador?menu=Clientes&accion=Listar");
                    return;
            }
            request.getRequestDispatcher("Clientes.jsp").forward(request, response);

        // --- SERVICIOS ---
        } 
        else if (menu.equals("Empleado")) {

    switch(accion){

        case "Listar":

            List listaEmpleados = empleadoDAO.listar();

            request.setAttribute("empleados", listaEmpleados);

            break;

        case "Agregar":

            String DPI = request.getParameter("txtDPIEmpleado");
            String nombres = request.getParameter("txtNombresEmpleado");
            String telefono = request.getParameter("txtTelefonoEmpleado");
            String est = request.getParameter("txtEstadoEmpleado");
            String correo = request.getParameter("txtCorreoEmpleado");

            empleado.setDPIEmpleado(DPI);
            empleado.setNombresEmpleado(nombres);
            empleado.setTelefonoEmpleado(telefono);
            empleado.setEstado(est);
            empleado.setCorreoEmpleado(correo);

            empleadoDAO.agregar(empleado);

            request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);

            break;

        case "Editar":

            codEmpleado = Integer.parseInt(request.getParameter("codigoEmpleado"));

            Empleado e = empleadoDAO.listarCodigoEmpleado(codEmpleado);

            request.setAttribute("empleado", e);

            request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);

            break;

        case "Actualizar":

            String DPIEmp = request.getParameter("txtDPIEmpleado");
            String nombreEmp = request.getParameter("txtNombresEmpleado");
            String telefonoEmp = request.getParameter("txtTelefonoEmpleado");
            String estEmp = request.getParameter("txtEstadoEmpleado");
            String correoEmp = request.getParameter("txtCorreoEmpleado");

            empleado.setDPIEmpleado(DPIEmp);
            empleado.setNombresEmpleado(nombreEmp);
            empleado.setTelefonoEmpleado(telefonoEmp);
            empleado.setEstado(estEmp);
            empleado.setCorreoEmpleado(correoEmp);
            empleado.setCodigoEmpleado(codEmpleado);

            empleadoDAO.actualizar(empleado);

            request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);

            break;

        case "Eliminar":

            codEmpleado = Integer.parseInt(request.getParameter("codigoEmpleado"));

            empleadoDAO.eliminar(codEmpleado);

            request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);

            break;

    }

    request.getRequestDispatcher("Empleado.jsp").forward(request, response);

}
        
        
        
        
        
        
        
        else if ("Servicios".equals(menu)) {

            switch (accion) {

                // LISTAR 
                case "Listar":
                    // Llama al DAO para obtener todos los servicios
                    List<Servicios> listaServicios = servicioDAO.listar();
                    // Guarda la lista en la petición para enviarla al JSP
                    request.setAttribute("servicios", listaServicios);
                    break;

                //  AGREGAR 
                case "Agregar":
                    try {
                        // Obtiene los valores ingresados en el formulario
                        String nombre = request.getParameter("txtNombreServicio");
                        String descripcion = request.getParameter("txtDescripcion");
                        String tipo = request.getParameter("txtTipo");
                        String fechaStr = request.getParameter("txtFechaServicio");
                        String codVehiculoStr = request.getParameter("txtCodigoVehiculo");

                        // Convierte los valores a los tipos correctos
                        Date fecha = null;
                        int codVehiculo = 0;

                        if (fechaStr != null && !fechaStr.isEmpty()) {
                            fecha = Date.valueOf(fechaStr);
                        }
                        if (codVehiculoStr != null && !codVehiculoStr.isEmpty()) {
                            codVehiculo = Integer.parseInt(codVehiculoStr);
                        }

                        // Setea los valores en el objeto servicio
                        servicio.setNombreServicio(nombre);
                        servicio.setDescripcion(descripcion);
                        servicio.setTipo(tipo);
                        servicio.setFechaServicio(fecha);
                        servicio.setCodigoVehiculo(codVehiculo);

                        // Llama al DAO para agregar el servicio
                        servicioDAO.agregar(servicio);
                    } catch (Exception e) {
                        e.printStackTrace();
                        // Gaurda un mensaje de error si ocurre algún problema
                        request.setAttribute("error", "Ocurrió un error al agregar el servicio.");
                    }
                    break;

                //  EDITAR
                case "Editar":
                    try {
                        // Obtiene el código del servicio seleccionado
                        codServicio = Integer.parseInt(request.getParameter("codigoServicio"));
                        // Obtiene el servicio de la base de datos
                        Servicios serv = servicioDAO.listarCodigoServicio(codServicio);
                        // Guardo el servicio en la petición para cargar el formulario
                        request.setAttribute("servicio", serv);
                    } catch (Exception e) {
                        e.printStackTrace();
                        request.setAttribute("error", "Ocurrió un error al cargar el servicio para editar.");
                    }
                    break;

                //  ACTUALIZAR 
                case "Actualizar":
                    try {
                        // Obtiene el código del servicio a actualizar
                        codServicio = Integer.parseInt(request.getParameter("txtCodigoServicio"));
                        servicio.setCodigoServicio(codServicio);

                        // Obtiene los valores del formulario
                        servicio.setNombreServicio(request.getParameter("txtNombreServicio"));
                        servicio.setDescripcion(request.getParameter("txtDescripcion"));
                        servicio.setTipo(request.getParameter("txtTipo"));

                        String fechaStr = request.getParameter("txtFechaServicio");
                        String codVehiculoStr = request.getParameter("txtCodigoVehiculo");

                        Date fecha = null;
                        int codVehiculo = 0;

                        if (fechaStr != null && !fechaStr.isEmpty()) {
                            fecha = Date.valueOf(fechaStr);
                        }
                        if (codVehiculoStr != null && !codVehiculoStr.isEmpty()) {
                            codVehiculo = Integer.parseInt(codVehiculoStr);
                        }

                        servicio.setFechaServicio(fecha);
                        servicio.setCodigoVehiculo(codVehiculo);

                        // LLama al DAO para actualizar el servicio
                        servicioDAO.actualizar(servicio);
                    } catch (Exception e) {
                        e.printStackTrace();
                        request.setAttribute("error", "Ocurrió un error al actualizar el servicio.");
                    }
                    break;

                // ELIMINAR 
                case "Eliminar":
                    try {
                        // Obtiene el código del servicio a eliminar
                        codServicio = Integer.parseInt(request.getParameter("codigoServicio"));
                        // Llama al DAO para eliminar el servicio
                        servicioDAO.eliminar(codServicio);
                    } catch (Exception e) {
                        e.printStackTrace();
                        request.setAttribute("error", "Ocurrió un error al eliminar el servicio.");
                    }
                    break;

                default:
                    break;
            }

            // Después de cualquier acción, se obtiene la lista actualizada
            List<Servicios> listaServicios = servicioDAO.listar();
            request.setAttribute("servicios", listaServicios);
            // Redirige al JSP para mostrar la información
            request.getRequestDispatcher("Servicios.jsp").forward(request, response);

        // --- OTRAS VISTAS ---
        } else if ("Producto".equals(menu)) {
            request.getRequestDispatcher("Producto.jsp").forward(request, response);
        } else if ("NuevaVenta".equals(menu)) {
            request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
        }else if ("Proveedor".equals(menu)) { 
            switch (accion) {                     
            case "Listar":          
            List<Proveedor> listaProveedores = proveedorDao.listar(); 
            request.setAttribute("proveedores", listaProveedores);  
            break;

        case "Agregar":           
            String nombre = request.getParameter("txtNombreProveedor");
            String telefono = request.getParameter("txtTelefonoProveedor");
            String direccion = request.getParameter("txtDireccionProveedor");
            String correo = request.getParameter("txtCorreoProveedor");

            // --- VALIDACIONES ---
            if (nombre == null || nombre.isEmpty() || nombre.matches(".*\\d.*")) {
                request.setAttribute("error", "El nombre no debe contener números y no puede estar vacío.");
                request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
                return;
            }

            if (telefono == null || telefono.isEmpty() || !telefono.matches("\\d+")) {
                request.setAttribute("error", "El teléfono debe contener solo números y no puede estar vacío.");
                request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
                return;
            }

            if (correo == null || correo.isEmpty() || !correo.contains("@") || !correo.substring(correo.indexOf("@")).contains(".")) {
                request.setAttribute("error", "El correo debe tener un formato válido (ej: usuario@gmail.com).");
                request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
                return;
            }

            proveedor.setNombreProveedor(nombre);
            proveedor.setTelefonoProveedor(telefono);
            proveedor.setDireccionProveedor(direccion);
            proveedor.setCorreoProveedor(correo);

            proveedorDao.agregar(proveedor);
            response.sendRedirect("Controlador?menu=Proveedor&accion=Listar");
            return;

        case "Editar":
            codProveedor = Integer.parseInt(request.getParameter("codigoProveedor")); 
            Proveedor p = proveedorDao.listarCodigoProveedor(codProveedor); 
            request.setAttribute("proveedor", p);
            break;

        case "Actualizar":
            String nombreP = request.getParameter("txtNombreProveedor");
            String telefonoP = request.getParameter("txtTelefonoProveedor");
            String direccionP = request.getParameter("txtDireccionProveedor");
            String correoP = request.getParameter("txtCorreoProveedor");

            // --- VALIDACIONES ---
            if (nombreP == null || nombreP.isEmpty() || nombreP.matches(".*\\d.*")) {
                request.setAttribute("error", "El nombre no debe contener números y no puede estar vacío.");
                request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
                return;
            }

            if (telefonoP == null || telefonoP.isEmpty() || !telefonoP.matches("\\d+")) {
                request.setAttribute("error", "El teléfono debe contener solo números y no puede estar vacío.");
                request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
                return;
            }

            if (correoP == null || correoP.isEmpty() || !correoP.contains("@") || !correoP.substring(correoP.indexOf("@")).contains(".")) {
                request.setAttribute("error", "El correo debe tener un formato válido (ej: usuario@gmail.com).");
                request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
                return;
            }

            proveedor.setNombreProveedor(nombreP);
            proveedor.setTelefonoProveedor(telefonoP);
            proveedor.setDireccionProveedor(direccionP);
            proveedor.setCorreoProveedor(correoP);
            proveedor.setCodigoProveedor(codProveedor);

            proveedorDao.actualizar(proveedor);
            response.sendRedirect("Controlador?menu=Proveedor&accion=Listar");
            return;

        case "Eliminar":
            codProveedor = Integer.parseInt(request.getParameter("codigoProveedor"));
            proveedorDao.eliminar(codProveedor);
            response.sendRedirect("Controlador?menu=Proveedor&accion=Listar");
            return;
    }
    request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
    }else if (menu.equals("Compras")) {
            switch(accion){
                case "Listar":
                    List listaCompras = compraDao.listarCompra();
                    request.setAttribute("compras", listaCompras);
                    break;
                case "Agregar":
                    
                    Date fecha = java.sql.Date.valueOf(request.getParameter("txtFecha"));
                    Double total = Double.parseDouble(request.getParameter("txtTotal"));
                    String descripcion = request.getParameter("txtDescripcion");
                    String estado = request.getParameter("txtEstado");
                    int codigoEmpleado = Integer.parseInt(request.getParameter("txtCodigoEmpleado"));
                    
                    compra.setFecha(fecha);
                    compra.setTotal(total);
                    compra.setDescripcion(descripcion);
                    compra.setEstado(estado);
                    compra.setCodigoEmpleado(codigoEmpleado);
                     compraDao.agregar(compra);
                    request.getRequestDispatcher("Controlador?menu=Compras&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codCompra = Integer.parseInt(request.getParameter("codigoCompra"));
                    Compra c = compraDao.buscar(codCompra);
                    request.setAttribute("compra", c);
                    request.getRequestDispatcher("Controlador?menu=Compras&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    Date fechaA = java.sql.Date.valueOf(request.getParameter("txtFecha"));
                    Double totalA = Double.parseDouble(request.getParameter("txtTotal"));
                    String descripcionA = request.getParameter("txtDescripcion");
                    String estadoA = request.getParameter("txtEstado");
                    compra.setFecha(fechaA);
                    compra.setTotal(totalA);
                    compra.setDescripcion(descripcionA);
                    compra.setEstado(estadoA);
                    compra.setCodigoCompra(codCompra);
                    compraDao.actualizar(compra);
                    request.getRequestDispatcher("Controlador?menu=Compras&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codCompra = Integer.parseInt(request.getParameter("codigoCompra"));
                    compraDao.eliminar(codCompra);
                    request.getRequestDispatcher("Controlador?menu=Compras&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("Compras.jsp").forward(request, response);
        } else if (menu.equals("DetalleCompra")) {
            switch (accion) {
                case "Listar":
                    List listaDetalle = detalleDaoC.listar();
                    request.setAttribute("detalleCompras", listaDetalle);
                    break;

                case "Agregar":
                    String precUnitAgr = request.getParameter("txtPrecioUnitario");
                    String cantAgr = request.getParameter("txtCantidad");
                    String codigoVehiculoAgr = request.getParameter("txtCodigoVehiculo");
                    String codigoCompraAgr = request.getParameter("txtCodigoCompra");

                    if (precUnitAgr == null || precUnitAgr.isEmpty()
                            || cantAgr == null || cantAgr.isEmpty()
                            || codigoVehiculoAgr == null || codigoVehiculoAgr.isEmpty()
                            || codigoCompraAgr == null || codigoCompraAgr.isEmpty()){

                        request.setAttribute("error", "Todos los campos deben estar llenos.");
                        request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                        return;
                    }

                    if (!cantAgr.matches("\\d+")) {
                        request.setAttribute("error", "La cantidad debe ser ingresada en forma de número entero");
                        request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                        return;
                    }

                    if (!precUnitAgr.matches("\\d+(\\.\\d+)?")) {
                        request.setAttribute("error", "El precio unitario debe ser ingresado en forma de número decimal");
                        request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                        return;
                    }


                    double precioUnit = Double.parseDouble(precUnitAgr);
                    int cantidadAgr = Integer.parseInt(cantAgr);
                    int codVehiculoIntAgrs = Integer.parseInt(codigoVehiculoAgr);
                    int codCompraIntAgrs = Integer.parseInt(codigoCompraAgr);

                    if (cantidadAgr <= 0) {
                        request.setAttribute("error", "La cantidad debe ser mayor a 0.");
                        request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                        return;
                    }

                    if (precioUnit <= 0) {
                        request.setAttribute("error", "El Precio Unitario debe ser mayor a 0.");
                        request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                        return;
                    }

                    DetalleCompra detalleCompraN = new DetalleCompra();
                    detalleCompraN.setPrecioUnitario(precioUnit);
                    detalleCompraN.setCantidad(cantidadAgr);
                    detalleCompraN.setCodigoVehiculo(codVehiculoIntAgrs);
                    detalleCompraN.setCodigoCompra(codCompraIntAgrs);
                    detalleDaoC.agregar(detalleCompraN);

                    request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                    return;

                case "Editar":

                    codDetalleCompra = Integer.parseInt(request.getParameter("codigoDetalleCompra"));
                    DetalleCompra dc = detalleDaoC.listarPorCodigoC(codDetalleCompra);
                    request.setAttribute("detalleCompra", dc);
                    request.setAttribute("modo", "editar");
                    request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                    break;

                case "Actualizar":
                    String precUnitActu = request.getParameter("txtPrecioUnitario");
                    String cantActu = request.getParameter("txtCantidad");
                    String codVehiculoActu = request.getParameter("txtCodigoVehiculo");
                    String codCompraActu = request.getParameter("txtCodigoCompra");

                    if (cantActu == null || cantActu.isEmpty()
                            || precUnitActu == null || precUnitActu.isEmpty()
                            || codVehiculoActu == null || codVehiculoActu.isEmpty()
                            || codCompraActu == null || codCompraActu.isEmpty()) {

                        request.setAttribute("error", "Todos los campos deben estar llenos.");
                        request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                        return;
                    }

                    if (!cantActu.matches("\\d+")) {
                        request.setAttribute("error", "La cantidad debe ser ingresada en forma de número entero");
                        request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                        return;
                    }

                    if (!precUnitActu.matches("\\d+(\\.\\d+)?")) {
                        request.setAttribute("error", "El precio unitario debe ser ingresado en forma de número decimal");
                        request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                        return;
                    }

                    double precioUnitActu = Double.parseDouble(precUnitActu);
                    int cantidadActu = Integer.parseInt(cantActu);
                    


                    if (cantidadActu <= 0) {
                        request.setAttribute("error", "La cantidad debe ser mayor a 0.");
                        request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                        return;
                    }

                    if (precioUnitActu <= 0) {
                        request.setAttribute("error", "El Precio Unitario debe ser mayor a 0.");
                        request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                        return;
                    }

                    DetalleCompra actualizado = new DetalleCompra();
                    actualizado.setCodigoDetalleCompra(codDetalleCompra);
                    actualizado.setPrecioUnitario(precioUnitActu);
                    actualizado.setCantidad(cantidadActu);
                    actualizado.setCodigoVehiculo(Integer.parseInt(codVehiculoActu));
                    actualizado.setCodigoCompra(Integer.parseInt(codCompraActu));

                    detalleDaoC.actualizar(actualizado);
                    request.setAttribute("modo", "agregar");
                    request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                    return;

                case "Eliminar":
                    codDetalleCompra = Integer.parseInt(request.getParameter("codigoDetalleCompra"));
                    detalleDaoC.eliminar(codDetalleCompra);
                    request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                    return;
            }

            request.getRequestDispatcher("DetalleCompra.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controlador Principal con Clientes y Servicios";
    }
}
