
package modelo;


public class Vehiculo {
    private int codigoVehiculo;
        private String modelo;
        private String descripcion;
        private String marca;
        private String color;
        private int stock;
        private Double precio;
        private String anio;
        private int codigoProveedor;
        
        public Vehiculo() {
            
        }
        public Vehiculo(int codigoVehiculo, String modelo, String descripcion, String marca, String color, int stock, Double precio, String anio, int codigoProveedor) {
            this.codigoVehiculo = codigoVehiculo;
            this.modelo = modelo;
            this.descripcion = descripcion;
            this.marca = marca;
            this.color = color;
            this.stock = stock;
            this.precio = precio;
            this.anio = anio;
            this.codigoProveedor = codigoProveedor;
        }

        public int getCodigoVehiculo() {
            return codigoVehiculo;
        }

        public void setCodigoVehiculo(int codigoVehiculo) {
            this.codigoVehiculo = codigoVehiculo;
        }

        public String getModelo() {
            return modelo;
        }

        public void setModelo(String modelo) {
            this.modelo = modelo;
        }

        public String getDescripcion() {
            return descripcion;
        }

        public void setDescripcion(String descripcion) {
            this.descripcion = descripcion;
        }

        public String getMarca() {
            return marca;
        }

        public void setMarca(String marca) {
            this.marca = marca;
        }

        public String getColor() {
            return color;
        }

        public void setColor(String color) {
            this.color = color;
        }

        public int getStock() {
            return stock;
        }

        public void setStock(int stock) {
            this.stock = stock;
        }

        public Double getPrecio() {
            return precio;
        }

        public void setPrecio(Double precio) {
            this.precio = precio;
        }

        public String getAnio() {
            return anio;
        }

        public void setAnio(String anio) {
            this.anio = anio;
        }

        public int getCodigoProveedor() {
            return codigoProveedor;
        }

        public void setCodigoProveedor(int codigoProveedor) {
            this.codigoProveedor = codigoProveedor;
        }
}
