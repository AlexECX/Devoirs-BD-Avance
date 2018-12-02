/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app;


import courtier.CourtierBDFilm;
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
import courtier.CourtierBDPret;
import courtier.CourtierBDUtilisateur;
import courtier.SearchFilter;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Valentin
 */
public class FilmLocation extends HttpServlet {
    
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
            out.println("<h1>Servlet FilmLocation at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        RequestDispatcher view = request.getRequestDispatcher("Louer.html");
        view.forward(request, response);
    }
    
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
            chaineRecherche = request.getParameter("idFilm");
            Vector<SearchFilter> filters = new Vector<>();
            if (chaineRecherche.compareTo("") != 0)
                filters.addElement(new SearchFilter(2, chaineRecherche));
            CourtierBDPret cf = new CourtierBDPret(conn);
            HttpSession session = request.getSession(false);
            Object userId = session.getAttribute("idUser");
            int userIdTest = (int) userId;
            Boolean rs = cf.louerFilm(Integer.parseInt(chaineRecherche), userIdTest);
            //ps.setString(1,"%" + chaineRecherche + "%");
            // Decoder les resultats
            if(rs == true)
            {
                response.sendRedirect("LouerOuRechercher.html");   
            }
            else 
            {

                response.setContentType("text/html;charset=UTF-8");
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet FilmLocation</title>");            
                out.println("</head>");
                out.println("<body>");
                out.println("<p>Cet id de film n'existe pas</p>");
                out.println("</body>");
                out.println("</html>");
            }
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
    
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
}
