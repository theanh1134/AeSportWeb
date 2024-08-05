/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class Size {
    private int size_ID;
    private String size_Name;
    private String size_Type;

    public Size() {
    }

    public Size(int size_ID, String size_Name, String size_Type) {
        this.size_ID = size_ID;
        this.size_Name = size_Name;
        this.size_Type = size_Type;
    }

    

    public int getSize_ID() {
        return size_ID;
    }

    public void setSize_ID(int size_ID) {
        this.size_ID = size_ID;
    }

    public String getSize_Name() {
        return size_Name;
    }

    public void setSize_Name(String size_Name) {
        this.size_Name = size_Name;
    }

    public String getSize_Type() {
        return size_Type;
    }

    public void setSize_Type(String size_Type) {
        this.size_Type = size_Type;
    }
    
    
    
    
}
