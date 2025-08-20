
package modelo;


public class Cliente {
    private int codigoCliente;
    private String nombresCliente;
    private String DPICliente;
    private String direccionCliente;
    private String estado;
    private String telefonoCliente;
    private String correoCliente;

    public Cliente() {
    }

    public Cliente(int codigoCliente, String nombresCliente, String DPICliente, String direccionCliente, String estado, String telefonoCliente, String correoCliente) {
        this.codigoCliente = codigoCliente;
        this.nombresCliente = nombresCliente;
        this.DPICliente = DPICliente;
        this.direccionCliente = direccionCliente;
        this.estado = estado;
        this.telefonoCliente = telefonoCliente;
        this.correoCliente = correoCliente;
    }
    
    
    
}
