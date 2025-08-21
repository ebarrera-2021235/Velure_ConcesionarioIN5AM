package modelo;

public class DetalleCompra {
    private int codigoDetalleCompra;
    private double precioUnitario;
    private int cantidad;
    private int codigoVehiculo;
    private int codigoCompra;

    public DetalleCompra() {
    }

    public DetalleCompra(int codigoDetalleCompra, double precioUnitario, int cantidad, int codigoVehiculo, int codigoCompra) {
        this.codigoDetalleCompra = codigoDetalleCompra;
        this.precioUnitario = precioUnitario;
        this.cantidad = cantidad;
        this.codigoVehiculo = codigoVehiculo;
        this.codigoCompra = codigoCompra;
    }

    public int getCodigoDetalleCompra() {
        return codigoDetalleCompra;
    }

    public void setCodigoDetalleCompra(int codigoDetalleCompra) {
        this.codigoDetalleCompra = codigoDetalleCompra;
    }

    public double getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(double precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getCodigoVehiculo() {
        return codigoVehiculo;
    }

    public void setCodigoVehiculo(int codigoVehiculo) {
        this.codigoVehiculo = codigoVehiculo;
    }

    public int getCodigoCompra() {
        return codigoCompra;
    }

    public void setCodigoCompra(int codigoCompra) {
        this.codigoCompra = codigoCompra;
    }

    
    
}
