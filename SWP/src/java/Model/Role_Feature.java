/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class Role_Feature {
    private int fuID;
    private int roleID;

    public Role_Feature() {
    }

    public Role_Feature(int fuID, int roleID) {
        this.fuID = fuID;
        this.roleID = roleID;
    }

    public int getFuID() {
        return fuID;
    }

    public void setFuID(int fuID) {
        this.fuID = fuID;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }
    
    
}
