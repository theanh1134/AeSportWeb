/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
public class UserRole {
    private int userID;
    private int roleID;

    public UserRole() {
    }

    public UserRole(int user_ID, int roleID) {
        this.userID = user_ID;
        this.roleID = roleID;
    }

    public int getUser_ID() {
        return userID;
    }

    public void setUser_ID(int user_ID) {
        this.userID = user_ID;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }
    
    
    
}
