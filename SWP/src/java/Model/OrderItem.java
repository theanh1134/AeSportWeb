/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Laptop K1
 */
public class OrderItem {
   private int order_ID;
   private int product_ID;
   private int quantity;
   private float price_unit;
   private int size_ID;
   private Product product;
   private Size size;
   private Order order;

   public OrderItem() {
   }

   public OrderItem(int order_ID, int product_ID, int quantity, float price_unit) {
       this.order_ID = order_ID;
       this.product_ID = product_ID;
       this.quantity = quantity;
       this.price_unit = price_unit;
   }
    
   public OrderItem(int order_ID, int product_ID, int quantity, float price_unit, int size_ID) {
       this.order_ID = order_ID;
       this.product_ID = product_ID;
       this.quantity = quantity;
       this.price_unit = price_unit;
       this.size_ID = size_ID;
   }

   public Product getProduct() {
       return product;
   }

   public void setProduct(Product product) {
       this.product = product;
   }

    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

 

   public int getOrder_ID() {
       return order_ID;
   }

   public void setOrder_ID(int order_ID) {
       this.order_ID = order_ID;
   }

   public int getProduct_ID() {
       return product_ID;
   }

   public void setProduct_ID(int product_ID) {
       this.product_ID = product_ID;
   }

   public int getQuantity() {
       return quantity;
   }

   public void setQuantity(int quantity) {
       this.quantity = quantity;
   }

   public float getPrice_unit() {
       return price_unit;
   }

   public void setPrice_unit(float price_unit) {
       this.price_unit = price_unit;
   }

   public int getSize_ID() {
       return size_ID;
   }

   public void setSize_ID(int size_ID) {
       this.size_ID = size_ID;
   }

    @Override
    public String toString() {
        return "OrderItem{" + "order_ID=" + order_ID + ", product_ID=" + product_ID + ", quantity=" + quantity + ", price_unit=" + price_unit + ", size_ID=" + size_ID + ", product=" + product + ", size=" + size + '}';
    }


   

  
  
}
