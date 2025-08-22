/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Roberto Catalán
 */
public class VentaDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;


 //MÉTODOS DEL CRUD 
 //LISTAR
    public List listar(){
        String sql = "select * from ventas";
        List<Venta> listaVenta = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Venta ven = new Venta();
                ven.setCodigoVenta(rs.getInt(1));
                ven.setFecha(rs.getDate(2));
                ven.setTotal(rs.getDouble(3));
                ven.setDescripcion(rs.getString(4));
                ven.setTipoDePago(rs.getString(5));
                ven.setCodigoCliente(rs.getInt(6));
                ven.setCodigoEmpleado(rs.getInt(7));
                listaVenta.add(ven);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return listaVenta;
    }
 //AGREGAR
    public int agregar(Venta ven){
        String sql = "insert into Ventas (fecha, total, descripcion, tipoDePago, codigoCliente, codigoEmpleado) values(?,?,?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setDate(1, ven.getFecha());
            ps.setDouble(2, ven.getTotal());
            ps.setString(3, ven.getDescripcion());
            ps.setString(4, ven.getTipoDePago());
            ps.setInt(5, ven.getCodigoCliente());
            ps.setInt(6, ven.getCodigoEmpleado());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
 //BUSCAR POR CÓDIGO
    public Venta listarCodigoVenta(int id){
        //Instanciar un objeto de tipo Empleado
        Venta ven = new Venta();
        String sql = "select * from ventas where codigoVenta ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                ven.setFecha(rs.getDate(2));
                ven.setTotal(rs.getDouble(3));
                ven.setDescripcion(rs.getString(4));
                ven.setTipoDePago(rs.getString(5));
                ven.setCodigoCliente(rs.getInt(6));
                ven.setCodigoEmpleado(rs.getInt(7));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return ven;
    }
 //ACTUALIZAR
    public int actualizar(Venta ven){
        String sql = "Update Ventas set fecha = ?, total = ?, descripcion = ?, tipoDePago = ? where codigoVenta = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setDate(1, ven.getFecha());
            ps.setDouble(2, ven.getTotal());
            ps.setString(3, ven.getDescripcion());
            ps.setString(4, ven.getTipoDePago());
            ps.setInt(5, ven.getCodigoVenta());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp; 
    }
 //ELIMINAR
    public void eliminar(int id){
        String sql = "Delete from Ventas where codigoVenta ="+id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
