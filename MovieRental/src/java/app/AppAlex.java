package app;

import courtier.CourtierBDFilm;
import courtier.SearchFilter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * AppAlex
 */
public class AppAlex {

    public static void main(String[] args) {
        try {
            //init
            Class.forName ("oracle.jdbc.driver.OracleDriver");
            
            Connection conn = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:XE",
                    "MAIN",
                    "main");
            Vector<SearchFilter> filters = new Vector<>();
            filters.addElement(new SearchFilter(1, "Intouchable"));
            CourtierBDFilm c = new CourtierBDFilm(conn);
            PreparedStatement query = c.compileFilter(filters);
            c.name(query);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AppAlex.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AppAlex.class.getName()).log(Level.SEVERE, null, ex);
        }

    
    }
}