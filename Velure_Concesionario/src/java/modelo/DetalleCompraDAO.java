package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DetalleCompraDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    // VALIDAR
    public DetalleCompra validar(int codigoVehiculo, int codigoCompra){
        DetalleCompra detalleCompra = new DetalleCompra();
        String sql = "select * from DetalleCompra where codigoVehiculo = ? AND codigoCompra = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigoVehiculo);
            ps.setInt(2, codigoCompra);
            rs = ps.executeQuery();
            while (rs.next()) {
                detalleCompra.setCodigoDetalleCompra(rs.getInt("codigoDetalleCompra"));
                detalleCompra.setPrecioUnitario(rs.getDouble("precioUnitario"));
                detalleCompra.setCantidad(rs.getInt("cantidad"));
                detalleCompra.setCodigoVehiculo(rs.getInt("codigoVehiculo"));
                detalleCompra.setCodigoCompra(rs.getInt("codigoCompra"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return detalleCompra;
    }

    // LISTAR TODOS
    public List<DetalleCompra> listar() {
        String sql = "select * from DetalleCompra";
        List<DetalleCompra> listaDetalle = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetalleCompra dc = new DetalleCompra();
                dc.setCodigoDetalleCompra(rs.getInt(1));
                dc.setPrecioUnitario(rs.getDouble(2));
                dc.setCantidad(rs.getInt(3));
                dc.setCodigoVehiculo(rs.getInt(4));
                dc.setCodigoCompra(rs.getInt(5));
                listaDetalle.add(dc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaDetalle;
    }

    // AGREGAR
    public int agregar(DetalleCompra dc) {
        String sql = "insert into DetalleCompra (precioUnitario, cantidad, codigoVehiculo, codigoCompra) values (?, ?, ?, ?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setDouble(1, dc.getPrecioUnitario());
            ps.setInt(2, dc.getCantidad());
            ps.setInt(3, dc.getCodigoVehiculo());
            ps.setInt(4, dc.getCodigoCompra());
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    // BUSCAR POR CÓDIGO
    public DetalleCompra listarPorCodigoC(int id) {
        DetalleCompra dc = new DetalleCompra();
        String sql = "select * from DetalleCompra where codigoDetalleCompra = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                dc.setCodigoDetalleCompra(rs.getInt(1));
                dc.setPrecioUnitario(rs.getDouble(2));
                dc.setCantidad(rs.getInt(3));
                dc.setCodigoVehiculo(rs.getInt(4));
                dc.setCodigoCompra(rs.getInt(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dc;
    }

    // ACTUALIZAR
    public int actualizar(DetalleCompra dc) {
        String sql = "update DetalleCompra set precioUnitario = ?, cantidad = ? where codigoDetalleCompra = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setDouble(1, dc.getPrecioUnitario());
            ps.setInt(2, dc.getCantidad());
            ps.setInt(3, dc.getCodigoDetalleCompra());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    // ELIMINAR
    public void eliminar(int id) {
        String sql = "delete from DetalleCompra where codigoDetalleCompra = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
