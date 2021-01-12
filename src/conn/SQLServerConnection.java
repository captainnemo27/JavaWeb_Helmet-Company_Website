package conn;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class SQLServerConnection {
    public static Connection initializeDatabase(String type)
            throws SQLException, ClassNotFoundException
    {
        String dbDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String dbURL = "jdbc:sqlserver://DESKTOP-LLHE0IC";
        // Database name to access
        String dbName = "HELMET_COMPANY";

        String dbUsername=null;

        if(type == "Admin"){
            dbUsername= "AdminUser";
        }
        else if (type=="LeaderTeam"){
            dbUsername="projectUser";
        }
        else if(type=="Emp")
        {
        dbUsername="EmpUser";
        }
        else{
            dbUsername="thangdao";
        }
            String dbPassword = "123";
        String connectionURL = dbURL + ";databaseName=" + dbName;
        Connection conn = null;
        try {
            Class.forName(dbDriver);
            conn = DriverManager.getConnection(connectionURL, dbUsername, dbPassword);
            System.out.println("connect successfully!");
        } catch (Exception ex) {
            System.out.println("connect failure!");
            ex.printStackTrace();
        }
        return conn;
    }
}
