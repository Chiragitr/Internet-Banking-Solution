
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
@WebServlet(urlPatterns = {"/checkdb"})
public class checkdb extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            PrintWriter out;
            out = response.getWriter();
        try {
            //String usrr =  session.getAttribute("u_id").toString();
            //System.out.println("inside ");
            String uid = request.getParameter("abc");//fetch wala
            System.out.println("fetched from trans_his_form page"+uid);
            //String uid = request.getParameter("uiid");
            String acnum = request.getParameter("A/Cnumber");
            Logindb chekaccholder = new Logindb();
            if(chekaccholder.cah(uid,acnum))
            {
                HttpSession session = request.getSession();
                session.setAttribute("uiid",uid);
                session.setAttribute("A/Cnumber",acnum);
                response.sendRedirect("transferredpage.jsp");
            }
            else
            {
                System.out.println("This account number is not associated with your Userid");
                out.println("You Do Not Have Access to This Account");
            }
        } catch (SQLException ex) {
            Logger.getLogger(checkdb.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(checkdb.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
