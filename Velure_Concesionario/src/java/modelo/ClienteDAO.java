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

public class ClienteDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    public Cliente validar(String nombresCliente, String telefonoCliente) {
        Cliente clien = new Cliente();
        String sql = "Select * from Clientes where nombresCliente = ? and telefonoCliente = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, nombresCliente);
            ps.setString(2, telefonoCliente);
            rs = ps.executeQuery();
            while (rs.next()) {
                clien.setCodigoCliente(rs.getInt(1));
                clien.setNombresCliente(rs.getString(2));
                clien.setDPICliente(rs.getString(3));
                clien.setDireccionCliente(rs.getString(4));
                clien.setEstado(rs.getString(5));
                clien.setTelefonoCliente(rs.getString(6));
                clien.setCorreoCliente(rs.getString(7));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return clien;
    }
    
    
    
    
    
}
