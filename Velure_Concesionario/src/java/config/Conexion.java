
package config;

import java.sql.Connection;
import java.sql.DriverManager;




public class Conexion {
    Connection conexion;
    
    public Connection Conexion(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/DBConcesionarioIN5AM?useSSL=false", "root", "admin");
//            conexion = DriverManager.getConnection("jdbc:mysql://localhost3306/DBConcesionarioIN5AM?useSSL=false", "root", "andree");
        }catch(Exception e){
            e.printStackTrace();
        }
        return conexion;
    }
}
