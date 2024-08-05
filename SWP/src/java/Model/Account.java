/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Laptop K1
 */
public class Account {
      private int use_ID;
    private String address;
    private String password;
    private String userName;
    private String full_Name;
    private String email;
    private String phone_number;

    public Account() {
    }

    public Account(int use_ID, String address, String password, String userName, String full_Name, String email, String phone_number) {
        this.use_ID = use_ID;
        this.address = address;
        this.password = password;
        this.userName = userName;
        this.full_Name = full_Name;
        this.email = email;
        this.phone_number = phone_number;
    }

    public Account(int use_ID, String address, String full_Name, String email, String phone_number) {
        this.use_ID = use_ID;
        this.address = address;
        this.full_Name = full_Name;
        this.email = email;
        this.phone_number = phone_number;
    }

    public Account(String address, String userName, String pass, String full_Name, String email, String phone_number) {
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
        return "UserAccount{" + "use_ID=" + use_ID + ", address=" + address + ", userName=" + userName + ", password=" + password + ", full_Name=" + full_Name + ", email=" + email + ", phone_number=" + phone_number + '}';
    }

}


