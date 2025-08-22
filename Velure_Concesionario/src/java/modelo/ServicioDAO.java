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
 * @author USUARIO
 */


public class ServiciosDAO {

    // LISTAR TODOS LOS SERVICIOS 
    public List<Servicios> listar() {
        List<Servicios> listaServicios = new ArrayList<>();
        String sql = "select * from servicios"; 
        
        try (Connection con = new Conexion().Conexion();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Servicios s = new Servicios();
                s.setCodigoServicio(rs.getInt("codigoServicio"));
                s.setNombreServicio(rs.getString("nombreServicio"));
                s.setDescripcion(rs.getString("descripcion"));
                s.setTipo(rs.getString("tipo"));
                s.setFechaServicio(rs.getDate("fechaServicio"));
                s.setCodigoVehiculo(rs.getInt("codigoVehiculo"));
                // agrega el objeto a la lista
                listaServicios.add(s); 
            }

        } catch (Exception e) {
            e.printStackTrace(); // imprime errores en consola
        }

       
        // devuelve la lista completa
        return listaServicios; 
    }

    // AGREGAR NUEVO SERVICIO 
    public int agregar(Servicios s) {
        int resp = 0;
        String sql = "insert into servicios (nombreServicio, descripcion, tipo, fechaServicio, codigoVehiculo) values (?,?,?,?,?)";

        try (Connection con = new Conexion().Conexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, s.getNombreServicio());
            ps.setString(2, s.getDescripcion());
            ps.setString(3, s.getTipo());
            ps.setDate(4, s.getFechaServicio());
            ps.setInt(5, s.getCodigoVehiculo());
             // ejecuta el insert
            resp = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        // devuelve filas afectadas
        return resp; 
    }

    // OBTENER SERVICIO POR CÓDIGO 
    public Servicios listarCodigoServicio(int id) {
        Servicios s = null;
        String sql = "select * from servicios where codigoServicio=?";

        try (Connection con = new Conexion().Conexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    s = new Servicios();
                    s.setCodigoServicio(rs.getInt("codigoServicio"));
                    s.setNombreServicio(rs.getString("nombreServicio"));
                    s.setDescripcion(rs.getString("descripcion"));
                    s.setTipo(rs.getString("tipo"));
                    s.setFechaServicio(rs.getDate("fechaServicio"));
                    s.setCodigoVehiculo(rs.getInt("codigoVehiculo"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        // devuelve el servicio encontrado o null
        return s; 
    }

    // ACTUALIZAR SERVICIO 
    public int actualizar(Servicios s) {
        int resp = 0;
        String sql = "update servicios set nombreServicio=?, descripcion=?, tipo=?, fechaServicio=?, codigoVehiculo=? where codigoServicio=?";

        try (Connection con = new Conexion().Conexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, s.getNombreServicio());
            ps.setString(2, s.getDescripcion());
            ps.setString(3, s.getTipo());
            ps.setDate(4, s.getFechaServicio());
            ps.setInt(5, s.getCodigoVehiculo());
            ps.setInt(6, s.getCodigoServicio());
        // ejecuta el update
            resp = ps.executeUpdate(); 

        } catch (Exception e) {
            e.printStackTrace();
        }
    // devuelve filas afectadas
        return resp; 
    }

    // ELIMINAR SERVICIO 
    public int eliminar(int id) {
        int resp = 0;
        String sql = "delete from servicios where codigoServicio=?";

        try (Connection con = new Conexion().Conexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            // ejecuta delete
            resp = ps.executeUpdate(); 

        } catch (Exception e) {
            e.printStackTrace();
        }
        // devuelve filas afectadas
        return resp; 
    }
}


