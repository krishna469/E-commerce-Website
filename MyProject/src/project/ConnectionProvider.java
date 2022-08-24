package project;
import java.sql.*;
public class ConnectionProvider {
	
	public static Connection getCon(){
		Connection con=null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","root"); return con;
		}catch(Exception e){
			System.out.println(e);
			return null;
		}
	}
	
	public static void closeConnection(Connection con)throws SQLException{
		   if(con!=null){
						con.close();
		   }
		   
	   }

}
