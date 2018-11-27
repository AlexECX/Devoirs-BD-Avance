package courtier;

/**
 * SearchFilter
 */
public class SearchFilter {
    public Integer filter_id;
    public String choice = "";

    public SearchFilter(Integer filter_id, String choice){
        this.filter_id = filter_id;
        this.choice = choice;
    }
    
    public Integer getId(){
        return this.filter_id;
    }
    
    public String getChoice(){
        return this.choice;
    }
    
}