/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class Color {

    private int color_ID;
    private String color_Name;
    private String code;

    public Color(int color_ID, String color_Name, String code) {
        this.color_ID = color_ID;
        this.color_Name = color_Name;
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Color() {
    }

    public Color(int color_ID, String color_Name) {
        this.color_ID = color_ID;
        this.color_Name = color_Name;
    }

    public int getColor_ID() {
        return color_ID;
    }

    public void setColor_ID(int color_ID) {
        this.color_ID = color_ID;
    }

    public String getColor_Name() {
        return color_Name;
    }

    public void setColor_Name(String color_Name) {
        this.color_Name = color_Name;
    }

}
