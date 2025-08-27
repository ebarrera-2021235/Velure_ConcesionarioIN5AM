package modelo;

public class DetalleVenta {
    private int codigoDetalleVenta;
    private int cantidad;
    private double precioVenta;
    private int codigoVehiculo;
    private int codigoVenta;

    public DetalleVenta() {
    }

    public DetalleVenta(int codigoDetalleVenta, int cantidad, double precioVenta, int codigoVehiculo, int codigoVenta) {
        this.codigoDetalleVenta = codigoDetalleVenta;
        this.cantidad = cantidad;
        this.precioVenta = precioVenta;
        this.codigoVehiculo = codigoVehiculo;
        this.codigoVenta = codigoVenta;
    }

    public int getCodigoDetalleVenta() {
        return codigoDetalleVenta;
    }

    public void setCodigoDetalleVenta(int codigoDetalleVenta) {
        this.codigoDetalleVenta = codigoDetalleVenta;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(double precioVenta) {
        this.precioVenta = precioVenta;
    }

    public int getCodigoVehiculo() {
        return codigoVehiculo;
    }

    public void setCodigoVehiculo(int codigoVehiculo) {
        this.codigoVehiculo = codigoVehiculo;
    }

    public int getCodigoVenta() {
        return codigoVenta;
    }

    public void setCodigoVenta(int codigoVenta) {
        this.codigoVenta = codigoVenta;
    }
    
    
}