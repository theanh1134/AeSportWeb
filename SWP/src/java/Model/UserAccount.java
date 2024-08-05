/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author admin
 */
import java.sql.*;
public class UserAccount {

   private int use_ID;
    private String address;
    private String password;
    private String userName;
    private String full_Name;
    private String email;
    private String phone_number;
    private String img;
    private String status;
    private Date dateCreate;

    public UserAccount() {
    }
    public UserAccount(int use_ID, String password, String userName, String full_Name, String email, String phone_number, String img, String status, Date dateCreate) {
        this.use_ID = use_ID;
        this.password = password;
        this.userName = userName;
        this.full_Name = full_Name;
        this.email = email;
        this.phone_number = phone_number;
        this.img = img;
        this.status = status;
        this.dateCreate = dateCreate;
    }
    public UserAccount(int use_ID, String password, String userName, String full_Name, String email, String phone_number, String img) {
        this.use_ID = use_ID;
        this.password = password;
        this.userName = userName;
        this.full_Name = full_Name;
        this.email = email;
        this.phone_number = phone_number;
        this.img = img;
    }

    
     public UserAccount( String password, String userName, String full_Name, String email, String phone_number, String img, String status, Date dateCreate) {    
        this.password = password;
        this.userName = userName;
        this.full_Name = full_Name;
        this.email = email;
        this.phone_number = phone_number;
        this.img = img;
        this.status = status;
        this.dateCreate = dateCreate;
    }

//    public UserAccount(int use_ID, String address, String password, String userName, String full_Name, String email, String phone_number) {
//        this.use_ID = use_ID;
//        this.address = address;
//        this.password = password;
//        this.userName = userName;
//        this.full_Name = full_Name;
//        this.email = email;
//        this.phone_number = phone_number;
//    }

    public UserAccount(int use_ID, String address, String full_Name, String email, String phone_number) {
        this.use_ID = use_ID;
        this.address = address;
        this.full_Name = full_Name;
        this.email = email;
        this.phone_number = phone_number;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }
    

    public UserAccount(String address, String userName, String pass, String full_Name, String email, String phone_number) {
        this.address = address;
        this.userName = userName;
        this.full_Name = full_Name;
        this.email = email;
        this.phone_number = phone_number;
        this.password = pass;
    }

    public int getUse_ID() {
        return use_ID;
    }

    public void setUse_ID(int use_ID) {
        this.use_ID = use_ID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFull_Name() {
        return full_Name;
    }

    public void setFull_Name(String full_Name) {
        this.full_Name = full_Name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    @Override
    public String toString() {
        return "UserUserAccount{" + "use_ID=" + use_ID + ", address=" + address + ", userName=" + userName + ", password=" + password + ", full_Name=" + full_Name + ", email=" + email + ", phone_number=" + phone_number + '}';
    }
}