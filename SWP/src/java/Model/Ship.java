/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author Laptop K1
 */
public class Ship {
    private int shipID;
     private String ship_status;
      private Date time;
       private float ship_cost;
        private String ship_method;

    public Ship(int shipID, String ship_status, Date time, float ship_cost, String ship_method) {
        this.shipID = shipID;
        this.ship_status = ship_status;
        this.time = time;
        this.ship_cost = ship_cost;
        this.ship_method = ship_method;
    }

    public Ship() {
    }

    public int getShipID() {
        return shipID;
    }

    public void setShipID(int shipID) {
        this.shipID = shipID;
    }

    public String getShip_status() {
        return ship_status;
    }

    public void setShip_status(String ship_status) {
        this.ship_status = ship_status;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public float getShip_cost() {
        return ship_cost;
    }

    public void setShip_cost(float ship_cost) {
        this.ship_cost = ship_cost;
    }

    public String getShip_method() {
        return ship_method;
    }

    public void setShip_method(String ship_method) {
        this.ship_method = ship_method;
    }

    @Override
    public String toString() {
        return "Ship{" + "shipID=" + shipID + ", ship_status=" + ship_status + ", time=" + time + ", ship_cost=" + ship_cost + ", ship_method=" + ship_method + '}';
    }
   
       
}
