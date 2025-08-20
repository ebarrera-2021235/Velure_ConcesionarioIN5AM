package modelo;

import java.sql.Date;

public class Compra {
    private int codigoCompra;
    private Date fecha;
    private Double total;
    private String descripcion;
    private String estado;
    private int codigoEmpleado;

    public Compra() {
    }

    public Compra(int codigoCompra, Date fecha, Double total, String descripcion, String estado, int codigoEmpleado) {
        this.codigoCompra = codigoCompra;
        this.fecha = fecha;
        this.total = total;
        this.descripcion = descripcion;
        this.estado = estado;
        this.codigoEmpleado = codigoEmpleado;
    }

    public int getCodigoCompra() {
        return codigoCompra;
    }

    public void setCodigoCompra(int codigoCompra) {
        this.codigoCompra = codigoCompra;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getCodigoEmpleado() {
        return codigoEmpleado;
    }

    public void setCodigoEmpleado(int codigoEmpleado) {
        this.codigoEmpleado = codigoEmpleado;
    }
    
}
