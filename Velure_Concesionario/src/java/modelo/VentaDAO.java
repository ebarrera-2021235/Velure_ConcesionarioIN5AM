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
}
