package Model;

public class Product {

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
    private int subcategoryID;
    private double import_price;
    private Discount discount;
    private ImgProduct img; 
    private ProductSizeColor sizecolor;
    private double revenue;
    private int inventory_number;

    // Constructors
    public Product() {
    }
    
    public Product(int productID, int feedbackID, double price, String description, String status, int sportID, String productName, int brandID, int quantity, int discountID, int subcategoryID, double import_price) {
        this.productID = productID;
        this.feedbackID = feedbackID;
        this.price = price;
        this.description = description;
        this.status = status;
        this.sportID = sportID;
        this.productName = productName;
        this.brandID = brandID;
        this.quantity = quantity;
        this.discountID = discountID;
        this.subcategoryID = subcategoryID;
        this.import_price = import_price;
    }

    public Product(double price, String description, String status, int sportID, String productName, int brandID, int subcategoryID, double import_price) {
        this.price = price;
        this.description = description;
        this.status = status;
        this.sportID = sportID;
        this.productName = productName;
        this.brandID = brandID;
        this.subcategoryID = subcategoryID;
        this.import_price = import_price;

    }

    public Product(int productID, double price, String description, String status, int sportID, String productName, int brandID, int subcategoryID, int discountID, double import_price) {
        this.productID = productID;
        this.price = price;
        this.description = description;
        this.status = status;
        this.sportID = sportID;
        this.productName = productName;
        this.brandID = brandID;
        this.subcategoryID = subcategoryID;
        this.discountID = discountID;
        this.import_price = import_price;
    }

    public Product(int productID, double price, String status, String productName, int quantity, int discountID, int subcategoryID) {
        this.productID = productID;
        this.price = price;
        this.status = status;
        this.productName = productName;
        this.quantity = quantity;
        this.discountID = discountID;
        this.subcategoryID = subcategoryID;
    }

    

    public Product(int productID, double price, String description, String status, int sportID, String productName, int brandID, int subcategoryID, double import_price) {
        this.productID = productID;
        this.price = price;
        this.description = description;
        this.status = status;
        this.sportID = sportID;
        this.productName = productName;
        this.brandID = brandID;
        this.subcategoryID = subcategoryID;
        this.import_price = import_price;
    }

    

   
    public Product(int productID, String productName, double revenue) {
        this.productID = productID;
        this.productName = productName;
        this.revenue = revenue;
    }

    public Product(int productID, String productName, int quantity) {
        this.productID = productID;
        this.productName = productName;
        this.quantity = quantity;
    }

    public Product(int productID, String productName, int quantity, int inventory_number) {
        this.productID = productID;
        this.productName = productName;
        this.quantity = quantity;
        this.inventory_number = inventory_number;
    }


    
    public int getProductID() {
        return productID;
    }

    public int getInventory_number() {
        return inventory_number;
    }

    public void setInventory_number(int inventory_number) {
        this.inventory_number = inventory_number;
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

    public double getRevenue() {
        return revenue;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
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

    public int getSubcategoryID() {
        return subcategoryID;
    }

    public void setSubcategoryID(int subcategoryID) {
        this.subcategoryID = subcategoryID;
    }

    public Discount getDiscount() {
        return discount;
    }

    public void setDiscount(Discount discount) {
        this.discount = discount;
    }

    public ImgProduct getImg() {
        return img;
    }

    public void setImg(ImgProduct img) {
        this.img = img;
    }

    public ProductSizeColor getSizecolor() {
        return sizecolor;
    }

    public void setSizecolor(ProductSizeColor sizecolor) {
        this.sizecolor = sizecolor;
    }

    public double getImport_price() {
        return import_price;
    }

    public void setImport_price(int import_price) {
        this.import_price = import_price;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", feedbackID=" + feedbackID + ", price=" + price + ", description=" + description + ", status=" + status + ", sportID=" + sportID + ", productName=" + productName + ", brandID=" + brandID + ", quantity=" + quantity + ", discountID=" + discountID + ", subcategoryID=" + subcategoryID + ", import_price=" + import_price + ", discount=" + discount + ", img=" + img + ", sizecolor=" + sizecolor + '}';
    }
    
    
}
