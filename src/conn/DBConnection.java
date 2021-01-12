package conn;

import java.sql.Connection;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection(String type)
            throws ClassNotFoundException, SQLException{

        return SQLServerConnection.initializeDatabase(type);
    }
}
