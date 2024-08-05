/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.*;

/**
 *
 * @author Hoàng Sơn
 */
public class Blog {

    private int Blog_ID;
    private String title;
    private String img;
    private Date date;
    private String detail;
    private int stype;
    private String authorString;
    private int number_of_views;
    private CategoryBlog ca;
    private StatusBlog statusBlog;

    public StatusBlog getStatusBlog() {
        return statusBlog;
    }

    public void setStatusBlog(StatusBlog statusBlog) {
        this.statusBlog = statusBlog;
    }

    public Blog() {
    }

    public int getBlog_ID() {
        return Blog_ID;
    }

    public void setBlog_ID(int Blog_ID) {
        this.Blog_ID = Blog_ID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getStype() {
        return stype;
    }

    public void setStype(int stype) {
        this.stype = stype;
    }

    public String getAuthorString() {
        return authorString;
    }

    public void setAuthorString(String authorString) {
        this.authorString = authorString;
    }

    public int getNumber_of_views() {
        return number_of_views;
    }

    public void setNumber_of_views(int number_of_views) {
        this.number_of_views = number_of_views;
    }

    public CategoryBlog getCa() {
        return ca;
    }

    public void setCa(CategoryBlog ca) {
        this.ca = ca;
    }

}
