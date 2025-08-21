package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

public class DetalleVentaDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

public DetalleVenta validar(int codigoVehiculo, int codigoVenta){
    DetalleVenta detalleVenta = new DetalleVenta();
    String sql = "select * from DetalleVenta where codigoVehiculo = ? AND codigoVenta = ?";
    try {
        con = cn.Conexion();
        ps = con.prepareStatement(sql);
        ps.setInt(1, codigoVehiculo);
        ps.setInt(2, codigoVenta);
        rs = ps.executeQuery();
        while (rs.next()) {
            detalleVenta.setCodigoDetalleVenta(rs.getInt("codigoDetalleVenta"));
            detalleVenta.setCantidad(rs.getInt("cantidad"));
            detalleVenta.setPrecioVenta(rs.getDouble("precioVenta"));
            detalleVenta.setCodigoVehiculo(rs.getInt("codigoVehiculo"));
            detalleVenta.setCodigoVenta(rs.getInt("codigoVenta"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    return detalleVenta;
}

    
    // LISTAR TODOS
    public List<DetalleVenta> listar() {
        String sql = "select * from DetalleVenta";
        List<DetalleVenta> listaDetalle = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetalleVenta dv = new DetalleVenta();
                dv.setCodigoDetalleVenta(rs.getInt(1));
                dv.setCantidad(rs.getInt(2));
                dv.setPrecioVenta(rs.getDouble(3));
                dv.setCodigoVehiculo(rs.getInt(4));
                dv.setCodigoVenta(rs.getInt(5));
                listaDetalle.add(dv);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaDetalle;
    }

    // AGREGAR
    public int agregar(DetalleVenta dv) {
        String sql = "insert into DetalleVenta (cantidad, precioVenta, codigoVehiculo, codigoVenta) values (?, ?, ?, ?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, dv.getCantidad());
            ps.setDouble(2, dv.getPrecioVenta());
            ps.setInt(3, dv.getCodigoVehiculo());
            ps.setInt(4, dv.getCodigoVenta());
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    // BUSCAR POR CÓDIGO
    public DetalleVenta listarPorCodigoDetalle(int id) {
        DetalleVenta dv = new DetalleVenta();
        String sql = "select * from DetalleVenta where codigoDetalleVenta = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                dv.setCodigoDetalleVenta(rs.getInt(1));
                dv.setCantidad(rs.getInt(2));
                dv.setPrecioVenta(rs.getDouble(3));
                dv.setCodigoVehiculo(rs.getInt(4));
                dv.setCodigoVenta(rs.getInt(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dv;
    }

    // ACTUALIZAR
    public int actualizar(DetalleVenta dv) {
        String sql = "update DetalleVenta set cantidad = ?, precioVenta = ? where codigoDetalleVenta = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, dv.getCantidad());
            ps.setDouble(2, dv.getPrecioVenta());
            ps.setInt(3, dv.getCodigoDetalleVenta());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    // ELIMINAR
    public void eliminar(int id) {
        String sql = "delete from DetalleVenta where codigoDetalleVenta = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

