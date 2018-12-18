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
import java.util.List;
import movierental.Film;
import movierental.NewHibernateUtil;
import movierental.PretCourant;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

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
    
    public List getAvailable(Film film, Session session)throws SQLException{
        Query query = session.createQuery("SELECT fc.id FROM PretCourant pc right join pc.filmCopie fc WHERE pc.id IS NULL AND fc.film.id = "+film.getId().toString());
        //PreparedStatement query = connectionUser.prepareStatement("SELECT * FROM film_copie, pret_courant WHERE film_copie.film_id = "+film.getId().toString()+" AND pret_courant.film_id != film_copie.film_id");
        return query.list();    

    }
}
