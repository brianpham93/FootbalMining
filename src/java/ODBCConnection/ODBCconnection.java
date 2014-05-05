/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ODBCConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author thang_000
 */
public class ODBCconnection {
    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        //ODBCProjectmanagement" is the name of connection in ODBC setting in Windows
        Connection con = DriverManager.getConnection("jdbc:odbc:ODBCFootballMining");
        return con;
    }
}
