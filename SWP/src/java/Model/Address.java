/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Laptop K1
 */
public class Address {
    private int addressId;
    private String address;
    private int userId;

    public Address(int addressId, String address) {
        this.addressId = addressId;
        this.address = address;
    }

    public Address(int addressId, String address, int userId) {
        this.addressId = addressId;
        this.address = address;
        this.userId = userId;
    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

   
    
}
