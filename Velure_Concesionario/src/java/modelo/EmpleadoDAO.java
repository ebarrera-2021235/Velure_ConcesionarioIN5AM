package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author USUARIO
 */
public class EmpleadoDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    //buscar empleado por correo para verificar si ya existe
    public Empleado validar(String correo){
        Empleado empleado = new Empleado();
        String sql = "select * from Empleados where correoEmpleado = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            rs = ps.executeQuery();
            while(rs.next()){
                empleado.setCodigoEmpleado(rs.getInt("codigoEmpleado"));
                empleado.setNombresEmpleado(rs.getString("nombresEmpleado"));
                empleado.setDPIEmpleado(rs.getString("DPIEmpleado"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return empleado;
    }
}
