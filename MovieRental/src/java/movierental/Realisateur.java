package movierental;
// Generated 2018-11-22 14:13:58 by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

/**
 * Realisateur generated by hbm2java
 */
public class Realisateur  implements java.io.Serializable {


     private BigDecimal id;
     private PersonnelFilm personnelFilm;
     private Set tournages = new HashSet(0);

    public Realisateur() {
    }

	
    public Realisateur(PersonnelFilm personnelFilm) {
        this.personnelFilm = personnelFilm;
    }
    public Realisateur(PersonnelFilm personnelFilm, Set tournages) {
       this.personnelFilm = personnelFilm;
       this.tournages = tournages;
    }
   
    public BigDecimal getId() {
        return this.id;
    }
    
    public void setId(BigDecimal id) {
        this.id = id;
    }
    public PersonnelFilm getPersonnelFilm() {
        return this.personnelFilm;
    }
    
    public void setPersonnelFilm(PersonnelFilm personnelFilm) {
        this.personnelFilm = personnelFilm;
    }
    public Set getTournages() {
        return this.tournages;
    }
    
    public void setTournages(Set tournages) {
        this.tournages = tournages;
    }




}

