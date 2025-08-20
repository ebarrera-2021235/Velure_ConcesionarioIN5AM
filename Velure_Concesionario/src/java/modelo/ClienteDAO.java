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
    
    //LISTAR
    public List listarCliente() {
        String sql = "Select * from Clientes";
        List<Cliente> listaCliente = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cliente clie = new Cliente();
                clie.setCodigoCliente(rs.getInt(1));
                clie.setNombresCliente(rs.getString(2));
                clie.setDPICliente(rs.getString(3));
                clie.setDireccionCliente(rs.getString(4));
                clie.setEstado(rs.getString(5));
                clie.setTelefonoCliente(rs.getString(6));
                clie.setCorreoCliente(rs.getString(7));
                listaCliente.add(clie);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listaCliente;
    }
    
    //AGREGAR
    public int agregarCliente(Cliente cli) {
        String sql = "insert into Clientes (nombresCliente, DPICliente, direccionCliente, estado, telefonoCliente, correoCliente) values (?,?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cli.getNombresCliente());
            ps.setString(2, cli.getDPICliente());
            ps.setString(3, cli.getDireccionCliente());
            ps.setString(4, cli.getEstado());
            ps.setString(5, cli.getTelefonoCliente());
            ps.setString(6, cli.getCorreoCliente());
            resp = ps.executeUpdate(); 

        } catch (Exception e) {
            e.printStackTrace();
        }

        return resp;
    }
    
    //BUSCAR POR CÓDIGO
    public Cliente listarCodigoCliente(int id) {
        Cliente cli = new Cliente();
        String sql = "Select * from Clientes where codigoCliente =" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                cli.setCodigoCliente(rs.getInt(1));
                cli.setNombresCliente(rs.getString(2));
                cli.setDPICliente(rs.getString(3));
                cli.setDireccionCliente(rs.getString(4));
                cli.setEstado(rs.getString(5));
                cli.setTelefonoCliente(rs.getString(6));
                cli.setCorreoCliente(rs.getString(7));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return cli;
    }
    
     //ACTUALIZAR 
    public int actualizar(Cliente cli){
        String sql = "Update Clientes set nombresCliente=?, DPICliente=?, direccionCliente=?, estado=?, telefonoCliente=?, correoCliente=? WHERE codigoCliente=?";

        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cli.getNombresCliente());
            ps.setString(2, cli.getDPICliente());
            ps.setString(3, cli.getDireccionCliente());
            ps.setString(4, cli.getEstado());
            ps.setString(5, cli.getTelefonoCliente());
            ps.setString(6, cli.getCorreoCliente());
            ps.setInt(7, cli.getCodigoCliente());
            resp = ps.executeUpdate(); // Se corrige la asignación del valor de retorno
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return resp;
    }
    
    
    
    
    
}
