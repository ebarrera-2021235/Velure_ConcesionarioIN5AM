package modelo;

/**
 * @author Estuardo Gómez
 */
public class Usuario {
    private int codigoUsuario;
    private String nombresUsuario;
    private String userName;
    private String contrasenia;
    private String correoUsuario;
    private int codigoEmpleado;
    private String imagen;
    private String DPIEmpleado;
    private String telefonoEmpleado;

    public Usuario() {
    }

    public Usuario(int codigoUsuario, String nombresUsuario, String userName, String contrasenia, String correoUsuario, int codigoEmpleado) {
        this.codigoUsuario = codigoUsuario;
        this.nombresUsuario = nombresUsuario;
        this.userName = userName;
        this.contrasenia = contrasenia;
        this.correoUsuario = correoUsuario;
        this.codigoEmpleado = codigoEmpleado;
    }

    public Usuario(int codigoUsuario, String nombresUsuario, String userName, String contrasenia, String correoUsuario, int codigoEmpleado, String DPIEmpleado, String telefonoEmpleado) {
        this.codigoUsuario = codigoUsuario;
        this.nombresUsuario = nombresUsuario;
        this.userName = userName;
        this.contrasenia = contrasenia;
        this.correoUsuario = correoUsuario;
        this.codigoEmpleado = codigoEmpleado;
        this.DPIEmpleado = DPIEmpleado;
        this.telefonoEmpleado = telefonoEmpleado;
    }

    public Usuario(int codigoUsuario, String nombresUsuario, String userName, String contrasenia, String correoUsuario, int codigoEmpleado, String imagen, String DPIEmpleado, String telefonoEmpleado) {
        this.codigoUsuario = codigoUsuario;
        this.nombresUsuario = nombresUsuario;
        this.userName = userName;
        this.contrasenia = contrasenia;
        this.correoUsuario = correoUsuario;
        this.codigoEmpleado = codigoEmpleado;
        this.imagen = imagen;
        this.DPIEmpleado = DPIEmpleado;
        this.telefonoEmpleado = telefonoEmpleado;
    }
    
    
    

    public int getCodigoUsuario() {
        return codigoUsuario;
    }

    public void setCodigoUsuario(int codigoUsuario) {
        this.codigoUsuario = codigoUsuario;
    }

    public String getNombresUsuario() {
        return nombresUsuario;
    }

    public void setNombresUsuario(String nombresUsuario) {
        this.nombresUsuario = nombresUsuario;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public String getCorreoUsuario() {
        return correoUsuario;
    }

    public void setCorreoUsuario(String correoUsuario) {
        this.correoUsuario = correoUsuario;
    }

    public int getCodigoEmpleado() {
        return codigoEmpleado;
    }

    public void setCodigoEmpleado(int codigoEmpleado) {
        this.codigoEmpleado = codigoEmpleado;
    }

    public String getDPIEmpleado() {
        return DPIEmpleado;
    }

    public void setDPIEmpleado(String DPIEmpleado) {
        this.DPIEmpleado = DPIEmpleado;
    }

    public String getTelefonoEmpleado() {
        return telefonoEmpleado;
    }

    public void setTelefonoEmpleado(String telefonoEmpleado) {
        this.telefonoEmpleado = telefonoEmpleado;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
    
    
}


