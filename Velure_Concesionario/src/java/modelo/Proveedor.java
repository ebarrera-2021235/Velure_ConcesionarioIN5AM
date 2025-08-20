/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author luisf
 */
public class Proveedor {
    // Atributos de la clase (columnas de la tabla Proveedores)
    private int codigoProveedor;
    private String nombreProveedor;
    private String telefonoProveedor;
    private String direccionProveedor;
    private String correoProveedor;

    // Constructor vacío (permite crear objetos sin datos iniciales)
    public Proveedor() {
    }

    // Constructor con parámetros (permite crear objetos con datos)
    public Proveedor(int codigoProveedor, String nombreProveedor, String telefonoProveedor, String direccionProveedor, String correoProveedor) {
        this.codigoProveedor = codigoProveedor;
        this.nombreProveedor = nombreProveedor;
        this.telefonoProveedor = telefonoProveedor;
        this.direccionProveedor = direccionProveedor;
        this.correoProveedor = correoProveedor;
    }

    // Métodos Getter y Setter
    // Sirven para obtener y modificar cada atributo
    public int getCodigoProveedor() {
        return codigoProveedor;
    }

    public void setCodigoProveedor(int codigoProveedor) {
        this.codigoProveedor = codigoProveedor;
    }

    public String getNombreProveedor() {
        return nombreProveedor;
    }

    public void setNombreProveedor(String nombreProveedor) {
        this.nombreProveedor = nombreProveedor;
    }

    public String getTelefonoProveedor() {
        return telefonoProveedor;
    }

    public void setTelefonoProveedor(String telefonoProveedor) {
        this.telefonoProveedor = telefonoProveedor;
    }

    public String getDireccionProveedor() {
        return direccionProveedor;
    }

    public void setDireccionProveedor(String direccionProveedor) {
        this.direccionProveedor = direccionProveedor;
    }

    public String getCorreoProveedor() {
        return correoProveedor;
    }

    public void setCorreoProveedor(String correoProveedor) {
        this.correoProveedor = correoProveedor;
    }
    
    
}

