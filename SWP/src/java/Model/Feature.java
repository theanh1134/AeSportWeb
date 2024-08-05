/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class Feature {
    private int fu_ID;
    private String fu_Name;
    private String url;

    public Feature() {
    }

    public Feature(int fu_ID, String fu_Name, String url) {
        this.fu_ID = fu_ID;
        this.fu_Name = fu_Name;
        this.url = url;
    }

    public int getFu_ID() {
        return fu_ID;
    }

    public void setFu_ID(int fu_ID) {
        this.fu_ID = fu_ID;
    }

    public String getFu_Name() {
        return fu_Name;
    }

    public void setFu_Name(String fu_Name) {
        this.fu_Name = fu_Name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "Feature{" + "fu_ID=" + fu_ID + ", fu_Name=" + fu_Name + ", url=" + url + '}';
    }

    
    
}
