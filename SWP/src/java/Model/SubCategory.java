/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DBContext.AdminDAO;

/**
 *
 * @author admin
 */
public class SubCategory {
    private int subcategory_ID;
    private String subcategory_Name;
    private int category_ID;

    
    
    public SubCategory() {
    }

    public SubCategory(int subcategory_ID, String subcategory_Name, int category_ID) {
        this.subcategory_ID = subcategory_ID;
        this.subcategory_Name = subcategory_Name;
        this.category_ID = category_ID;
    }

    public int getSubcategory_ID() {
        return subcategory_ID;
    }

    public void setSubcategory_ID(int subcategory_ID) {
        this.subcategory_ID = subcategory_ID;
    }

    public String getSubcategory_Name() {
        return subcategory_Name;
    }

    public void setSubcategory_Name(String subcategory_Name) {
        this.subcategory_Name = subcategory_Name;
    }

    public int getCategory_ID() {
        return category_ID;
    }

    public void setCategory_ID(int category_ID) {
        this.category_ID = category_ID;
    }

    public String show() {
        AdminDAO dao = new AdminDAO();
        Category category = dao.getCategoryByID(category_ID);
        if (category == null) {
            return subcategory_Name + ", Category not found";
        }
        return subcategory_Name + ", " + category.getCategory_Name() +" "+ category.getType();
    }
    
    
    
}
