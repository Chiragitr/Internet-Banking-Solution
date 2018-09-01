/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.lang.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.UUID;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author USER
 */
@WebServlet(urlPatterns = {"/Update"})
public class Update extends HttpServlet {

   RequestDispatcher rd;
   
   // private String a_num;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection con = null;
        PrintWriter out =response.getWriter();
        int bal1 = 0,bal2 = 0;
        
        Logindb up = new Logindb();
        
        try {
           
            
            con = GetConnection.getconnection();
            String T_Id = request.getParameter("Tid");
            String name = request.getParameter("abc");
            String F_acc_number = request.getParameter("F_A/C_number");
            String T_acc_number = request.getParameter("T_A/C_number");
            String amount = request.getParameter("Amount");
            //if(up.acc_related(name,F_acc_number))
            if(up.acc_related(name,F_acc_number,T_Id))
            {
           // System.out.println("F_acc_number"+F_acc_number+"");
            System.out.println("line 48");
            String sql1="select * from Accounts where ano='"+F_acc_number+"'";
            String sql2="select * from Accounts where ano='"+T_acc_number+"'";
            System.out.println("line 51");
            Statement stmt1=con.createStatement();
            System.out.println("line 52");
            ResultSet rs1;
            rs1 = stmt1.executeQuery(sql1);
            while(rs1.next())
            {
            bal1 =rs1.getInt(4);
            }
            Statement stmt2=con.createStatement();
            ResultSet rs2 = stmt2.executeQuery(sql2);
            //rs2.next();
            while(rs2.next())
            {
            bal2 =rs2.getInt(4);
            }
            System.out.println("f_bal1:"+bal1+"\nt_bal2:"+bal2);
            
            //rs1 = stmt1.executeQuery(sql2);
           //int bal2 = rs1.getInt(3);
            System.out.println("line 56");
            try{
            int amo = Integer.parseInt(amount);
            bal1=bal1-amo;
            if(bal1>=500)//min balance
            {
            bal2=bal2+amo;
            System.out.println("amount:"+amo);
            System.out.println("bal1:"+bal1);
            System.out.println("bal2:"+bal2);
            String sql3="update Accounts set avbal='"+bal1+"'where ano='"+F_acc_number+"'";
            String sql4= "update Accounts set avbal='"+bal2+"'where ano='"+T_acc_number+"'"; 
            //Statement stmt3=con.createStatement();
            int r1 = stmt1.executeUpdate(sql3);
            //Statement stmt4=con.createStatement();
            int r2 = stmt1.executeUpdate(sql4);
            System.out.println("r1:"+r1+"r2:"+r2);
            //insert into transactions
            Statement stmt7=con.createStatement();
            String sql7="insert into Transactions(Fromacno,Toacno,Amount,Date) values('"+F_acc_number+"','"+T_acc_number+"','"+amo+"',curdate())";
            stmt7.executeUpdate(sql7);
            System.out.println("inserted into transactions table");
            //out.print("tranfered");
            response.sendRedirect("Transsuccess.jsp");
            con.close();
            }
            else
               {
                //out.println("Not transferred");
                response.sendRedirect("Trans_fail.jsp");
               }
            }
            catch (Exception e)
            {
                //System.out.println("NumberFormatException: " + nfe.getMessage());
                e.printStackTrace();
                System.out.println("exception andar wala");
            }
            
           
            }
            else
            {
                out.println("Not transferred");
            }
             //response.sendRedirect("transferredpage.jsp");
        }

        catch(Exception e)
        {
            e.printStackTrace();
            System.out.println("exception");
        }    
    
//method

    }

//    private PrintWriter getWriter() {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }

   
        
    }




