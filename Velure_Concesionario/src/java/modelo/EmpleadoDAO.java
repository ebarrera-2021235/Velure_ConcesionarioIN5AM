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
                empleado.setTelefonoEmpleado(rs.getString("telefonoEmpleado"));
                empleado.setEstado(rs.getString("estado"));
                empleado.setCorreoEmpleado(rs.getString("correoEmpleado"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }

        return empleado;
    }

    // LISTAR
    public List<Empleado> listar() {
        String sql = "select * from Empleados";
        List<Empleado> listaEmpleado = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Empleado em = new Empleado();
                em.setCodigoEmpleado(rs.getInt("codigoEmpleado"));
                em.setDPIEmpleado(rs.getString("DPIEmpleado"));
                em.setNombresEmpleado(rs.getString("nombresEmpleado"));
                em.setTelefonoEmpleado(rs.getString("telefonoEmpleado"));
                em.setEstado(rs.getString("estado"));
                em.setCorreoEmpleado(rs.getString("correoEmpleado"));
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

        String sql = "insert into Empleados (DPIEmpleado, nombresEmpleado, telefonoEmpleado, estado, correoEmpleado) values (?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, emp.getDPIEmpleado());
            ps.setString(2, emp.getNombresEmpleado());
            ps.setString(3, emp.getTelefonoEmpleado());
            ps.setString(4, emp.getEstado());
            ps.setString(5, emp.getCorreoEmpleado());
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    // BUSCAR POR CODIGO
    public Empleado listarCodigoEmpleado(int id) {
        Empleado emp = new Empleado();
        String sql = "Select * from Empleados where codigoEmpleado =" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                emp.setDPIEmpleado(rs.getString("DPIEmpleado"));
                emp.setNombresEmpleado(rs.getString("nombresEmpleado"));
                emp.setTelefonoEmpleado(rs.getString("telefonoEmpleado"));
                emp.setEstado(rs.getString("estado"));
                emp.setCorreoEmpleado(rs.getString("correoEmpleado"));
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

        String sql = "Update Empleados set DPIEmpleado = ?, nombresEmpleado = ?, telefonoEmpleado = ?, estado = ?, correoEmpleado = ? where codigoEmpleado = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, emp.getDPIEmpleado());
            ps.setString(2, emp.getNombresEmpleado());
            ps.setString(3, emp.getTelefonoEmpleado());
            ps.setString(4, emp.getEstado());
            ps.setString(5, emp.getCorreoEmpleado());
            ps.setInt(6, emp.getCodigoEmpleado());
            resp = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    // ELIMINAR
    public void eliminar(int id) {
        String sql = "delete from Empleados where codigoEmpleado =" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
