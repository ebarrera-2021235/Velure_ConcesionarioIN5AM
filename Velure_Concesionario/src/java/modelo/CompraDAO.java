    package modelo;

    import config.Conexion;
    import java.sql.Connection;
    import java.sql.PreparedStatement;
    import java.sql.ResultSet;
    import java.util.ArrayList;
    import java.util.List;

    public class CompraDAO {
        Conexion cn = new Conexion();
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        int resp;

        public Compra buscar(int codigoCompra){
            Compra comp = new Compra();
            String sql = "Select * from Compras where codigoCompra ="+codigoCompra;
            try {
                con = cn.Conexion();
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    comp.setFecha(rs.getDate(1));
                    comp.setTotal(rs.getDouble(2));
                    comp.setDescripcion(rs.getString(3));
                    comp.setEstado(rs.getString(4));
                    comp.setCodigoEmpleado(rs.getInt(5));
                }
            } catch (Exception e) {
            }
            return comp;
        }
        public List listarCompra(){
            String sql = "Select * from Compras";
            List<Compra> listaCompra = new ArrayList<>();
            try{
                con = cn.Conexion();
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while(rs.next()){
                    Compra comp = new Compra();
                    comp.setCodigoCompra(rs.getInt(1));
                    comp.setFecha(rs.getDate(2));
                    comp.setTotal(rs.getDouble(3));
                    comp.setDescripcion(rs.getString(4));
                    comp.setEstado(rs.getString(5));
                    comp.setCodigoEmpleado(rs.getInt(6));
                    listaCompra.add(comp);
                }
            }catch(Exception e){
                e.printStackTrace();
            }
            return listaCompra;
        }

         //AGREGAR
        public int agregar(Compra com){
            String sql = "insert into Compras (fecha, total, descripcion, estado, codigoEmpleado) values(?,?,?,?,?)";
            try{
                con = cn.Conexion();
                ps = con.prepareStatement(sql);
                ps.setDate(1, com.getFecha());
                ps.setDouble(2, com.getTotal());
                ps.setString(3, com.getDescripcion());
                ps.setString(4, com.getEstado());
                ps.setInt(5, com.getCodigoEmpleado());
                ps.executeUpdate();
            }catch(Exception e){
                e.printStackTrace();
            }
            return resp;
        }
        //ACTUALIZAR
        public int actualizar(Compra com){
            String sql = "Update Compras set fecha = ?, total = ?, descripcion = ?, estado = ?, codigoEmpleado = ? where codigoCompra = ?";
            try{
                con = cn.Conexion();
                ps = con.prepareStatement(sql);
                ps.setDate(1, com.getFecha());
                ps.setDouble(2, com.getTotal());
                ps.setString(3, com.getDescripcion());
                ps.setString(4, com.getEstado());
                ps.setInt(5, com.getCodigoEmpleado());
                ps.setInt(6, com.getCodigoCompra());
                ps.executeUpdate();
            }catch(Exception e){
                e.printStackTrace();
            }
            return resp; 
        }
     //ELIMINAR
        public void eliminar(int id){
            String sql = "Delete from compras where codigoCompra ="+id;
            try{
                con = cn.Conexion();
                ps = con.prepareStatement(sql);
                ps.executeUpdate();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }
