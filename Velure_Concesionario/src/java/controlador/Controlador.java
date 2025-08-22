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
import modelo.DetalleVenta;
import modelo.DetalleVentaDAO;
import modelo.Empleado;
import modelo.EmpleadoDAO;
import modelo.Proveedor;
import modelo.ProveedorDAO;
import modelo.Seguro;
import modelo.SeguroDAO;
import modelo.Servicio;
import modelo.ServicioDAO;
import modelo.Servicios;
import modelo.ServiciosDAO;
import modelo.Venta;
import modelo.VentaDAO;

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
    Servicio servicio = new Servicio();
    ServicioDAO servicioDAO = new ServicioDAO();
    int codServicio;
    
    // Objetos para Proveedor
    Proveedor proveedor = new Proveedor();
    ProveedorDAO proveedorDao = new ProveedorDAO();
    int codProveedor;
    
    //Objetos para Compra
    Compra compra = new Compra();
    CompraDAO compraDao = new CompraDAO();
    int codCompra;
    
    //Objetos para DetalleCompra
    DetalleCompra detalleCompra = new DetalleCompra();
    DetalleCompraDAO detalleDaoC = new DetalleCompraDAO();
    int codDetalleCompra;
    
    //Objeto para DetalleVenta
    DetalleVenta detalleVenta = new DetalleVenta();
    DetalleVentaDAO detalleDao = new DetalleVentaDAO();
    int codDetalleVenta;
    
    // Seguros
    Seguro seguro = new Seguro();
    SeguroDAO seguroDao = new SeguroDAO();
    int codSeguro;
    //Ventas
    Venta venta = new Venta();
    VentaDAO ventaDao = new VentaDAO();
    int codVenta;
    
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
                    // Asegúrate de que el formulario esté en modo "agregar" por defecto
                    request.setAttribute("modo", "agregar");
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
                        // Para manejar el error, necesitas redirigir a la misma vista de listado
                        // para que el usuario pueda ver el mensaje y los datos se vuelvan a cargar.
                        // El JPS de Clientes mostrará el error por el script.
                        List lista = clienteDAO.listarCliente();
                        request.setAttribute("clientes", lista);
                        request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                        return;
                    }

                    if (correoCliente == null || correoCliente.isEmpty()
                            || (!correoCliente.endsWith("@gmail.com")
                            && !correoCliente.endsWith("@outlook.com")
                            && !correoCliente.endsWith("@yahoo.com"))) {

                        request.setAttribute("error", "El correo debe terminar con  @gmail.com, @outlook.com o @yahoo.com");
                        List lista = clienteDAO.listarCliente();
                        request.setAttribute("clientes", lista);
                        request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                        return;
                    }

                    if (telefonoCliente == null || !telefonoCliente.matches("\\d{8}")) {
                        request.setAttribute("error", "El teléfono debe contener exactamente 8 numeros.");
                        List lista = clienteDAO.listarCliente();
                        request.setAttribute("clientes", lista);
                        request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                        return;
                    }

                    if (estado == null || !estado.matches("\\d{1}")) {
                        request.setAttribute("error", "El campo de Estado debe ser un número");
                        List lista = clienteDAO.listarCliente();
                        request.setAttribute("clientes", lista);
                        request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                        return;
                    }

                    if (dpiCliente == null || !dpiCliente.matches("\\d{13}")) {
                        request.setAttribute("error", "El DPI debe contener exactamente 13 digitos.");
                        List lista = clienteDAO.listarCliente();
                        request.setAttribute("clientes", lista);
                        request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                        return;
                    }

                    if (nombresCliente == null || nombresCliente.trim().isEmpty() || !nombresCliente.matches("^[a-zA-Z\\s]+$")) {
                        request.setAttribute("error", "El espacio de Nombres solo puede contener letras y espacios, sin acentos ni caracteres especiales.");
                        List lista = clienteDAO.listarCliente();
                        request.setAttribute("clientes", lista);
                        request.getRequestDispatcher("Clientes.jsp").forward(request, response);
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
                    // Establece el modo a 'editar'
                    request.setAttribute("modo", "editar");
                    List listaEditar = clienteDAO.listarCliente();
                    request.setAttribute("clientes", listaEditar);
                    break;
                
                case "Actualizar":
                    nombresCliente = request.getParameter("txtNombresCliente");
                    dpiCliente = request.getParameter("txtDPICliente");
                    direccionCliente = request.getParameter("txtDireccionCliente");
                    estado = request.getParameter("txtEstado");
                    telefonoCliente = request.getParameter("txtTelefonoCliente");
                    correoCliente = request.getParameter("txtCorreoCliente");

                    // Ahora, valida si alguna de las variables es nula o vacía
                    if (nombresCliente == null || nombresCliente.isEmpty()
                            || dpiCliente == null || dpiCliente.isEmpty()
                            || direccionCliente == null || direccionCliente.isEmpty()
                            || estado == null || estado.isEmpty()
                            || telefonoCliente == null || telefonoCliente.isEmpty()
                            || correoCliente == null || correoCliente.isEmpty()) {

                        request.setAttribute("error", "Todos los campos deben estar llenos.");
                        List lista = clienteDAO.listarCliente();
                        request.setAttribute("clientes", lista);
                        request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                        return;
                    }

                    if (correoCliente == null || correoCliente.isEmpty()
                            || (!correoCliente.endsWith("@gmail.com")
                            && !correoCliente.endsWith("@outlook.com")
                            && !correoCliente.endsWith("@yahoo.com"))) {

                        request.setAttribute("error", "El correo debe terminar con  @gmail.com, @outlook.com o @yahoo.com");
                        List lista = clienteDAO.listarCliente();
                        request.setAttribute("clientes", lista);
                        request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                        return;
                    }

                    if (telefonoCliente == null || !telefonoCliente.matches("\\d{8}")) {
                        request.setAttribute("error", "El teléfono debe contener exactamente 8 numeros.");
                        List lista = clienteDAO.listarCliente();
                        request.setAttribute("clientes", lista);
                        request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                        return;
                    }

                    if (estado == null || !estado.matches("\\d{1}")) {
                        request.setAttribute("error", "El campo de Estado debe ser un número");
                        List lista = clienteDAO.listarCliente();
                        request.setAttribute("clientes", lista);
                        request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                        return;
                    }

                    if (dpiCliente == null || !dpiCliente.matches("\\d{13}")) {
                        request.setAttribute("error", "El DPI debe contener exactamente 13 digitos.");
                        List lista = clienteDAO.listarCliente();
                        request.setAttribute("clientes", lista);
                        request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                        return;
                    }

                    if (nombresCliente == null || nombresCliente.trim().isEmpty() || !nombresCliente.matches("^[a-zA-Z\\s]+$")) {
                        request.setAttribute("error", "El espacio de Nombres solo puede contener letras y espacios, sin acentos ni caracteres especiales.");
                        List lista = clienteDAO.listarCliente();
                        request.setAttribute("clientes", lista);
                        request.getRequestDispatcher("Clientes.jsp").forward(request, response);
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
                
                case "Cancelar":
                    // El botón de cancelar solo estará visible en modo 'editar'. 
                    // Al cancelarlo, simplemente redirigimos a 'Listar' para limpiar el formulario y volver al modo 'agregar'.
                    response.sendRedirect("Controlador?menu=Clientes&accion=Listar");
                    return;
            }
            request.getRequestDispatcher("Clientes.jsp").forward(request, response);

        // --- SERVICIOS ---
        } 
        else if (menu.equals("Empleado")) {
    switch (accion) {

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

            // ✅ Validaciones
            if (DPI == null || !DPI.matches("\\d{13}")) {
                request.setAttribute("error", "El DPI debe contener exactamente 13 dígitos.");
                request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                return;
            }

            if (telefono == null || !telefono.matches("\\d{8}")) {
                request.setAttribute("error", "El teléfono debe contener exactamente 8 dígitos.");
                request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                return;
            }

            if (correo == null || correo.isEmpty() || 
               !(correo.endsWith("@gmail.com") || correo.endsWith("@outlook.com") || correo.endsWith("@yahoo.com"))) {
                request.setAttribute("error", "El correo debe terminar en @gmail.com, @outlook.com o @yahoo.com");
                request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                return;
            }

            if (est == null || !(est.equals("1") || est.equals("2"))) {
                request.setAttribute("error", "El estado solo puede ser 1 (Activo) o 2 (Inactivo).");
                request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                return;
            }

            // Si pasa las validaciones → guardar
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
            request.setAttribute("modo", "editar");
            request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
            break;

        case "Actualizar":
            String DPIEmp = request.getParameter("txtDPIEmpleado");
            String nombreEmp = request.getParameter("txtNombresEmpleado");
            String telefonoEmp = request.getParameter("txtTelefonoEmpleado");
            String estEmp = request.getParameter("txtEstadoEmpleado");
            String correoEmp = request.getParameter("txtCorreoEmpleado");

            // ✅ Validaciones (igual que en Agregar)
            if (DPIEmp == null || !DPIEmp.matches("\\d{13}")) {
                request.setAttribute("error", "El DPI debe contener exactamente 13 dígitos.");
                request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                return;
            }

            if (telefonoEmp == null || !telefonoEmp.matches("\\d{8}")) {
                request.setAttribute("error", "El teléfono debe contener exactamente 8 dígitos.");
                request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                return;
            }

            if (correoEmp == null || correoEmp.isEmpty() ||
               !(correoEmp.endsWith("@gmail.com") || correoEmp.endsWith("@outlook.com") || correoEmp.endsWith("@yahoo.com"))) {
                request.setAttribute("error", "El correo debe terminar en @gmail.com, @outlook.com o @yahoo.com");
                request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                return;
            }

            if (estEmp == null || !(estEmp.equals("1") || estEmp.equals("2"))) {
                request.setAttribute("error", "El estado solo puede ser 1 (Activo) o 2 (Inactivo).");
                request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                return;
            }

            // Si pasa las validaciones → actualizar
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

        case "Cancelar":
            request.setAttribute("modo", "agregar");
            request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
            break;
    }

    request.getRequestDispatcher("Empleado.jsp").forward(request, response);
}


        
        
        
        
        
        
        
        else if ("Servicios".equals(menu)) {

            switch (accion) {

                // LISTAR 
                case "Listar":
                    List listaServicios = servicioDAO.listar();
                    request.setAttribute("servicios", listaServicios);
                    break;

                //  AGREGAR 
                case "Agregar":
                    String nombreServicio = request.getParameter("txtNombreServicio");
                    String descripcion = request.getParameter("txtDescripcion");
                    String tipo = request.getParameter("txtTipo");
                    Date fechaServicio = java.sql.Date.valueOf(request.getParameter("txtFechaServicio"));
                    int codigoVehiculo = Integer.parseInt(request.getParameter("txtCodigoVehiculo"));
                    
                    servicio.setNombreServicio(nombreServicio);
                    servicio.setDescripcion(descripcion);
                    servicio.setTipo(tipo);
                    servicio.setFechaServicio(fechaServicio);
                    servicio.setCodigoVehiculo(codigoVehiculo);
                    servicioDAO.agregar(servicio);
                    request.getRequestDispatcher("Controlador?menu=Servicios&accion=Listar").forward(request, response);
                    break;

                //  EDITAR
                case "Editar":
                    codServicio = Integer.parseInt(request.getParameter("codigoServicio"));
                    Servicio s = servicioDAO.obtenerPorCodigo(codServicio);
                    request.setAttribute("servicio", s);
                    request.setAttribute("modoEdicion", true); // bandera para JSP
                    request.getRequestDispatcher("Controlador?menu=Servicios&accion=Listar").forward(request, response);
                    break;

                //  ACTUALIZAR 
                case "Actualizar":
                    String nombreSer = request.getParameter("txtNombreServicio");
                    String descripcionSer = request.getParameter("txtDescripcion");
                    String tipoSer = request.getParameter("txtTipo");
                    Date fechaSer = java.sql.Date.valueOf(request.getParameter("txtFechaServicio"));
                    servicio.setNombreServicio(nombreSer);
                    servicio.setDescripcion(descripcionSer);
                    servicio.setTipo(tipoSer);
                    servicio.setFechaServicio(fechaSer);
                    servicio.setCodigoServicio(codServicio);
                    servicioDAO.actualizar(servicio);
                    request.getRequestDispatcher("Controlador?menu=Servicios&accion=Listar").forward(request, response);
                    break;

                // ELIMINAR 
                case "Eliminar":
                    codServicio = Integer.parseInt(request.getParameter("codigoServicio"));
                    servicioDAO.eliminar(codServicio);
                    request.getRequestDispatcher("Controlador?menu=Servicios&accion=Listar").forward(request, response);
                    break;
                case "Cancelar":
                    // Limpio el objeto servicio
                    servicio = new Servicio();  
                    request.setAttribute("servicio", null); 
                    request.setAttribute("modoEdicion", false);
                    request.getRequestDispatcher("Controlador?menu=Servicios&accion=Listar").forward(request, response);
                return;

            }
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
            request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
            break;

        case "Agregar":           
            String nombre = request.getParameter("txtNombreProveedor");
            String telefono = request.getParameter("txtTelefonoProveedor");
            String direccion = request.getParameter("txtDireccionProveedor");
            String correo = request.getParameter("txtCorreoProveedor");

            // --- VALIDACIONES --- 
            if (nombre == null || nombre.isEmpty() || nombre.matches(".*\\d.*")) {
                request.setAttribute("error", "El nombre no debe contener números y no puede estar vacío.");
                request.setAttribute("proveedores", proveedorDao.listar());
                request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
                return;
            }

            if (telefono == null || telefono.isEmpty() || !telefono.matches("\\d{8}")) {
                request.setAttribute("error", "El teléfono debe contener exactamente 8 números.");
                request.setAttribute("proveedores", proveedorDao.listar());
                request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
                return;
            }

            if (correo == null || correo.isEmpty() || 
                (!correo.endsWith("@gmail.com") && !correo.endsWith("@outlook.com") && !correo.endsWith("@yahoo.com"))) {
                request.setAttribute("error", "El correo debe terminar con @gmail.com, @outlook.com o @yahoo.com.");
                request.setAttribute("proveedores", proveedorDao.listar());
                request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
                return;
            }

            proveedor.setNombreProveedor(nombre);
            proveedor.setTelefonoProveedor(telefono);
            proveedor.setDireccionProveedor(direccion);
            proveedor.setCorreoProveedor(correo);

            proveedorDao.agregar(proveedor);

            // Recargar lista
            request.setAttribute("proveedores", proveedorDao.listar());
            request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
            return;

        case "Editar":
            codProveedor = Integer.parseInt(request.getParameter("codigoProveedor"));
            Proveedor p = proveedorDao.listarCodigoProveedor(codProveedor);
            request.setAttribute("proveedor", p);
            request.setAttribute("modo", "editar");  
            request.setAttribute("proveedores", proveedorDao.listar());
            request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
            break;

        case "Actualizar":
            String nombreP = request.getParameter("txtNombreProveedor");
            String telefonoP = request.getParameter("txtTelefonoProveedor");
            String direccionP = request.getParameter("txtDireccionProveedor");
            String correoP = request.getParameter("txtCorreoProveedor");

            Proveedor proveedorTemp = new Proveedor();
            proveedorTemp.setNombreProveedor(nombreP);
            proveedorTemp.setTelefonoProveedor(telefonoP);
            proveedorTemp.setDireccionProveedor(direccionP);
            proveedorTemp.setCorreoProveedor(correoP);

            // --- VALIDACIONES ---
            if (nombreP == null || nombreP.isEmpty() || nombreP.matches(".*\\d.*")) {
                request.setAttribute("error", "El nombre no debe contener números y no puede estar vacío.");
                request.setAttribute("proveedor", proveedorTemp);
                request.setAttribute("modo", "editar");
                request.setAttribute("proveedores", proveedorDao.listar());
                request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
                return;
            }

            if (telefonoP == null || telefonoP.isEmpty() || !telefonoP.matches("\\d{8}")) {
                request.setAttribute("error", "El teléfono debe contener exactamente 8 números.");
                request.setAttribute("proveedor", proveedorTemp);
                request.setAttribute("modo", "editar");
                request.setAttribute("proveedores", proveedorDao.listar());
                request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
                return;
            }

            if (correoP == null || correoP.isEmpty() ||
                (!correoP.endsWith("@gmail.com") && !correoP.endsWith("@outlook.com") && !correoP.endsWith("@yahoo.com"))) {
                request.setAttribute("error", "El correo debe terminar con @gmail.com, @outlook.com o @yahoo.com.");
                request.setAttribute("proveedor", proveedorTemp);
                request.setAttribute("modo", "editar");
                request.setAttribute("proveedores", proveedorDao.listar());
                request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
                return;
            }

            proveedorTemp.setCodigoProveedor(codProveedor);
            proveedorDao.actualizar(proveedorTemp);

            request.setAttribute("modo", "agregar");
            request.setAttribute("proveedores", proveedorDao.listar());
            request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
            return;

        case "Eliminar":
            codProveedor = Integer.parseInt(request.getParameter("codigoProveedor"));
            proveedorDao.eliminar(codProveedor);
            request.setAttribute("proveedores", proveedorDao.listar());
            request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
            return;

        case "Cancelar":
            request.setAttribute("modo", "agregar");
            request.setAttribute("proveedores", proveedorDao.listar());
            request.getRequestDispatcher("Proveedor.jsp").forward(request, response);
            break;
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
                    request.setAttribute("modo", "editar");
                    request.getRequestDispatcher("Controlador?menu=Compras&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    Date fechaA = java.sql.Date.valueOf(request.getParameter("txtFecha"));
                    Double totalA = Double.valueOf(request.getParameter("txtTotal"));
                    String descripcionA = request.getParameter("txtDescripcion");
                    String estadoA = request.getParameter("txtEstado");
                    compra.setFecha(fechaA);
                    compra.setTotal(totalA);
                    compra.setDescripcion(descripcionA);
                    compra.setEstado(estadoA);
                    compra.setCodigoCompra(codCompra);
                    compraDao.actualizar(compra);
                    request.setAttribute("modo", "agregar");
                    request.getRequestDispatcher("Controlador?menu=Compras&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codCompra = Integer.parseInt(request.getParameter("codigoCompra"));
                    compraDao.eliminar(codCompra);
                    request.getRequestDispatcher("Controlador?menu=Compras&accion=Listar").forward(request, response);
                    break;
                case "Cancelar":
                    request.setAttribute("modo", "agregar");
                    request.getRequestDispatcher("Controlador?menu=Compras&accion=Listar").forward(request, response);
                        break;            
            }
            request.getRequestDispatcher("Compras.jsp").forward(request, response);
        }  else if (menu.equals("DetalleCompra")) {
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
                case "cancelar":
                    request.setAttribute("modo", "agregar");
                    request.getRequestDispatcher("Controlador?menu=DetalleCompra&accion=Listar").forward(request, response);
                    break;
            }

            request.getRequestDispatcher("DetalleCompra.jsp").forward(request, response);
        }else if (menu.equals("DetalleVenta")) {
            switch (accion) {
                case "Listar":
                    List listaDetalle = detalleDao.listar();
                    request.setAttribute("detalleVentas", listaDetalle);
                    break;

                case "Agregar":
                    String cantAgr = request.getParameter("txtCantidad");
                    String precVentaAgr = request.getParameter("txtPrecioVenta");
                    String codVehiculoAgr = request.getParameter("txtCodigoVehiculo");
                    String codVentaAgr = request.getParameter("txtCodigoVenta");

                    if (cantAgr == null || cantAgr.isEmpty()
                            || precVentaAgr == null || precVentaAgr.isEmpty()
                            || codVehiculoAgr == null || codVehiculoAgr.isEmpty()
                            || codVentaAgr == null || codVentaAgr.isEmpty()) {

                        request.setAttribute("error", "Todos los campos deben estar llenos.");
                        request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                        return;
                    }

                    if (!cantAgr.matches("\\d+")) {
                        request.setAttribute("error", "La cantidad debe ser ingresada en forma de número entero");
                        request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                        return;
                    }

                    if (!precVentaAgr.matches("\\d+(\\.\\d+)?")) {
                        request.setAttribute("error", "El precio de venta debe ser ingresada en forma de número decimal");
                        request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                        return;
                    }

                    if (!codVehiculoAgr.matches("\\d+")) {
                        request.setAttribute("error", "El codigo de Vehiculo debe ser ingresada en forma de número entero");
                        request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                        return;
                    }

                    if (!codVentaAgr.matches("\\d+")) {
                        request.setAttribute("error", "El codigo de Venta debe ser ingresada en forma de número entero");
                        request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                        return;
                    }

                    int cantInt = Integer.parseInt(cantAgr);
                    double precVentaInt = Double.parseDouble(precVentaAgr);
                    int codVehiculoInt = Integer.parseInt(codVehiculoAgr);
                    int codVentaInt = Integer.parseInt(codVentaAgr);

                    if (cantInt <= 0) {
                        request.setAttribute("error", "La cantidad debe ser mayor a 0.");
                        request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                        return;
                    }

                    if (precVentaInt <= 0) {
                        request.setAttribute("error", "El Precio de Venta debe ser mayor a 0.");
                        request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                        return;
                    }

                    DetalleVenta detalleVentaN = new DetalleVenta();
                    detalleVentaN.setCantidad(cantInt);
                    detalleVentaN.setPrecioVenta(precVentaInt);
                    detalleVentaN.setCodigoVehiculo(codVehiculoInt);
                    detalleVentaN.setCodigoVenta(codVentaInt);
                    detalleDao.agregar(detalleVentaN);


                    request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                    return;

                case "Editar":

                    codDetalleVenta = Integer.parseInt(request.getParameter("codigoDetalleVenta"));
                    DetalleVenta dv = detalleDao.listarPorCodigoDetalle(codDetalleVenta);
                    request.setAttribute("detalleVenta", dv);
                    request.setAttribute("modo", "editar");
                    request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                    break;

                case "Actualizar":
                    String cantAct = request.getParameter("txtCantidad");
                    String precVentaAct = request.getParameter("txtPrecioVenta");
                    String codVehiculoAct = request.getParameter("txtCodigoVehiculo");
                    String codVentaAct = request.getParameter("txtCodigoVenta");

                    if (cantAct == null || cantAct.isEmpty()
                            || precVentaAct == null || precVentaAct.isEmpty()
                            || codVehiculoAct == null || codVehiculoAct.isEmpty()
                            || codVentaAct == null || codVentaAct.isEmpty()) {

                        request.setAttribute("error", "Debe seleccionar una tupla de la tabla.");
                        request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                        return;
                    }

                    if (!cantAct.matches("\\d+")) {
                        request.setAttribute("error", "La cantidad debe ser ingresada en forma de número entero");
                        request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                        return;
                    }

                    if (!precVentaAct.matches("\\d+(\\.\\d+)?")) {
                        request.setAttribute("error", "El precio de venta debe ser ingresada en forma de número decimal");
                        request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                        return;
                    }

                    if (!codVehiculoAct.matches("\\d+")) {
                        request.setAttribute("error", "El codigo de Vehiculo debe ser ingresada en forma de número entero");
                        request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                        return;
                    }

                    if (!codVentaAct.matches("\\d+")) {
                        request.setAttribute("error", "El codigo de Venta debe ser ingresada en forma de número entero");
                        request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                        return;
                    }

                    int cantidadAct = Integer.parseInt(cantAct);
                    double precioAct = Double.parseDouble(precVentaAct);

                    DetalleVenta original = detalleDao.listarPorCodigoDetalle(codDetalleVenta);

                    if (cantidadAct <= 0) {
                        request.setAttribute("error", "La cantidad debe ser mayor a 0.");
                        request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                        return;
                    }

                    if (precioAct <= 0) {
                        request.setAttribute("error", "El Precio de Venta debe ser mayor a 0.");
                        request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                        return;
                    }

                    DetalleVenta actualizado = new DetalleVenta();
                    actualizado.setCodigoDetalleVenta(codDetalleVenta);
                    actualizado.setCantidad(cantidadAct);
                    actualizado.setPrecioVenta(precioAct);
                    actualizado.setCodigoVehiculo(Integer.parseInt(codVehiculoAct));
                    actualizado.setCodigoVenta(Integer.parseInt(codVentaAct));

                    detalleDao.actualizar(actualizado);
                    request.setAttribute("modo", "agregar");
                    request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                    return;

                case "Eliminar":
                    codDetalleVenta = Integer.parseInt(request.getParameter("codigoDetalleVenta"));
                    detalleDao.eliminar(codDetalleVenta);
                    request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                    return;
                case "cancelar":
                    request.setAttribute("modo", "agregar");
                    request.getRequestDispatcher("Controlador?menu=DetalleVenta&accion=Listar").forward(request, response);
                    break;
            }

            request.getRequestDispatcher("DetalleVenta.jsp").forward(request, response);
        }else if (menu.equals("Seguro")) {
            switch (accion) {
                case "Listar":
                    List<Seguro> listaSeguros = seguroDao.listar();
                    request.setAttribute("seguros", listaSeguros);
                    request.getRequestDispatcher("Seguros.jsp").forward(request, response);
                    break;

                case "Agregar":
                        String tipoCobertura = request.getParameter("txttipoCobertura");
                        String descripcion = request.getParameter("txtdescripcion");
                        String costoStr = request.getParameter("txtcosto");
                        String fechaInicioStr = request.getParameter("txtfechaInicio");
                        String fechaFinStr = request.getParameter("txtfechaFin");
                        String codigoVehiculoStr = request.getParameter("txtcodigoVehiculo");

                        // VALIDACIÓN DE DESCRIPCIÓN (solo letras y espacios)
                        if (descripcion == null || descripcion.trim().isEmpty() || !descripcion.matches("^[a-zA-Z\\s]+$")) {
                            request.setAttribute("error", "El campo Descripción solo puede contener letras y espacios, sin acentos ni caracteres especiales.");
                            request.getRequestDispatcher("Controlador?menu=Seguro&accion=Listar").forward(request, response);
                            return;
                        }

                        // VALIDACIÓN DE COSTO (solo números decimales o enteros)
                        if (costoStr == null || costoStr.trim().isEmpty() || !costoStr.matches("^\\d+(\\.\\d+)?$")) {
                            request.setAttribute("error", "El campo Costo solo puede contener números válidos (ej: 100 o 100.50).");
                            request.getRequestDispatcher("Controlador?menu=Seguro&accion=Listar").forward(request, response);
                            return;
                        }
                        
   

                        // Conversión segura de datos
                         Date fechaInicio = java.sql.Date.valueOf(fechaInicioStr);
                        Date fechaFin = java.sql.Date.valueOf(fechaFinStr);
                        double costo = Double.parseDouble(costoStr);
                        int codigoVehiculo = Integer.parseInt(codigoVehiculoStr);
                        
                         // VALIDACIÓN DE FECHAS (fechaFin no puede ser anterior a fechaInicio)
                        if (fechaFin.before(fechaInicio)) {
                            request.setAttribute("error", "La Fecha de Fin no puede ser anterior a la Fecha de Inicio.");
                            request.getRequestDispatcher("Controlador?menu=Seguro&accion=Listar").forward(request, response);
                            return;
                        }

                        seguro.setTipoCobertura(tipoCobertura);
                        seguro.setDescripcion(descripcion);
                        seguro.setFechaInicio(fechaInicio);
                        seguro.setFechaFin(fechaFin);
                        seguro.setCosto(costo);
                        seguro.setCodigoVehiculo(codigoVehiculo);

                        seguroDao.agregar(seguro);
                        request.setAttribute("modo", "editar");
                        request.getRequestDispatcher("Controlador?menu=Seguro&accion=Listar").forward(request, response);
                        break;
                    
               case "Editar":
                        codSeguro = Integer.parseInt(request.getParameter("codigoSeguro"));
                        Seguro s = seguroDao.listarCodigoSeguro(codSeguro);
                        request.setAttribute("seguro", s); // objeto a editar
                        request.setAttribute("modo", "editar");
                        // Solo hacemos forward a Seguros.jsp, no a "Listar"
                        request.getRequestDispatcher("Controlador?menu=Seguro&accion=Listar").forward(request, response);
                        break;


              case "Actualizar":
                        String tipoCoberturaS = request.getParameter("txttipoCobertura");
                        String descripcionS = request.getParameter("txtdescripcion");
                        String costoStrS = request.getParameter("txtcosto");
                        String fechaInicioStrS = request.getParameter("txtfechaInicio");
                        String fechaFinStrS = request.getParameter("txtfechaFin");
                        String codigoSeguroStr = request.getParameter("txtcodigoSeguro");

                        // VALIDACIONES
                        if (descripcionS == null || descripcionS.trim().isEmpty() || !descripcionS.matches("^[a-zA-Z\\s]+$")) {
                            request.setAttribute("error", "El campo Descripción solo puede contener letras y espacios.");
                            request.getRequestDispatcher("Controlador?menu=Seguro&accion=Listar").forward(request, response);
                            return;
                        }
                        
                       if (costoStrS == null || costoStrS.trim().isEmpty() || !costoStrS.matches("^\\d+(\\.\\d+)?$")) {
                           request.setAttribute("error", "El campo Costo solo puede contener números válidos.");
                           request.getRequestDispatcher("Controlador?menu=Seguro&accion=Listar").forward(request, response);
                           return;
                       }
                            
                       // CONVERSIÓN DE DATOS
                       Date fechaInicioS = java.sql.Date.valueOf(fechaInicioStrS);
                       Date fechaFinS = java.sql.Date.valueOf(fechaFinStrS);
                       double costoS = Double.parseDouble(costoStrS);
                       int codigoSeguro = Integer.parseInt(codigoSeguroStr);
                            
                      // VALIDACIÓN DE FECHAS
                     if (fechaFinS.before(fechaInicioS)) {
                            request.setAttribute("error", "La Fecha de Fin no puede ser anterior a la Fecha de Inicio.");
                            request.getRequestDispatcher("Controlador?menu=Seguro&accion=Listar").forward(request, response);
                            return;
                        }

                     // SETEO DEL OBJETO
                       seguro.setCodigoSeguro(codigoSeguro);
                       seguro.setDescripcion(descripcionS);
                       seguro.setFechaInicio(fechaInicioS);
                       seguro.setFechaFin(fechaFinS);
                       seguro.setCosto(costoS);

                    // ACTUALIZAR EN LA BASE DE DATOS
                       seguroDao.actualizar(seguro);

                    // REDIRECCIÓN PARA RECARGAR LISTA
                       request.setAttribute("modo", "agregar");
                       request.getRequestDispatcher("Controlador?menu=Seguro&accion=Listar").forward(request, response);
                       break;

                case "Eliminar":
                        codSeguro = Integer.parseInt(request.getParameter("codigoSeguro")); // Se obtiene el código del seguro
                        seguroDao.eliminar(codSeguro); // Se llama al SeguroDAO para eliminarlo de la base de datos
                        request.getRequestDispatcher("Controlador?menu=Seguro&accion=Listar").forward(request, response);
                        break;    
                
                case "Cancelar":
                        request.setAttribute("modo", "agregar");
                        request.getRequestDispatcher("Controlador?menu=Seguro&accion=Listar").forward(request, response);
                        break;
                        
            }       
            request.getRequestDispatcher("Seguros.jsp").forward(request, response);
        }else if (menu.equals("Venta")) {
            switch(accion){
                case "Listar":
                    List listaVentas = ventaDao.listar();
                    request.setAttribute("ventas", listaVentas);
                    break;
                case "Agregar":
                    Date fecha = java.sql.Date.valueOf(request.getParameter("txtFecha"));
                    Double total = Double.parseDouble(request.getParameter("txtTotal"));
                    String descripcion = request.getParameter("txtDescripcion");
                    String tipoDePago = request.getParameter("txtTipoDePago");
                    int codigoCliente = Integer.parseInt(request.getParameter("txtCodigoCliente"));
                    int codigoEmpleado = Integer.parseInt(request.getParameter("txtCodigoEmpleado"));
                    venta.setFecha(fecha);
                    venta.setTotal(total);
                    venta.setDescripcion(descripcion);
                    venta.setTipoDePago(tipoDePago);
                    venta.setCodigoCliente(codigoCliente);
                    venta.setCodigoEmpleado(codigoEmpleado);
                    ventaDao.agregar(venta);
                    request.getRequestDispatcher("Controlador?menu=Venta&accion=Listar").forward(request, response);
                    break;
                case "Editar":
                    codVenta = Integer.parseInt(request.getParameter("codigoVenta"));
                    Venta v = ventaDao.listarCodigoVenta(codVenta);
                    request.setAttribute("venta", v);
                    request.setAttribute("modo", "editar");
                    request.getRequestDispatcher("Controlador?menu=Venta&accion=Listar").forward(request, response);
                    break;
                    
                case "Actualizar":
                    Date fechaVen = java.sql.Date.valueOf(request.getParameter("txtFecha"));
                    Double totalVen = Double.parseDouble(request.getParameter("txtTotal"));
                    String descripcionVen = request.getParameter("txtDescripcion");
                    String tipoDePagoVen = request.getParameter("txtTipoDePago");
                    venta.setFecha(fechaVen);
                    venta.setTotal(totalVen);
                    venta.setDescripcion(descripcionVen);
                    venta.setTipoDePago(tipoDePagoVen);
                    venta.setCodigoVenta(codVenta);
                    ventaDao.actualizar(venta);
                    request.setAttribute("modo", "agregar");
                    request.getRequestDispatcher("Controlador?menu=Venta&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codVenta = Integer.parseInt(request.getParameter("codigoVenta"));
                    ventaDao.eliminar(codVenta);
                    request.getRequestDispatcher("Controlador?menu=Venta&accion=Listar").forward(request, response);
                    break;
                case "Cancelar":
                    request.setAttribute("modo", "agregar");
                    request.getRequestDispatcher("Controlador?menu=Venta&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("Venta.jsp").forward(request, response);
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
