package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    // Validaciones básicas
    private boolean validarSoloNumeros(String valor) {
        return valor != null && valor.matches("\\d+");
    }

    private boolean validarSoloLetras(String valor) {
        return valor != null && valor.matches("[a-zA-ZáéíóúÁÉÍÓÚñÑ\\s]+");
    }

    private boolean validarEstado(String valor) {
        return valor != null && (valor.equals("1") || valor.equals("2"));
    }

    public Empleado validar(String correoEmpleado){
        Empleado empleado = new Empleado();
        String sql = "select * from Empleados where correoEmpleado = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, correoEmpleado);
            rs = ps.executeQuery();
            while(rs.next()){
                empleado.setCodigoEmpleado(rs.getInt("codigoEmpleado"));
                empleado.setNombresEmpleado(rs.getString("nombresEmpleado"));
                empleado.setDPIEmpleado(rs.getString("DPIEmpleado"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return empleado;
    }

    // LISTAR
    public List listar() {
        String sql = "select * from empleado";
        List<Empleado> listaEmpleado = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Empleado em = new Empleado();
                em.setCodigoEmpleado(rs.getInt(1));
                em.setDPIEmpleado(rs.getString(2));
                em.setNombresEmpleado(rs.getString(3));
                em.setTelefonoEmpleado(rs.getString(4));
                em.setEstado(rs.getString(5));
                em.setUsuario(rs.getString(6));
                listaEmpleado.add(em);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaEmpleado;
    }

    // AGREGAR
    public int agregar(Empleado emp) {
        if (!validarSoloNumeros(emp.getDPIEmpleado()) ||
            !validarSoloNumeros(emp.getTelefonoEmpleado()) ||
            !validarSoloLetras(emp.getNombresEmpleado()) ||
            !validarEstado(emp.getEstado())) {
            return 0; // No inserta si no pasa validación
        }

        String sql = "insert into Empleado (DPIEmpleado, nombresEmpleado, telefonoEmpleado, estado, usuario) values (?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, emp.getDPIEmpleado());
            ps.setString(2, emp.getNombresEmpleado());
            ps.setString(3, emp.getTelefonoEmpleado());
            ps.setString(4, emp.getEstado());
            ps.setString(5, emp.getUsuario());
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    // BUSCAR POR CODIGO
    public Empleado listarCodigoEmpleado(int id) {
        Empleado emp = new Empleado();
        String sql = "Select * from Empleado where codigoEmpleado =" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                emp.setCodigoEmpleado(rs.getInt(1));
                emp.setDPIEmpleado(rs.getString(2));
                emp.setNombresEmpleado(rs.getString(3));
                emp.setTelefonoEmpleado(rs.getString(4));
                emp.setEstado(rs.getString(5));
                emp.setUsuario(rs.getString(6));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return emp;
    }

    // ACTUALIZAR
    public int actualizar(Empleado emp) {
        if (!validarSoloNumeros(emp.getDPIEmpleado()) ||
            !validarSoloNumeros(emp.getTelefonoEmpleado()) ||
            !validarSoloLetras(emp.getNombresEmpleado()) ||
            !validarEstado(emp.getEstado())) {
            return 0;
        }

        String sql = "Update Empleado set DPIEmpleado = ?, nombresEmpleado = ?, telefonoEmpleado = ?, estado = ?, usuario = ? where codigoEmpleado = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, emp.getDPIEmpleado());
            ps.setString(2, emp.getNombresEmpleado());
            ps.setString(3, emp.getTelefonoEmpleado());
            ps.setString(4, emp.getEstado());
            ps.setString(5, emp.getUsuario());
            ps.setInt(6, emp.getCodigoEmpleado());
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    // ELIMINAR
    public void eliminar(int id) {
        String sql = "delete from empleado where codigoEmpleado =" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
