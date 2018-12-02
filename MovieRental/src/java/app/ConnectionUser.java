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
import courtier.CourtierBDUtilisateur;
import courtier.SearchFilter;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Valentin
 */
@WebServlet(name = "ConnectionUser", urlPatterns = {"/ConnectionUser"})
public class ConnectionUser extends HttpServlet {
    
    public int idUser;
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
            out.println("<title>Connection</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Connection at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        RequestDispatcher view = request.getRequestDispatcher("ConnectionUser.html");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = ""; 
        String password = ""; 
        Connection conn = null; 
        PreparedStatement ps = null;
        PrintWriter out = response.getWriter();
        try {
            Class.forName ("oracle.jdbc.driver.OracleDriver");
            
            conn = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:XE",
                    "MAIN",
                    "main");
            // Creer une requete au serveur BD
            user = request.getParameter("user");
            password = request.getParameter("password");
            CourtierBDUtilisateur connectionUser = new CourtierBDUtilisateur(conn);
            int rs = connectionUser.seConnecter(user, password);
            //ps.setString(1,"%" + chaineRecherche + "%");
            // Decoder les resultats
            
            if(rs != 0)
            {
                HttpSession session = request.getSession(true);
                session.setAttribute("idUser", rs);
                response.sendRedirect("LouerOuRechercher.html");
            }
            else
            {
                response.sendRedirect("ConnectionUser.html");
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
