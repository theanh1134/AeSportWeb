package Model;

/**
 *
 * @author Admin
 */
public class Product1 {

    private int productID;
    private int feedbackID;
    private double price;
    private String description;
    private String status;
    private int sportID;
    private String productName;
    private int brandID;
    private int quantity;
    private int discountID;
    private int subcategory_ID;
    private double import_price;
    private Discount discount;
    private String img;
    private ProductSizeColor sizecolor;

    public Product1() {
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getSportID() {
        return sportID;
    }

    public void setSportID(int sportID) {
        this.sportID = sportID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getBrandID() {
        return brandID;
    }

    public void setBrandID(int brandID) {
        this.brandID = brandID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getDiscountID() {
        return discountID;
    }

    public void setDiscountID(int discountID) {
        this.discountID = discountID;
    }

    public int getSubcategory_ID() {
        return subcategory_ID;
    }

    public void setSubcategory_ID(int subcategory_ID) {
        this.subcategory_ID = subcategory_ID;
    }


    public double getImport_price() {
        return import_price;
    }

    public void setImport_price(double import_price) {
        this.import_price = import_price;
    }

    public Discount getDiscount() {
        return discount;
    }

    public void setDiscount(Discount discount) {
        this.discount = discount;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

   
    public ProductSizeColor getSizecolor() {
        return sizecolor;
    }

    public void setSizecolor(ProductSizeColor sizecolor) {
        this.sizecolor = sizecolor;
    }

}