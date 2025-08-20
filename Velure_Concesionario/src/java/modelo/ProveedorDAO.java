/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import config.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProveedorDAO {
    Conexion cn = new Conexion();

    // Listar todos los proveedores
    public List<Proveedor> listar() {
        List<Proveedor> lista = new ArrayList<>();  // Lista vacía para guardar resultados
        String sql = "select * from Proveedores";   // Consulta SQL
        try (Connection con = cn.Conexion();        // Conexión a la BD
             PreparedStatement ps = con.prepareStatement(sql);  // Preparar consulta y Ejecutar consulta y obtener resultados
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {     // Recorrer los registros obtenidos
                Proveedor p = new Proveedor();
                p.setCodigoProveedor(rs.getInt("codigoProveedor"));
                p.setNombreProveedor(rs.getString("nombreProveedor"));
                p.setTelefonoProveedor(rs.getString("telefonoProveedor"));
                p.setDireccionProveedor(rs.getString("direccionProveedor"));
                p.setCorreoProveedor(rs.getString("correoProveedor"));
                lista.add(p);   // Agregar objeto a la lista
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;   // Retornar lista de proveedores
    }

    // Buscar proveedor por código
    public Proveedor listarCodigoProveedor(int id) {
        Proveedor p = null;
        String sql = "select * from Proveedores where codigoProveedor=?";
        try (Connection con = cn.Conexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
             ps.setInt(1, id);   // Reemplaza el "?" por el id recibido
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {    // Si existe un proveedor con ese código
                    p = new Proveedor();
                    p.setCodigoProveedor(rs.getInt("codigoProveedor"));
                    p.setNombreProveedor(rs.getString("nombreProveedor"));
                    p.setTelefonoProveedor(rs.getString("telefonoProveedor"));
                    p.setDireccionProveedor(rs.getString("direccionProveedor"));
                    p.setCorreoProveedor(rs.getString("correoProveedor"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return p;   // Retorna el proveedor encontrado o null si no existe
    }

    // Agregar proveedor
    public int agregar(Proveedor p) {
        int r = 0;  // Guarda cuántas filas fueron insertadas
        String sql = "insert into Proveedores(nombreProveedor, telefonoProveedor, direccionProveedor, correoProveedor) values(?,?,?,?)";
        try (Connection con = cn.Conexion();
            PreparedStatement ps = con.prepareStatement(sql)) {
            // Pasar valores del objeto a la consulta
            ps.setString(1, p.getNombreProveedor());
            ps.setString(2, p.getTelefonoProveedor());
            ps.setString(3, p.getDireccionProveedor());
            ps.setString(4, p.getCorreoProveedor());
            r = ps.executeUpdate(); // Ejecuta el insert
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;   // Retorna número de filas insertadas (0 o 1)
    }

    // Actualizar proveedor
    public int actualizar(Proveedor p) {
        int r = 0;
        String sql = "update Proveedores set nombreProveedor=?, telefonoProveedor=?, direccionProveedor=?, correoProveedor=? where codigoProveedor=?";
        try (Connection con = cn.Conexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            // Pasar valores del objeto a la consulta
            ps.setString(1, p.getNombreProveedor());
            ps.setString(2, p.getTelefonoProveedor());
            ps.setString(3, p.getDireccionProveedor());
            ps.setString(4, p.getCorreoProveedor());
            ps.setInt(5, p.getCodigoProveedor());
            r = ps.executeUpdate(); // Ejecuta el update
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r; // Retorna filas actualizadas
    }

    // Eliminar proveedor
    public boolean eliminar(int id) {
        String sql = "DELETE FROM Proveedores WHERE codigoProveedor=?";
        try (Connection con = cn.Conexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);   // Asignar id a eliminar
            int filas = ps.executeUpdate(); // Ejecutar delete
            return filas > 0;   // Retorna true si eliminó al menos 1 fila
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}