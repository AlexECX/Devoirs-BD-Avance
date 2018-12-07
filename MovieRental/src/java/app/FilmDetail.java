/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app;

import courtier.CourtierBDFilm;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "FilmDetail", urlPatterns = {"/FilmDetail"})
public class FilmDetail extends HttpServlet {

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
            String film_id = request.getParameter("film_id");
            Film film = null;
            Tournage tournage = null;
            if (film_id != null){
                Session connH = NewHibernateUtil.getSessionFactory().openSession();
                CourtierBDFilm cf = new CourtierBDFilm(connH);
                film = cf.filmDetail(Integer.parseInt(film_id));
                tournage = film.getTournage();
                int o = 0;
            }
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("</head>");
            out.println("<body>");
            out.println("<table>");
            out.println("<tbody>");
            if (film != null){
                out.println("<p>Titre: "+ film.getTitre()+ "</p>");
                out.println("<p>Langue original: "+film.getLangueOriginale()+"</p>");
                out.println("<p>Année Parution: "+film.getAnneeSortie().toString().substring(0,4)+"</p>");
                out.println("<p>Durée: "+film.getDuree()+" minutes</p>");
                out.println("<p>Résumé: "+film.getResume()+"</p>");
                out.println("<p>Pays Production: ");
                for (Object pays : film.getPaysProductions()) {
                    out.println("<tb>"+((PaysProduction)pays).getNom()+"</tb>");
                }
                out.println("</p>");
                out.println("<p>Genres: ");
                for (Object genre : film.getGenres()) {
                    out.println("<tb>"+((Genre)genre).getNom()+" </tb>");
                }
                out.println("</p>");
                PersonnelFilm pers = tournage.getRealisateur().getPersonnelFilm();
                out.println("<p>Réalisateur: <a href=\"PersonnelFilmDetail?pers_id="+pers.getId()+"\">"
                        + pers.getPrenom()+" "+pers.getNom() + "</a>");
                out.println("</p>");
                out.println("<p>Acteurs: ");
                for (Object acteur : tournage.getFilmActeurs()) {
                    pers = ((FilmActeur)acteur).getActeur().getPersonnelFilm();
                    out.println("<a href=\"PersonnelFilmDetail?pers_id="+pers.getId()+"\">"
                            + pers.getPrenom()+" "+pers.getNom() + "</a>");
                }
                out.println("</p>");
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
