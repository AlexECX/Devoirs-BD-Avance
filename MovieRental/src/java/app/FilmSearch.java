/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.io.StringWriter;
import java.sql.DriverManager;
import oracle.jdbc.pool.*; 
import javax.naming.Context;
import javax.naming.InitialContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;
import courtier.CourtierBDFilm;
import courtier.SearchFilter;
import java.util.List;
import movierental.Film;
import movierental.NewHibernateUtil;
import org.hibernate.Session;

/**
 *
 * @author alex1
 */
@WebServlet(name = "FilmSearch", urlPatterns = {"/FilmSearch"})
public class FilmSearch extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FilmSearch</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilmSearch at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        RequestDispatcher view = request.getRequestDispatcher("FormWebServlet.html");
        view.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String chaineRecherche = ""; 
        Connection conn = null; 
        PreparedStatement ps = null;
        PrintWriter out = response.getWriter();
        try {
        // Recuperer le parametre provenant de la page HTML d’entree chaineRecherche = requete.getParameter("chaineRecherche");

            // Ouvrir une connexion en passant par un DataSource
            //Context initContext = new InitialContext();
            //Context envContext = (Context) initContext.lookup("java:/comp/env"); 
            //OracleDataSource ds = (OracleDataSource) envContext.lookup("jdbc/webpvideo");
            //conn = ds.getConnection();
            Class.forName ("oracle.jdbc.driver.OracleDriver");
            
            conn = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:XE",
                    "MAIN",
                    "main");
            // Creer une requete au serveur BD
            chaineRecherche = request.getParameter("chaineRecherche");
            Vector<SearchFilter> filters = new Vector<>();
            
            Session connH = NewHibernateUtil.getSessionFactory().openSession();
            if (chaineRecherche.compareTo("") != 0)
                filters.addElement(new SearchFilter(2, chaineRecherche));
            CourtierBDFilm cf = new CourtierBDFilm(connH);
            List rs = cf.search(cf.compileFilter(filters));
            //ps.setString(1,"%" + chaineRecherche + "%");
            // Decoder les resultats
            
            response.setContentType("text/html;charset=UTF-8");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FilmSearch</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<p>Results:</p>");
            
            for (Object film : rs) {
                Film f = (Film)film;
                out.println(
                    "<p>"+f.getTitre()+" "+f.getAnneeSortie()+"</p>"
                );
            }
            out.println("</body>");
            out.println("</html>");
            
        }
        catch (Exception e) {
            // Debug: afficher la trace d’erreur directement dans la page
            StringWriter sw = new StringWriter(); 
            PrintWriter pw = new PrintWriter(sw); 
            e.printStackTrace(pw);
            
            out.println("<p>" + sw.toString() + "</p>");
        }
        finally{
            try{
                // Liberer les connections et resources 
                out.println("</body></html>"); 
                out.close();
                if (ps != null)
                    ps.close();
                if (conn != null)
                    conn.close();
            }
            catch(Exception lException){
                lException.printStackTrace();
            }
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
