
package product.dao;

/**
 *
 * @author Jared
 */
import java.sql.Connection;

public abstract class DB {

    protected String URL = "jdbc:derby://localhost:1527/";
    protected String db = "database";
    protected String dbuser = "admin1";
    protected String dbpass = "admin";
    protected String driver = "org.apache.derby.jdbc.ClientDriver";
    protected Connection conn;
}
