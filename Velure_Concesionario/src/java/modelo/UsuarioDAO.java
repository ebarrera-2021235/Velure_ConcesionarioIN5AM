package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuarioDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    public Usuario validar(String username, String contrasenia){
        Usuario user = new Usuario();
        String sql = "select * from Usuarios where userName = ? and contrasenia = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, contrasenia);
            rs = ps.executeQuery();
            while(rs.next()){
                user.setCodigoUsuario(rs.getInt("codigoUsuario"));
                user.setUserName(rs.getString("userName"));
                user.setNombresUsuario(rs.getString("nombresUsuario"));
                user.setContrasenia(rs.getString("contrasenia"));
                user.setCodigoEmpleado(rs.getInt("codigoEmpleado"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return user;
    }
    
    public int agregar(Usuario user){
        // Grabar Empleado
        String estadoEmpleado = "1"; // dato quemado
        String sqlEmpleado = "insert into Empleados "
                + "(nombresEmpleado, DPIEmpleado, estado, telefonoEmpleado, correoEmpleado) "
                + "values(?, ?, ?, ?, ?)";
        
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sqlEmpleado);
            ps.setString(1, user.getNombresUsuario());
            ps.setString(2, user.getDPIEmpleado());
            ps.setString(3, estadoEmpleado);
            ps.setString(4, user.getTelefonoEmpleado());
            ps.setString(5, user.getCorreoUsuario());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        // Recuperar ID del Empleado
        String sqlIdEmpleado = "select codigoEmpleado from Empleados where correoEmpleado = ?";
        int codEmpleado = 0; // se inicializa para asegurarme que no guarde el último valor
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sqlIdEmpleado);
            ps.setString(1, user.getCorreoUsuario());
            rs = ps.executeQuery();
            while(rs.next()){
                codEmpleado=(rs.getInt("codigoEmpleado"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        // Grabar el usuario
        String sql = "insert into usuarios (nombresUsuario, userName, contrasenia, correoUsuario, codigoEmpleado) values (?, ?, ?, ?, ?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, user.getNombresUsuario());
            ps.setString(2, user.getUserName());
            ps.setString(3, user.getContrasenia());
            ps.setString(4, user.getCorreoUsuario());
            ps.setInt(5, codEmpleado);
            return ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return resp; // indica la linea que se agregara
    }
    
    //existe un usuario con ese nombre
    public boolean existeUsuario(String userName){
        String sql = "select count(*) from usuarios where userName = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            
            if(rs.next()){
                return rs.getInt(1) > 0;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    
    //un empleado ya tiene un usuario
    public boolean tieneUsuario(int codigoEmpleado){
        String sql = "select count(*) from usuarios where codigoEmpleado = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigoEmpleado);
            rs = ps.executeQuery();
            
            if(rs.next()){
                return rs.getInt(1) > 0;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
