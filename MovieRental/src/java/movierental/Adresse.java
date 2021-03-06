package movierental;
// Generated 2018-11-22 14:13:58 by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

/**
 * Adresse generated by hbm2java
 */
public class Adresse  implements java.io.Serializable {


     private BigDecimal id;
     private BigDecimal numCivique;
     private String rue;
     private String ville;
     private String province;
     private String codePostal;
     private Set membres = new HashSet(0);

    public Adresse() {
    }

	
    public Adresse(BigDecimal id, BigDecimal numCivique, String rue, String ville, String province, String codePostal) {
        this.id = id;
        this.numCivique = numCivique;
        this.rue = rue;
        this.ville = ville;
        this.province = province;
        this.codePostal = codePostal;
    }
    public Adresse(BigDecimal id, BigDecimal numCivique, String rue, String ville, String province, String codePostal, Set membres) {
       this.id = id;
       this.numCivique = numCivique;
       this.rue = rue;
       this.ville = ville;
       this.province = province;
       this.codePostal = codePostal;
       this.membres = membres;
    }
   
    public BigDecimal getId() {
        return this.id;
    }
    
    public void setId(BigDecimal id) {
        this.id = id;
    }
    public BigDecimal getNumCivique() {
        return this.numCivique;
    }
    
    public void setNumCivique(BigDecimal numCivique) {
        this.numCivique = numCivique;
    }
    public String getRue() {
        return this.rue;
    }
    
    public void setRue(String rue) {
        this.rue = rue;
    }
    public String getVille() {
        return this.ville;
    }
    
    public void setVille(String ville) {
        this.ville = ville;
    }
    public String getProvince() {
        return this.province;
    }
    
    public void setProvince(String province) {
        this.province = province;
    }
    public String getCodePostal() {
        return this.codePostal;
    }
    
    public void setCodePostal(String codePostal) {
        this.codePostal = codePostal;
    }
    public Set getMembres() {
        return this.membres;
    }
    
    public void setMembres(Set membres) {
        this.membres = membres;
    }




}


