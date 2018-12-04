package courtier;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.Vector;

import movierental.Film;
import movierental.NewHibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 * CourtierBDFilm
 */
public class CourtierBDFilm {
    private Session uneSession;
    private Vector<String> filters = new Vector<>();
    private Vector<List<String>> tables = new Vector<>();

    // Constructeur pour connexion passée par le créateur
    public CourtierBDFilm(Session laConnection) {
        this.uneSession = laConnection;
        this.filters.addElement("film.titre = ':A'");
        this.filters.addElement("film.anneeSortie > to_date(':A', 'yyyy')");
        this.filters.addElement("film.anneeSortie < to_date(':A', 'yyyy')");
        this.filters.addElement("film.id = ppf.id " + "AND pays_production.nom = ':A'");
        this.filters.addElement("film.langueOriginal = ':A'");
        this.filters.addElement("film.id = gf.id " + "AND genre.nom = ':A'");
        this.filters.addElement("film.id = tournage.filmId " + "AND tournage.realisateur.id = personnel_film.id " 
                + "AND personnel_film.nom = ':A'");
        this.filters.addElement("film.id = tournage.filmId " + "AND tournage.filmId = film_acteur.id.filmId "
                + "AND film_acteur.id.acteurId = acteur.id " + "AND acteur.id = personnel_film.id " 
                + "AND personnel_film.nom = ':A'");

        this.tables.addElement(Arrays.asList());
        this.tables.addElement(Arrays.asList());
        this.tables.addElement(Arrays.asList());
        this.tables.addElement(
                Arrays.asList("PaysProduction pays_production", "pays_production.films ppf"));
        this.tables.addElement(Arrays.asList());
        this.tables.addElement(Arrays.asList("Genre genre, genre.films gf"));
        this.tables.addElement(Arrays.asList("Tournage tournage", "PersonnelFilm personnel_film"));
        this.tables.addElement(Arrays.asList("Tournage tournage", "tournage.filmActeurs film_acteur",
                "Acteur acteur", "PersonnelFilm personnel_film"));

    }

    public String getInitialQuery() {
        return "";
        // , film_pays_production, pays_production, "+ "film_genre, genre, tournage,
        // realisateur, film_acteur, acteur, personnel_film";
    }

    public Query compileFilter(Vector<SearchFilter> filters_list) throws SQLException {
        String query = this.getInitialQuery();
        // Session uneSession = NewHibernateUtil.getSessionFactory().openSession();
        if (filters_list.size() == 0) {
            return uneSession.createQuery(query);
        }

        Set<String> tables_needed = new LinkedHashSet<>();
        query = query.concat(" WHERE ");
        Collections.sort(filters_list, Comparator.comparing(SearchFilter::getId));

        Integer index = filters_list.get(0).getId();
        tables_needed.addAll(this.tables.get(index));
        query = query.concat(this.filters.get(index));
        // temporaire, le temps de faire fonctionner hibernate
        query = query.replaceAll(":A", filters_list.get(0).getChoice());

        Integer prev = index;
        for (int i = 1; i < filters_list.size(); i++) {
            index = filters_list.get(i).getId();
            if (index == prev) {
                query = query.concat(" OR ");
            } else {
                prev = index;
                tables_needed.addAll(this.tables.get(index));
                query = query.concat(" AND ");
            }
            query = query.concat(this.filters.get(index));
            // temporaire
            query = query.replaceAll(":A", filters_list.get(i).getChoice());

        }

        String query_tables = "FROM ";
        for (String table : tables_needed) {
            query_tables = query_tables + table + ", ";
        }
        query_tables = query_tables + "Film film";
        String test = "select film " + query_tables + query;
        Query statement = this.uneSession.createQuery(test);
        // utilisé quand les problemes hibernate seront réglé
        // for (int i = 0; i < filters_list.size(); i++) {
        // statement.setString(i, (filters_list.get(i)).getChoice());
        // }
        return statement;
    }

    public List search(Query filter) throws SQLException {
        return filter.list();
    }

    public void name(PreparedStatement statement) {
        Session uneSession = NewHibernateUtil.getSessionFactory().openSession();
        uneSession.beginTransaction();

        List lesFilms = uneSession.createQuery(statement.toString()).list();
        System.out.println(lesFilms.size() + " entées trouvés:" );
        for (Iterator iterFilms = lesFilms.iterator(); iterFilms.hasNext();) {
            Film film = (Film) iterFilms.next();
            System.out.println("Film:" + film.getTitre());
        }
        uneSession.getTransaction().commit();
        uneSession.close();
    }

}
