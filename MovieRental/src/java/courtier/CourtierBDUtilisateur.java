/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package courtier;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import movierental.Profile;
/**
 *
 * @author Valentin
 */

public class CourtierBDUtilisateur {
   
    private Connection connectionUser;
   
    public CourtierBDUtilisateur(Connection conn){
        this.connectionUser = conn;
    }

    public boolean isInt (String user)
    {
        try {
            int matriculeOrNot = Integer.parseInt(user);
            return true;
        }
        catch(NumberFormatException e)
        {
            return false;
        }
    }

    public int seConnecter (String user, String password) throws SQLException
    {
       if(user == "" || password == "")
       {
            System.out.println("Veuillez remplir les deux champs svp");
       }
       
       boolean matriculeOrNot = isInt(user);
       int idUser = 0;
       if(matriculeOrNot == false)
       {
            PreparedStatement userValid = connectionUser.prepareStatement("SELECT id, courriel, mot_de_passe FROM profile WHERE courriel ='" + user + "' AND mot_de_passe ='" + password + "'");
            ResultSet resultatUserValid = userValid.executeQuery();
            if(resultatUserValid.next())
            {
                 System.out.println("Vous êtes dorénavant connecté en tant que Client.");
                 idUser = resultatUserValid.getInt("id");
            }
       }
       else {
           PreparedStatement userValid = connectionUser.prepareStatement("SELECT id, matricule, mot_de_passe FROM profile, employe WHERE profile.id = employe.id AND matricule = '" + user + "' AND mot_de_passe ='" + password + "'");
            ResultSet resultatUserValid = userValid.executeQuery();
            if(resultatUserValid.next())
            {
                 System.out.println("Vous êtes dorénavant connecté en tant qu'Employe (il n'y à pas de fonctionnalité particulière pour un employé pour l'instant, vous avez donc les mêmes droits qu'un client.");
                 idUser = resultatUserValid.getInt("id");
            }
       }
       return idUser;
    }
}