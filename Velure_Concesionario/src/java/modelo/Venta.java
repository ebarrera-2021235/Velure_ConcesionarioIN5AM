/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.Date;

/**
 *
 * Programador: Edgar Roberto Catalán Méndez
 * Carné: 2024133
 * Código Técnico: IN5AM
 * 
 */
public class Venta {
    private int codigoVenta;
    private Date fecha;
    private double total;
    private String descripcion;
    private String tipoDePago;
    private int codigoCliente;
    private int codigoEmpleado;

    public Venta() {
    }

    public Venta(int codigoVenta, Date fecha, double total, String descripcion, String tipoDePago, int codigoCliente, int codigoEmpleado) {
        this.codigoVenta = codigoVenta;
        this.fecha = fecha;
        this.total = total;
        this.descripcion = descripcion;
        this.tipoDePago = tipoDePago;
        this.codigoCliente = codigoCliente;
        this.codigoEmpleado = codigoEmpleado;
    }
    
    
}
