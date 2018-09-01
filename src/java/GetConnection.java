import java.sql.Connection;
import java.sql.DriverManager;
public class GetConnection {
public static  Connection getconnection(){ 
                Connection con = null;
		try{        
			Class.forName("com.mysql.jdbc.Driver");         
			System.out.println("Driver Loaded...");		
                   }     
		catch(Exception e)     
		{       
			e.printStackTrace();    
		 }     
		try
                {
          		con =   DriverManager.getConnection("jdbc:mysql://localhost:3306/new","root","root");         
			System.out.println("Connection Established...");
                }     
		catch(Exception e)
		{        
			System.out.println("Connection not Established...");         
			e.printStackTrace();      
		}      
		
            return con;
	}
}