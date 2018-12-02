/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package courtier;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import movierental.NewHibernateUtil;
import movierental.PretCourant;
import org.hibernate.Session;

/**
 *
 * @author Valentin
 */
public class CourtierBDPret {
    private Connection connectionUser;
   
    public CourtierBDPret(Connection conn){
        this.connectionUser = conn;
    }
    
    public boolean louerFilm(int idFilm, int idClient) throws SQLException{
        PreparedStatement dureeMax = connectionUser.prepareStatement("SELECT duree_max FROM forfait, membre WHERE membre.forfait_nom = forfait.nom AND membre.id =" + idClient);
        ResultSet resultatDureeMax = dureeMax.executeQuery();
        resultatDureeMax.next();
        int dureeAjoutee = resultatDureeMax.getInt("duree_max");
        PreparedStatement louerFilm = connectionUser.prepareStatement("INSERT INTO pret_courant(profile_id, film_id, date_pret, date_retour, etat_pret) VALUES (" + idClient + "," + idFilm + ", CURRENT_DATE, CURRENT_DATE +" + dureeAjoutee + ", 'prete')");
        louerFilm.executeUpdate();
        return true;
    }
}
