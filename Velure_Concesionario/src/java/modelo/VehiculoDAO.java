
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class VehiculoDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    //METODOS CRUD (AGREGAR, ELIMINAR, EDITAR)
    //LISTAR
    public List listar(){
        String sql = "select * from Vehiculos";
        List<Vehiculo> listaVehiculo = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Vehiculo vh = new Vehiculo();
                vh.setCodigoVehiculo(rs.getInt(1));
                vh.setModelo(rs.getString(2));
                vh.setDescripcion(rs.getString(3));
                vh.setMarca(rs.getString(4));
                vh.setColor(rs.getString(5));
                vh.setStock(rs.getInt(6));
                vh.setPrecio(rs.getDouble(7));
                vh.setAnio(rs.getString(8));
                vh.setCodigoProveedor(rs.getInt(9));
                listaVehiculo.add(vh);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return listaVehiculo;
    }
    
    //AGREGAR
    public int agregar(Vehiculo vh){
        String sql =  "insert into Vehiculos (modelo, descripcion, marca, color, stock, precio, anio, codigoProveedor) values(?, ?, ?, ?, ?, ?, ?, ?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, vh.getModelo());
            ps.setString(2, vh.getDescripcion());
            ps.setString(3, vh.getMarca());
            ps.setString(4, vh.getColor());
            ps.setInt(5, vh.getStock());
            ps.setDouble(6, vh.getPrecio());
            ps.setString(7, vh.getAnio());
            ps.setInt(8, vh.getCodigoProveedor());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    // BUSCAR POR CODIGO
    public Vehiculo listarCodigoVehiculo(int id){
        // INSTANCIAR UN OBJETO DE TIPO EMPLEADO
        Vehiculo vh = new Vehiculo();
        String sql = "select * from vehiculos where codigoVehiculo ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                vh.setModelo(rs.getString(2));
                vh.setDescripcion(rs.getString(3));
                vh.setMarca(rs.getString(4));
                vh.setColor(rs.getString(5));
                vh.setStock(rs.getInt(6));
                vh.setPrecio(rs.getDouble(7));
                vh.setAnio(rs.getString(8));
                vh.setCodigoProveedor(rs.getInt(9));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return vh;
    }
    // ACTUALIZAR
    public int actualizar(Vehiculo vh){
        String sql = "Update Vehiculos set modelo = ?, descripcion = ?, marca = ?, color = ?, stock = ?, precio = ?, anio = ?  where codigoVehiculo = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, vh.getModelo());
            ps.setString(2, vh.getDescripcion());
            ps.setString(3, vh.getMarca());
            ps.setString(4, vh.getColor());
            ps.setInt(5, vh.getStock());
            ps.setDouble(6, vh.getPrecio());
            ps.setString(7, vh.getAnio());
            ps.setInt(8, vh.getCodigoVehiculo());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    // ELIMINAR
    public void eliminar(int id){
        String sql = "Delete from Vehiculos where codigoVehiculo ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

}
