/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Laptop K1
 */
public class ImgProduct {
    private int imgID;
    private String imgUrl;
    private int productID;
    

    public ImgProduct() {
    }

    public ImgProduct(int imgID, String imgUrl, int productID) {
        this.imgID = imgID;
        this.imgUrl = imgUrl;
        this.productID = productID;
    }

    public ImgProduct(int imgID, String imgUrl) {
        this.imgID = imgID;
        this.imgUrl = imgUrl;
    }
    

    public int getImgID() {
        return imgID;
    }

    public void setImgID(int imgID) {
        this.imgID = imgID;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }


    
    @Override
    public String toString() {
        return "ImgProduct{" + "imgID=" + imgID + ", imgUrl=" + imgUrl + '}';
    }

}
