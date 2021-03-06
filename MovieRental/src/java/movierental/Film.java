package movierental;
// Generated 2018-11-22 14:13:58 by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Film generated by hbm2java
 */
public class Film  implements java.io.Serializable {


     private BigDecimal id;
     private String titre;
     private String langueOriginale;
     private Date anneeSortie;
     private BigDecimal duree;
     private String resume;
     private Set filmCopies = new HashSet(0);
     private Tournage tournage;
     private Set genres = new HashSet(0);
     private Set paysProductions = new HashSet(0);

    public Film() {
    }

	
    public Film(BigDecimal id, String titre, String langueOriginale, Date anneeSortie, BigDecimal duree, String resume) {
        this.id = id;
        this.titre = titre;
        this.langueOriginale = langueOriginale;
        this.anneeSortie = anneeSortie;
        this.duree = duree;
        this.resume = resume;
    }
    public Film(BigDecimal id, String titre, String langueOriginale, Date anneeSortie, BigDecimal duree, String resume, Set filmCopies, Tournage tournage, Set genres, Set paysProductions) {
       this.id = id;
       this.titre = titre;
       this.langueOriginale = langueOriginale;
       this.anneeSortie = anneeSortie;
       this.duree = duree;
       this.resume = resume;
       this.filmCopies = filmCopies;
       this.tournage = tournage;
       this.genres = genres;
       this.paysProductions = paysProductions;
    }
   
    public BigDecimal getId() {
        return this.id;
    }
    
    public void setId(BigDecimal id) {
        this.id = id;
    }
    public String getTitre() {
        return this.titre;
    }
    
    public void setTitre(String titre) {
        this.titre = titre;
    }
    public String getLangueOriginale() {
        return this.langueOriginale;
    }
    
    public void setLangueOriginale(String langueOriginale) {
        this.langueOriginale = langueOriginale;
    }
    public Date getAnneeSortie() {
        return this.anneeSortie;
    }
    
    public void setAnneeSortie(Date anneeSortie) {
        this.anneeSortie = anneeSortie;
    }
    public BigDecimal getDuree() {
        return this.duree;
    }
    
    public void setDuree(BigDecimal duree) {
        this.duree = duree;
    }
    public String getResume() {
        return this.resume;
    }
    
    public void setResume(String resume) {
        this.resume = resume;
    }
    public Set getFilmCopies() {
        return this.filmCopies;
    }
    
    public void setFilmCopies(Set filmCopies) {
        this.filmCopies = filmCopies;
    }
    public Tournage getTournage() {
        return this.tournage;
    }
    
    public void setTournage(Tournage tournage) {
        this.tournage = tournage;
    }
    public Set getGenres() {
        return this.genres;
    }
    
    public void setGenres(Set genres) {
        this.genres = genres;
    }
    public Set getPaysProductions() {
        return this.paysProductions;
    }
    
    public void setPaysProductions(Set paysProductions) {
        this.paysProductions = paysProductions;
    }




}


