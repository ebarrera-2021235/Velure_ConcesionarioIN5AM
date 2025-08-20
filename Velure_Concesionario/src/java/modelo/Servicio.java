package modelo;

import java.sql.Date;

public class Servicio {
    private int codigoServicio;
    private String nombreServicio;
    private String descripcion;
    private String tipo;
    private Date fechaServicio;
    private int codigoVehiculo;

    public Servicio() {
    }

    public Servicio(int codigoServicio, String nombreServicio, String descripcion, String tipo, Date fechaServicio, int codigoVehiculo) {
        this.codigoServicio = codigoServicio;
        this.nombreServicio = nombreServicio;
        this.descripcion = descripcion;
        this.tipo = tipo;
        this.fechaServicio = fechaServicio;
        this.codigoVehiculo = codigoVehiculo;
    }

    public int getCodigoServicio() {
        return codigoServicio;
    }

    public void setCodigoServicio(int codigoServicio) {
        this.codigoServicio = codigoServicio;
    }

    public String getNombreServicio() {
        return nombreServicio;
    }

    public void setNombreServicio(String nombreServicio) {
        this.nombreServicio = nombreServicio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Date getFechaServicio() {
        return fechaServicio;
    }

    public void setFechaServicio(Date fechaServicio) {
        this.fechaServicio = fechaServicio;
    }

    public int getCodigoVehiculo() {
        return codigoVehiculo;
    }

    public void setCodigoVehiculo(int codigoVehiculo) {
        this.codigoVehiculo = codigoVehiculo;
    }
}

