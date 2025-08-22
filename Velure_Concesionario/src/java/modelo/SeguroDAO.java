    package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

public class SeguroDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    // LISTAR
    public List<Seguro> listar() {
        String sql = "SELECT * FROM Seguros"; // Asegúrate de que el nombre de tu tabla sea este
        List<Seguro> listaSeguro = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Seguro se = new Seguro();
                se.setCodigoSeguro(rs.getInt(1));
                se.setTipoCobertura(rs.getString(2));
                se.setDescripcion(rs.getString(3));
                se.setFechaInicio(rs.getDate(4));
                se.setFechaFin(rs.getDate(5));
                se.setCosto(rs.getDouble(6));
                 se.setCodigoVehiculo(rs.getInt(7));
                listaSeguro.add(se);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaSeguro;
    }

    // AGREGAR
    // AGREGAR
public int agregar(Seguro seg) {
    String sql = "INSERT INTO Seguros (tipoCobertura, descripcion, fechaInicio, fechaFin, costo, codigoVehiculo) "
               + "VALUES (?, ?, ?, ?, ?, ?)";

    try {
        con = cn.Conexion();
        ps = con.prepareStatement(sql);
        ps.setString(1, seg.getTipoCobertura());
        ps.setString(2, seg.getDescripcion());
        ps.setDate(3, seg.getFechaInicio());
        ps.setDate(4, seg.getFechaFin());
        ps.setDouble(5, seg.getCosto());
        ps.setInt(6, seg.getCodigoVehiculo()); // ✅ insertar vehículo
        resp = ps.executeUpdate();
    } catch (Exception e) {
        System.out.println("Error al agregar seguro: " + e.getMessage());
    }
    return resp;
}


    // BUSCAR POR CÓDIGO
    public Seguro listarCodigoSeguro(int id) {
        Seguro seg = new Seguro();
        String sql = "SELECT * FROM Seguros WHERE codigoSeguro = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                seg.setCodigoSeguro(rs.getInt(1));
                seg.setTipoCobertura(rs.getString(2));
                seg.setDescripcion(rs.getString(3));
                seg.setFechaInicio(rs.getDate(4));
                seg.setFechaFin(rs.getDate(5));
                seg.setCosto(rs.getDouble(6));
            }
        } catch (Exception e) {
            System.out.println("Error al buscar seguro: " + e.getMessage());
        }
        return seg;
    }

// ACTUALIZAR
public int actualizar(Seguro seg) {
    int resp = 0;
    String sql = "UPDATE Seguros SET tipoCobertura = ?, descripcion = ?, fechaInicio = ?, fechaFin = ?, costo = ? WHERE codigoSeguro = ?";
    try {
        con = cn.Conexion();
        ps = con.prepareStatement(sql);
        ps.setString(1, seg.getTipoCobertura());
        ps.setString(2, seg.getDescripcion());
        ps.setDate(3, seg.getFechaInicio());
        ps.setDate(4, seg.getFechaFin());
        ps.setDouble(5, seg.getCosto());
        ps.setInt(6, seg.getCodigoSeguro()); // ✅ importante
        resp = ps.executeUpdate();
    } catch (Exception e) {
        System.out.println("Error al actualizar seguro: " + e.getMessage());
    }
    return resp;
}


    // ELIMINAR
    public void eliminar(int id) {
        String sql = "delete from Seguros where codigoSeguro = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error al eliminar seguro: " + e.getMessage());
        }
    }
}
