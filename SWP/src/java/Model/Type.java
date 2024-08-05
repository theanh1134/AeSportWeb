/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class Type {
    private int type_ID;
    private String type_Name;
    private String category_ID;

    public Type() {
    }

    public Type(int type_ID, String type_Name, String category_ID) {
        this.type_ID = type_ID;
        this.type_Name = type_Name;
        this.category_ID = category_ID;
    }

    public int getType_ID() {
        return type_ID;
    }

    public void setType_ID(int type_ID) {
        this.type_ID = type_ID;
    }

    public String getType_Name() {
        return type_Name;
    }

    public void setType_Name(String type_Name) {
        this.type_Name = type_Name;
    }

    public String getCategory_ID() {
        return category_ID;
    }

    public void setCategory_ID(String category_ID) {
        this.category_ID = category_ID;
    }
    
    
}
