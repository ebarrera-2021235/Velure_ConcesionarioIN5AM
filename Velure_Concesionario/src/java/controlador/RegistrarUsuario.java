/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Empleado;
import modelo.EmpleadoDAO;
import modelo.Usuario;
import modelo.UsuarioDAO;

/**
 *
 * @author Estuardo Gomez
 */
public class RegistrarUsuario extends HttpServlet {
    EmpleadoDAO empleadoDAO = new EmpleadoDAO();
    UsuarioDAO usuarioDAO = new UsuarioDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegistrarUsuario</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistrarUsuario at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //request se encarga de saber si es post o do
        String nombresUsuario = request.getParameter("nombre");
        String userName = request.getParameter("usuario");
        String contrasenia = request.getParameter("pass");
        String correoUsuario = request.getParameter("correo");
        
        if(!correoUsuario.matches("^[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}$")){
            request.setAttribute("error", "campoVacio");
            request.getRequestDispatcher("Registrarse.jsp").forward(request, response);
        }
        
        //aqui se busca
        Empleado empleado = empleadoDAO.validar(correoUsuario);
        
        if(empleado.getCodigoEmpleado() <= 0){
            request.setAttribute("error", "existeEmp");
            request.getRequestDispatcher("Registrarse.jsp").forward(request, response);
            return;
            //valida si el nombre de un usuario ya  existe
        }else if(usuarioDAO.existeUsuario(userName)){
            request.setAttribute("error", "existeUser");
            request.getRequestDispatcher("Registrarse.jsp").forward(request, response);
            return;
            //valida que el empleado no tenga ya un usuario
        }else if(usuarioDAO.tieneUsuario(empleado.getCodigoEmpleado())){
            request.setAttribute("error", "existeUserEmp");
            request.getRequestDispatcher("Registrarse.jsp").forward(request, response);
            return;
        }
          
        Usuario newUser = new Usuario();
        newUser.setNombresUsuario(nombresUsuario);
        newUser.setUserName(userName);
        newUser.setContrasenia(contrasenia);
        newUser.setCorreoUsuario(correoUsuario);
        newUser.setCodigoEmpleado(empleado.getCodigoEmpleado());
        
        try{
            int resultado = usuarioDAO.agregar(newUser);
        
        if(resultado > 0){
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }else{
            request.setAttribute("error", "noExiste");
            request.getRequestDispatcher("Registrarse.jsp").forward(request, response);
        }
        }catch(Exception e){
            e.printStackTrace();
            request.setAttribute("error", "existeEmp"); // o crea un código específico como "fkError"
            request.getRequestDispatcher("Registrarse.jsp").forward(request, response);

        }
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
