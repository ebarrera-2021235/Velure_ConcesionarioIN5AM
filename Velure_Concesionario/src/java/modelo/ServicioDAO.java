package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;


public class ServicioDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    // MÉTODOS DEL CRUD

    // LISTAR
    public List<Servicio> listar() {
        String sql = "SELECT * FROM Servicios";
        List<Servicio> lista = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Servicio s = new Servicio();
                s.setCodigoServicio(rs.getInt(1));
                s.setNombreServicio(rs.getString(2));
                s.setDescripcion(rs.getString(3));
                s.setTipo(rs.getString(4));
                s.setFechaServicio(rs.getDate(5));
                s.setCodigoVehiculo(rs.getInt(6));
                lista.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    // AGREGAR
    public int agregar(Servicio s) {
        String sql = "insert into Servicios (nombreServicio, descripcion, tipo, fechaServicio, codigoVehiculo) values (?, ?, ?, ?, ?)";
        try {
            con = cn.Conexion();
            ps = con.prepareCall(sql);
            ps.setString(1, s.getNombreServicio());
            ps.setString(2, s.getDescripcion());
            ps.setString(3, s.getTipo());
            ps.setDate(4, s.getFechaServicio());
            ps.setInt(5, s.getCodigoVehiculo());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    // BUSCAR POR CÓDIGO
    public Servicio obtenerPorCodigo(int id) {
        Servicio s = new Servicio();
        String sql = "select * from Servicios where codigoServicio = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                s.setNombreServicio(rs.getString(2));
                s.setDescripcion(rs.getString(3));
                s.setTipo(rs.getString(4));
                s.setFechaServicio(rs.getDate(5));
                s.setCodigoVehiculo(rs.getInt(6));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    // ACTUALIZAR
    public int actualizar(Servicio s) {
        String sql = "update Servicios set nombreServicio = ?, descripcion = ?, tipo = ?, fechaServicio = ? where codigoServicio = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, s.getNombreServicio());
            ps.setString(2, s.getDescripcion());
            ps.setString(3, s.getTipo());
            ps.setDate(4, s.getFechaServicio());
            ps.setInt(5, s.getCodigoServicio());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    // ELIMINAR
    public void eliminar(int id) {
        String sql = "delete from Servicios where codigoServicio = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
