package Biblioteca.util;




import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
*/
public class DbUtil {
    // private static DbUtil instance = null;

    private static DbUtil instance = new DbUtil();
    private Connection conexion;
    private Statement sentencia;
    //String BD = "asistencia";
    private final String url_base="jdbc:mysql://localhost/BIBLIOTECA_UNPA?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    String user = "root";
    String password = "t00r";
    //pass123
   // String url = url_base + servidor + ":" + puerto + "/" + BD;

    public DbUtil() {
        this.conexion = null;
        this.sentencia = null;
    }

    public static DbUtil getInstance() {
        //if (instance == null) {
        //instance = new DbUtil();
        //}
        return instance;
    }

    // Devuelve true si se creo correctamente la conexion a la base de datos
    private boolean createConexion() {
        boolean estado = false;
        System.out.println("paso 2");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("*** Creando conecciÃ³n***");
            conexion = DriverManager.getConnection(url_base, user, password);
            estado = true;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DbUtil.class.getName()).log(Level.SEVERE, null, ex);
        }catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println(ex);
        }
        return estado;
    }

    public Connection getConnection() {
        if (conexion == null) {
            System.out.println("paso 1");
            this.createConexion();

        }
        return conexion;
    }
}
