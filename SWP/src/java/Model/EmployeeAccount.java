/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DBContext.AdminDAO;
import java.sql.Date;

/**
 *
 * @author admin
 */
public class EmployeeAccount extends UserAccount{
    
    private int role;


    public EmployeeAccount(int role, int userId, String password, String userName, String fullName, String email, String phoneNumber, String img, String status, Date dateCreate) {
        super(userId, password, userName, fullName, email, phoneNumber, img, status, dateCreate);
        this.role = role;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
   
    public String getRoleName(){
        AdminDAO dao = new AdminDAO();
        
        return dao.getRoleNameByID(this.role);
    }
}
