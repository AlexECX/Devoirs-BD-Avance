/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app;

import courtier.CourtierBDFilm;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import movierental.Film;
import movierental.FilmActeur;
import movierental.Genre;
import movierental.NewHibernateUtil;
import movierental.PaysProduction;
import movierental.PersonnelFilm;
import movierental.Tournage;
import org.hibernate.Session;

/**
 *
 * @author alex1
 */
@WebServlet(name = "PersonnelFilmDetail", urlPatterns = {"/PersonnelFilmDetail"})
public class PersonnelFilmDetail extends HttpServlet {

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
            String pers_id = request.getParameter("pers_id");
            PersonnelFilm pers = null;
            if (pers_id != null){
                Session connH = NewHibernateUtil.getSessionFactory().openSession();
                CourtierBDFilm cf = new CourtierBDFilm(connH);
                pers = cf.persFilmDetail(Integer.parseInt(pers_id));
            }
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("</head>");
            out.println("<body>");
            if (pers != null){
                out.println("<tr><p>Prenom: "+ pers.getPrenom()+ "</p></tr>");
                out.println("<tr><p>Nom: "+pers.getNom()+"</p></tr>");
                out.println("<tr><p>Date Naissance: "+pers.getDateNaissance().toString()+"</p></tr>");
                out.println("<tr><p>Lieux Naissance: "+pers.getLieuNaissance()+"</p></tr>");
                out.println("<tr><p>Biographie: "+pers.getBiographie()+"</p></tr>");
            }
            out.println("</tbody>");
            out.println("</table>");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
