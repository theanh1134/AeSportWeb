/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Laptop K1
 */
public class Order {

    private int order_ID;
    private int user_ID;
    private String order_status;
    private Date order_date;
    private int pay_ID;
    private int shipID;
    private float total_mount;
    private List<OrderItem> items;
    private Payment payment;
    private Ship ship;
    private Account user;
    private int orderCount;
    

    public Order() {
    }

    public Order(int order_ID, int user_ID, String order_status, Date order_date, int pay_ID, int shipID, float total_mount) {
        this.order_ID = order_ID;
        this.user_ID = user_ID;
        this.order_status = order_status;
        this.order_date = order_date;
        this.pay_ID = pay_ID;
        this.shipID = shipID;
        this.total_mount = total_mount;
    }

    public Order(int order_ID, int user_ID, String order_status, Date order_date, int pay_ID, int shipID, float total_mount, List<OrderItem> items, Payment payment, Ship ship, Account user) {
        this.order_ID = order_ID;
        this.user_ID = user_ID;
        this.order_status = order_status;
        this.order_date = order_date;
        this.pay_ID = pay_ID;
        this.shipID = shipID;
        this.total_mount = total_mount;
        this.items = items;
        this.payment = payment;
        this.ship = ship;
        this.user = user;
    }
    

    public Account getUser() {
        return user;
    }

    public void setUser(Account user) {
        this.user = user;
    }
    
    

  
    public int getOrder_ID() {
        return order_ID;
    }

    public int getOrderCount() {
        return orderCount;
    }

    public void setOrderCount(int orderCount) {
        this.orderCount = orderCount;
    }

    
    

    public void setOrder_ID(int order_ID) {
        this.order_ID = order_ID;
    }

    public int getUser_ID() {
        return user_ID;
    }

    public void setUser_ID(int user_ID) {
        this.user_ID = user_ID;
    }

    public String getOrder_status() {
        return order_status;
    }

    public void setOrder_status(String order_status) {
        this.order_status = order_status;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    public Ship getShip() {
        return ship;
    }

    public void setShip(Ship ship) {
        this.ship = ship;
    }

    public int getPay_ID() {
        return pay_ID;
    }

    public void setPay_ID(int pay_ID) {
        this.pay_ID = pay_ID;
    }

    public int getShipID() {
        return shipID;
    }

    public void setShipID(int shipID) {
        this.shipID = shipID;
    }

    public float getTotal_mount() {
        return total_mount;
    }

    public void setTotal_mount(float total_mount) {
        this.total_mount = total_mount;
    }

    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
    }
    @Override
    public String toString() {
        return "Order{" + "order_ID=" + order_ID + ", user_ID=" + user_ID + ", order_status=" + order_status + ", order_date=" + order_date + ", pay_ID=" + pay_ID + ", shipID=" + shipID + ", total_mount=" + total_mount + ", items=" + items + '}';
    }

  

}

