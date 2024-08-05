/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.*;

/**
 *
 * @author admin
 */
public class Discount {

    private int discount_ID;
    private int discount_Amount;
    private String discount_Name;
    private Date startDate;
    private Date endDate;

    public Discount() {
    }

    public Discount(int discount_ID, int discount_Amount) {
        this.discount_ID = discount_ID;
        this.discount_Amount = discount_Amount;
    }

    public Discount(int discount_ID, int discount_Amount, String discount_Name, Date startDate, Date endDate) {
        this.discount_ID = discount_ID;
        this.discount_Amount = discount_Amount;
        this.discount_Name = discount_Name;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public Discount(int discount_Amount, String discount_Name, Date startDate, Date endDate) {
        this.discount_Amount = discount_Amount;
        this.discount_Name = discount_Name;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public int getDiscount_ID() {
        return discount_ID;
    }

    public void setDiscount_ID(int discount_ID) {
        this.discount_ID = discount_ID;
    }

    public int getDiscount_Amount() {
        return discount_Amount;
    }

    public void setDiscount_Amount(int discount_Amount) {
        this.discount_Amount = discount_Amount;
    }

    public String getDiscount_Name() {
        return discount_Name;
    }

    public void setDiscount_Name(String discount_Name) {
        this.discount_Name = discount_Name;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

}
