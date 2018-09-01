/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.util.Date;
import java.sql.*;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author USER
 */
public class cronjob extends TimerTask {
    static final String DB_URL = "jdbc:mysql://localhost/new";
// Database credentials
    static final String USER = "root";
    static final String PASS1 = "root";

    @Override
    public void run() {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        //java.util.Date date;
        try{
        System.out.println("cron job updating automatically after 1 day if deployed on server");
        System.out.println("5 sec");
        //java.util. date;
        //Date date = new Date();
        //int d1 = date.getDate();
        //System.out.println(d1);
        //String sql = "select * from Checks_update";
        Class.forName("com.mysql.jdbc.Driver");
        Connection connn = DriverManager.getConnection(DB_URL,USER,PASS1);
        PreparedStatement stmt2;/*stmt,*/
        //stmt = connn.prepareStatement(sql);
        //stmt.setString(1, uname);
        //ResultSet rs = stmt.executeQuery();
        /*while(rs.next())
        {
        Timestamp ts1 = rs.getTimestamp("date");
        int datefromdb = ts1.getDate();
        System.out.println(datefromdb);
        int diff;
        if (datefromdb > d1) {
            diff = datefromdb - d1;
        } else {
            diff = d1 - datefromdb;
            System.out.println(diff);
        }*/
        if (true) {
            java.sql.Date date_null = null;
            System.out.println("date null is printed");
            int countt = 0;
            String s3 = "U";
            String sql2 = "update Checks_update set count=?,status=? where status=?";
            //update into db
            stmt2 = connn.prepareStatement(sql2);
            stmt2.setInt(1, countt);
            stmt2.setString(2, s3);
            stmt2.setString(3, "L");
            //stmt2.setString(4, uname);
            int rs2 = stmt2.executeUpdate();
            System.out.println("after 1 day");
            //return true;
        } else {
            System.out.println("inside else of 5sec");
            //return false;
        }
        //}//end while
        }//end try
        
        
        
        
        catch(Exception e)
        {
            e.printStackTrace();
        }
    
    
    
    
    
    
    }//end run
        
        
        
        
    } //end class
    
