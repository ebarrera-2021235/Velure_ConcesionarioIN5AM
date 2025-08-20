
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

    public int getCodigoCliente() {
        return codigoCliente;
    }

    public void setCodigoCliente(int codigoCliente) {
        this.codigoCliente = codigoCliente;
    }

    public String getNombresCliente() {
        return nombresCliente;
    }

    public void setNombresCliente(String nombresCliente) {
        this.nombresCliente = nombresCliente;
    }

    public String getDPICliente() {
        return DPICliente;
    }

    public void setDPICliente(String DPICliente) {
        this.DPICliente = DPICliente;
    }

    public String getDireccionCliente() {
        return direccionCliente;
    }

    public void setDireccionCliente(String direccionCliente) {
        this.direccionCliente = direccionCliente;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getTelefonoCliente() {
        return telefonoCliente;
    }

    public void setTelefonoCliente(String telefonoCliente) {
        this.telefonoCliente = telefonoCliente;
    }

    public String getCorreoCliente() {
        return correoCliente;
    }

    public void setCorreoCliente(String correoCliente) {
        this.correoCliente = correoCliente;
    }
    
    
    
    
}
