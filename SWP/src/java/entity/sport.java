/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Hoàng Sơn
 */
public class sport {
       private int sport_Id;
       private String sport_Name;
       private String clb_Name;

    public sport() {
    }

    public sport(int sport_Id, String sport_Name, String clb_Name) {
        this.sport_Id = sport_Id;
        this.sport_Name = sport_Name;
        this.clb_Name = clb_Name;
    }

      
    

    public int getSport_Id() {
        return sport_Id;
    }

    public void setSport_Id(int sport_Id) {
        this.sport_Id = sport_Id;
    }

    public String getSport_Name() {
        return sport_Name;
    }

    public void setSport_Name(String sport_Name) {
        this.sport_Name = sport_Name;
    }

    public String getClb_Name() {
        return clb_Name;
    }

    public void setClb_Name(String clb_Name) {
        this.clb_Name = clb_Name;
    }
    
    public String getNameAndClb(){
        return this.sport_Name+", CLB:"+this.clb_Name;
    }
}
