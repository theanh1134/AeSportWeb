/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class Gender {
    private int gender_ID;
    private String gender_Name;

    public Gender() {
    }

    public Gender(int gender_ID, String gender_Name) {
        this.gender_ID = gender_ID;
        this.gender_Name = gender_Name;
    }

    public int getGender_ID() {
        return gender_ID;
    }

    public void setGender_ID(int gender_ID) {
        this.gender_ID = gender_ID;
    }

    public String getGender_Name() {
        return gender_Name;
    }

    public void setGender_Name(String gender_Name) {
        this.gender_Name = gender_Name;
    }
    
    
}
