/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class Feedback implements Serializable {

    private static final long serialVersionUID = 1L;
    private int feedback_ID;
    private String img;
    private String detal;
    private int product_ID;
    private int start;
    private int user_ID;
    private String username;

    public Feedback() {
    }

    public Feedback(int feedback_ID, String img, String detal, int product_ID, int start, int user_ID, String username) {
        this.feedback_ID = feedback_ID;
        this.img = img;
        this.detal = detal;
        this.product_ID = product_ID;
        this.start = start;
        this.user_ID = user_ID;
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    

    public int getFeedback_ID() {
        return feedback_ID;
    }

    public void setFeedback_ID(int feedback_ID) {
        this.feedback_ID = feedback_ID;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDetal() {
        return detal;
    }

    public void setDetal(String detal) {
        this.detal = detal;
    }

    public int getProduct_ID() {
        return product_ID;
    }

    public void setProduct_ID(int product_ID) {
        this.product_ID = product_ID;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getUser_ID() {
        return user_ID;
    }

    public void setUser_ID(int user_ID) {
        this.user_ID = user_ID;
    }

}