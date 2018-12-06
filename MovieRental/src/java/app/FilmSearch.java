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

import java.util.Date;
import java.io.StringWriter;
import java.sql.DriverManager;
import oracle.jdbc.pool.*; 
import javax.naming.Context;
import javax.naming.InitialContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;
import courtier.CourtierBDFilm;
import courtier.CourtierBDPret;
import courtier.SearchFilter;
import java.sql.Connection;
import java.util.List;
import javax.servlet.http.HttpSession;
import movierental.Film;
import movierental.NewHibernateUtil;
import movierental.PaysProduction;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

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
    private Vector<SearchFilter> searchFilters = new Vector<>();
    
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
        String choix = request.getParameter("choix");
        String tmp = request.getParameter("filtre");
        Integer filtre;
        if (tmp != null && choix != null){
            if (tmp.compareTo("1") == 0){
                String choix2 = request.getParameter("choix2");
                String tmp2 = request.getParameter("filtre2");
                if (choix2 != null && tmp2 != null){
                    filtre = Integer.parseInt(tmp);
                    this.searchFilters.addElement(new SearchFilter(filtre, choix));
                    filtre = Integer.parseInt(tmp2);
                    this.searchFilters.addElement(new SearchFilter(filtre, choix2));
                } 
            } else {
                filtre = Integer.parseInt(tmp);
                this.searchFilters.addElement(new SearchFilter(filtre, choix));
            }
        }
        
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
        PreparedStatement ps = null;
        PrintWriter out = response.getWriter();
        try {
            Vector<SearchFilter> filters = new Vector<>();
            filters.addAll(this.searchFilters);
            this.searchFilters.clear();
            
            Session connH = NewHibernateUtil.getSessionFactory().openSession();

            if (filters.isEmpty()){
                filters.addElement(new SearchFilter(0, ""));
            }
            Connection conn = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:XE",
                    "MAIN",
                    "main");
            CourtierBDFilm cf = new CourtierBDFilm(connH);
            List rs = cf.search(filters);
            CourtierBDPret cp = new CourtierBDPret(conn);

            
            response.setContentType("text/html;charset=UTF-8");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FilmSearch</title>");            
            out.println("</head>");
            out.println("<body>");
            if (rs.size() == 0){
                out.println("<p>Results: Aucune entrées</p>");
            } else {
                out.println("<p>Results: "+Integer.toString(rs.size())+ " entrées</p>");
                for (Object film : rs) {
                    Film f = (Film)film;
                    out.println();
                    out.println("<form action = \"FilmLocation\" method = \"post\">");
                    out.println("<table><tr><td>"
                            + "<p>"+f.getTitre()+" ("+f.getAnneeSortie().toString().substring(0, 4)+") </p>"
                            + "</td>");
                    List rp = cp.getAvailable(f, connH);
                    if (!rp.isEmpty()){
                        out.println("<td><input type = \"hidden\" name = \"idFilm\" value=\""+rp.get(0).toString()+"\"/></td>");
                        out.println("<td><input type = \"submit\" value = \"Louer\" /></td>");
                    }
                    
                    out.println("<td>Inventaire: "+Integer.toString(rp.size())+"</td>");
                    out.println("</tr></table>");
                    out.println("</form>");
                }
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
                //if (conn != null)
                //    conn.close();
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
