/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;
import modelo.ClienteDAO;
import modelo.Empleado;
import modelo.EmpleadoDAO;

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

            // --- CLIENTE ---
         
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
                    request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                    return;

                case "Editar":
                    codCliente = Integer.parseInt(request.getParameter("codigoCliente"));
                    Cliente cl = clienteDAO.listarCodigoCliente(codCliente);
                    request.setAttribute("cliente", cl);
                    request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
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
                    request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                    return;

                case "Eliminar":
                    codCliente = Integer.parseInt(request.getParameter("codigoCliente"));
                    clienteDAO.eliminar(codCliente);
                    request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                    return;
            }
            request.getRequestDispatcher("Clientes.jsp").forward(request, response);

            // --- OTRAS VISTAS ---
        } else if ("Producto".equals(menu)) {
            request.getRequestDispatcher("Producto.jsp").forward(request, response);
        } else if ("NuevaVenta".equals(menu)) {
            request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
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
        return "Controlador Principal";
    }
}