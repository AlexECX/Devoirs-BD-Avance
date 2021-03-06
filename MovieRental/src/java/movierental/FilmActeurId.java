package movierental;
// Generated 2018-11-22 14:13:58 by Hibernate Tools 4.3.1


import java.math.BigDecimal;

/**
 * FilmActeurId generated by hbm2java
 */
public class FilmActeurId  implements java.io.Serializable {


     private BigDecimal acteurId;
     private BigDecimal filmId;

    public FilmActeurId() {
    }

    public FilmActeurId(BigDecimal acteurId, BigDecimal filmId) {
       this.acteurId = acteurId;
       this.filmId = filmId;
    }
   
    public BigDecimal getActeurId() {
        return this.acteurId;
    }
    
    public void setActeurId(BigDecimal acteurId) {
        this.acteurId = acteurId;
    }
    public BigDecimal getFilmId() {
        return this.filmId;
    }
    
    public void setFilmId(BigDecimal filmId) {
        this.filmId = filmId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof FilmActeurId) ) return false;
		 FilmActeurId castOther = ( FilmActeurId ) other; 
         
		 return ( (this.getActeurId()==castOther.getActeurId()) || ( this.getActeurId()!=null && castOther.getActeurId()!=null && this.getActeurId().equals(castOther.getActeurId()) ) )
 && ( (this.getFilmId()==castOther.getFilmId()) || ( this.getFilmId()!=null && castOther.getFilmId()!=null && this.getFilmId().equals(castOther.getFilmId()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getActeurId() == null ? 0 : this.getActeurId().hashCode() );
         result = 37 * result + ( getFilmId() == null ? 0 : this.getFilmId().hashCode() );
         return result;
   }   


}


