/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import entity.product;
import java.util.ArrayList;

/**
 *
 * @author Hoàng Sơn
 */
public class SubCategory {

    private int Subcategory_ID;
    private String Subcategory_Name;
    private ArrayList<product> products;

    public SubCategory() {
    }

    public int getSubcategory_ID() {
        return Subcategory_ID;
    }

    public void setSubcategory_ID(int Subcategory_ID) {
        this.Subcategory_ID = Subcategory_ID;
    }

    public String getSubcategory_Name() {
        return Subcategory_Name;
    }

    public void setSubcategory_Name(String Subcategory_Name) {
        this.Subcategory_Name = Subcategory_Name;
    }

    public ArrayList<product> getProducts() {
        return products;
    }

    public void setProducts(ArrayList<product> products) {
        this.products = products;
    }

}
