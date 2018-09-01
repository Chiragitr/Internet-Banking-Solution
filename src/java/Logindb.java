
//import java.beans.Statement;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author chirag
 */
public class Logindb {
    //String sql = "select * from users where user_name=? and password//localhost/bank";=?";
    static final String DB_URL = "jdbc:mysql://localhost/new";
// Database credentials
    static final String USER = "root";
    static final String PASS1 = "root";
    //Connection conn = null;
    //PreparedStatement stmt = null;
    
    public boolean check(String uname,String password) throws ClassNotFoundException
    {
        try
        {
            System.out.println("start");
             String sql = "select * from Users where user_id=? and user_password=?";
             System.out.println("start");
             Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL,USER,PASS1);
            PreparedStatement stmt;
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,uname);
            stmt.setString(2,password);
            ResultSet rs = stmt.executeQuery();
            while(rs.next())
            {
                System.out.println("inside while");
                return true;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        System.out.println("outside false");
             return false;
    }
        public boolean acc_related(String name, String F_acc_number,String T_Id) {
        try
        {
             System.out.println("start");
             String sql = "select * from Accounts where uid=? and ano=? and tpassword=?";
             System.out.println("start");
             Class.forName("com.mysql.jdbc.Driver");
            Connection connn = DriverManager.getConnection(DB_URL,USER,PASS1);
            PreparedStatement stmt;
            stmt = connn.prepareStatement(sql);
            stmt.setString(1,name);
            stmt.setString(2,F_acc_number);
            stmt.setString(3,T_Id);
            ResultSet rs = stmt.executeQuery();
            while(rs.next())
            {
                System.out.println("inside while");
                return true;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

             return false;
       //return true;
    } 

    boolean lock(String uname) throws ClassNotFoundException, SQLException 
    {
       //Statement statement = null;
       //ResultSet resultSet = null;
       System.out.println("inside lock");
      // statement = (Statement) connn.createStatement();
       String sql = "select * from Checks_update where usrid=?";
       Class.forName("com.mysql.jdbc.Driver");
            Connection connn = DriverManager.getConnection(DB_URL,USER,PASS1);
            PreparedStatement stmt,stmt2;
            stmt = connn.prepareStatement(sql);
            stmt.setString(1,uname);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            String s = rs.getString("status");
            if(s.equals("U"))
            {
               int countt=0;
                String sql2 = "update Checks_update set count=? where usrid=?";
                //update into db
                stmt2 = connn.prepareStatement(sql2);
            stmt2.setInt(1,countt);
            //stmt2.setString(2,s3);
            stmt2.setString(2,uname);
            int rs2 = stmt2.executeUpdate();
                return true;
            }
            else
                return false;
    }

    boolean counter(String uname) throws ClassNotFoundException, SQLException, ParseException {
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    System.out.println("inside counter");
      // statement = (Statement) connn.createStatement();
       String sql = "select * from Checks_update where usrid=?";
       Class.forName("com.mysql.jdbc.Driver");
            Connection connn = DriverManager.getConnection(DB_URL,USER,PASS1);
            PreparedStatement stmt,stmt1,stmt2,stmt5;
            stmt = connn.prepareStatement(sql);
            stmt.setString(1,uname);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            int countt = rs.getInt("count");
            int c1=countt+1;
            String sql1 = "update Checks_update set count=? where usrid=?";
            stmt1 = connn.prepareStatement(sql1);
            stmt1.setInt(1,c1);
            stmt1.setString(2,uname);
            int rs1 = stmt1.executeUpdate();
            String sql5 = "select * from Checks_update where usrid=?";
           stmt5 = connn.prepareStatement(sql);
            stmt5.setString(1,uname);
            ResultSet rs5 = stmt5.executeQuery();
            rs5.next();
            //int countt = rs.getInt("count");
            //rs1.next();
            int countt_update = rs5.getInt("count");
//UPDATE `new`.`Checks` SET `status`='L' WHERE `usrid`='151337';
            if(countt_update==3)
            {
                Date date = new Date();
                //DateFormat dformat=new SimpleDateFormat("dd-MM-yyyy");
                //Date dobj = dformat.parse(date1);
                String s3="L";
                countt=0;
    //            String sql2 = "update Checks set count=?,status=? where usrid=?";
                String sql2 = "update Checks_update set count=?,status=?,date=? where usrid=?";
                //update into db
                stmt2 = connn.prepareStatement(sql2);
            stmt2.setInt(1,countt);
            stmt2.setString(2,s3);
            stmt2.setObject(3,date);
            stmt2.setString(4,uname);
            int rs2 = stmt2.executeUpdate();
           // rs2.next();
            System.out.println("your account is locked");
            //System.exit(0);
                //PrintWriter out;
                //out = response.getWriter();
                return true;
            }

    return false;
    }

    boolean cah(String uid, String acnum) throws SQLException, ClassNotFoundException {
        System.out.println("inside cah");
        String sql = "select * from Accounts where uid=? and ano=?";
        Class.forName("com.mysql.jdbc.Driver");
        Connection connn = DriverManager.getConnection(DB_URL,USER,PASS1);
        PreparedStatement stmt;
        stmt = connn.prepareStatement(sql);
        stmt.setString(1,uid);
        stmt.setString(2,acnum);
        ResultSet rs = stmt.executeQuery();
        if(rs.next())
        {
            System.out.println("true cah");
            return true;
        }
        else
        {
            System.out.println("false cah");
            return false;
        }
    }

    boolean chekTime(String uname) throws SQLException, ClassNotFoundException {
            System.out.println("inside chektime");
        Date date = new Date();
        int d1 = date.getDate();
        System.out.println(d1);
        String sql = "select date from Checks_update where usrid=?";
        Class.forName("com.mysql.jdbc.Driver");
        Connection connn = DriverManager.getConnection(DB_URL,USER,PASS1);
        PreparedStatement stmt,stmt2;
        stmt = connn.prepareStatement(sql);
        stmt.setString(1,uname);
        ResultSet rs = stmt.executeQuery();
        rs.next();
        Timestamp ts1 = rs.getTimestamp("date");
        int datefromdb = ts1.getDate();
        System.out.println(datefromdb);
        int diff;
        if(datefromdb>d1)
            diff=datefromdb-d1;
        else
        {
            diff=d1-datefromdb;
            System.out.println(diff);
        }
        if(diff>=1)
        {
           java.sql.Date date_null = null;
           System.out.println("date null is printed");
            int countt=0;
            String s3="U";
            String sql2 = "update Checks_update set count=?,status=?,date=? where usrid=?";
                //update into db
            stmt2 = connn.prepareStatement(sql2);
            stmt2.setInt(1,countt);
            stmt2.setString(2,s3);
            stmt2.setDate(3,date_null);
            stmt2.setString(4,uname);
            int rs2 = stmt2.executeUpdate();
            System.out.println("after 1 day");
        return true;
        }
        else
        { System.out.println("inside else of date manipulation");
            return false;
        }
    }
    
    
}
