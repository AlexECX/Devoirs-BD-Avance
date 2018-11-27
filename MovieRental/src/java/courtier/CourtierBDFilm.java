package courtier;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import movierental.Film;
import movierental.NewHibernateUtil;
import org.hibernate.Session;

/**
 * CourtierBDFilm
 */
public class CourtierBDFilm {
    private Connection uneConnection;
    private Vector<String> filters = new Vector<>();
    private String base_query = "SELECT * FROM film";
    // Constructeur pour connexion passée par le créateur
    public CourtierBDFilm(Connection laConnection){
        this.uneConnection = laConnection;
        this.filters.addElement("film.titre = ?");
        this.filters.addElement("film.annee_sortie > ? and film.annee_sortie < ? ");
        this.filters.addElement("film.id = film_pays_production.film_id " +
                                "AND film_pays_production.nom = pays_production.nom "+
                                "AND pays_production.nom = ? ");
        this.filters.addElement("film.langue_original = ? ");
        this.filters.addElement("film.id = film_genre.film_id " +
                                "AND film_genre.genre_nom = genre.nom "+
                                "AND genre.nom = ? ");
        this.filters.addElement("film.id = tournage.film_id " +
                                "AND tournage.realisateur_id = realisateur.id "+
                                "AND realisateur.id = personnel_film.id "+
                                "AND personnel_film.nom = ? ");
        this.filters.addElement("film.id = tournage.film_id " +
                                "AND tournage.film_id = film_acteur.film_id "+
                                "AND film_acteur.acteur_id = acteur.id "+
                                "AND acteur.id = personnel_film.id "+
                                "AND personnel_film.nom = ? ");
    }

    public String getInitialQuery() {
        return this.base_query;
    }

    public PreparedStatement compileFilter(Vector<SearchFilter> filters_list) throws SQLException {
        String query = this.getInitialQuery();
        if (filters_list.size() == 0) {
            return this.uneConnection.prepareStatement(query);
        }

        query = query.concat(" WHERE ");
        Collections.sort(filters_list, Comparator.comparing(SearchFilter::getId));
        
        Integer index = filters_list.get(0).filter_id;
        query = query.concat(this.filters.get(index));
        
        Integer prev = index;
        for (int i = 1; i < filters_list.size(); i++) {
            index = filters_list.get(i).filter_id;
            query = query.concat(this.filters.get(index));
            if (index == prev) {
                query = query.concat("OR ");
            }
            else{
                prev = index;
                query = query.concat("AND ");
            }
            
        }

        PreparedStatement statement = this.uneConnection.prepareStatement(query);

        for (int i = 0; i < filters_list.size(); i++) {            
            statement.setString(i+1, (filters_list.get(i)).getChoice());
        }
        return statement;
    }

    public ResultSet search(PreparedStatement filter) throws SQLException {
        return filter.executeQuery();
    }

    public void name(PreparedStatement statement) {
        Session uneSession = NewHibernateUtil.getSessionFactory().openSession();
        uneSession.beginTransaction();
        
        List lesFilms = uneSession.createQuery(statement.toString()).list();
        System.out.println( lesFilms.size() + " entées trouvés:" );
        for ( Iterator iterFilms = lesFilms.iterator(); iterFilms.hasNext(); ) {
            Film film = (Film) iterFilms.next();
            System.out.println("Film:" + film.getTitre());
        }
        uneSession.getTransaction().commit();
        uneSession.close();
    }


    
}
