/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.PrintWriter;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Timer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author USER
 */
@WebServlet(urlPatterns = {"/Login"})
public class Login extends HttpServlet {



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uname = request.getParameter("u_id");
        String pass = request.getParameter("u_password");
        //PrintWriter out = null;
       Logindb dao = new Logindb();
        try {
            boolean ab = dao.check(uname,pass);
            
            System.out.println(ab);
   // chron job of 5 sec         
    Timer timer = new Timer();
    cronjob crono = new cronjob();
    timer.scheduleAtFixedRate(crono, 0,60000);
            if(ab)//if(uname.equals("chirag") && pass.equals("151337"))
            {
                if(dao.lock(uname))
                {
                    System.out.println("ur account was not locked");
                HttpSession session = request.getSession();
                session.setAttribute("u_id",uname);
                session.setAttribute("u_password",pass);
                response.sendRedirect("firstpage.jsp");
            
                }
                else
                {
                   System.out.println("ur account was locked and i am cheking time");
                    /*if(dao.chekTime(uname))
                    {
                        HttpSession session = request.getSession();
                        session.setAttribute("u_id",uname);
                        session.setAttribute("u_password",pass);
                        response.sendRedirect("firstpage.jsp");
                    }
                    else
                    {*/
                    PrintWriter out;
                    out = response.getWriter();
                    //out.println("your account is locked please contact administrator ");
                    response.sendRedirect("AccLock.jsp");    
                    //}/*line no.52 to61,66saath he and sahi he mein cron job apply kar*/ 
               
                    
                }    
            }
            else
            {
                boolean f = dao.counter(uname);
                if(f)
                {
                PrintWriter out;
                out = response.getWriter();
                //out.println("You have tried 3 times so your account has been locked please contact administrator");
                response.sendRedirect("AccountLocked.jsp");
                }
                else
                {
                PrintWriter out;
                out = response.getWriter();
                //out.println("wrong password");
                response.sendRedirect("homepage.jsp");
                }
                }} catch (ClassNotFoundException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }



