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
    public Empleado validar(int id){
        Empleado empleado = new Empleado();
        String sql = "select * from Empleados where correoEmpleado =" + id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
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
