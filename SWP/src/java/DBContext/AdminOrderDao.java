package DBContext;

import Model.Order;
import Model.OrderItem;
import Model.Payment;
import Model.Product;
import Model.Ship;
import Model.Size;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminOrderDao extends DBContext {

    public List<Order> getAllOrders() {
        List<Order> listOrder = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Order]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int orderId = rs.getInt("order_ID");
                int userID = rs.getInt("user_ID");
                String status = rs.getString("order_status");
                Date date = rs.getDate("order_date");
                int payId = rs.getInt("pay_ID");
                int shipId = rs.getInt("shipID");
                float amount = rs.getFloat("total_amount");
                Order order = new Order(orderId, userID, status, date, payId, shipId, amount);
                listOrder.add(order);
            }
            return listOrder;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Order getOrderDetail(int orderId) throws SQLException {
        Order order = null;
        String sql = "SELECT o.order_ID, o.user_ID, o.order_status, o.order_date, o.pay_ID, o.shipID, o.total_amount, " +
                     "p.payment_Name, s.Ship_method, s.ship_cost " +
                     "FROM [dbo].[Order] AS o " +
                     "JOIN Payment p ON o.pay_ID = p.pay_ID " +
                     "JOIN Ship s ON s.shipID = o.shipID " +
                     "WHERE o.order_ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                order = new Order();
                order.setOrder_ID(rs.getInt("order_ID"));
                order.setUser_ID(rs.getInt("user_ID"));
                order.setOrder_status(rs.getString("order_status"));
                order.setOrder_date(rs.getDate("order_date"));

                Payment payment = new Payment();
                payment.setPayName(rs.getString("payment_Name"));
                order.setPayment(payment);

                Ship ship = new Ship();
                ship.setShip_method(rs.getString("Ship_method"));
                ship.setShip_cost(rs.getFloat("ship_cost"));
                order.setShip(ship);

                order.setItems(getOrderItems(orderId)); // Fetch order items
            }
            return order;
        } catch (SQLException e) {
            System.out.println(e);
            throw e;
        }
    }

    public List<OrderItem> getOrderItems(int orderId) throws SQLException {
        List<OrderItem> listOrderItem = new ArrayList<>();
        String sql = "SELECT oi.order_ID, pr.product_ID, pr.product_Name, oi.quantity, oi.price_unit " +
                     "FROM Order_item oi " +
                     "JOIN Product pr ON pr.product_ID = oi.product_ID " +                   
                     "WHERE oi.order_ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("product_ID"));
                product.setProductName(rs.getString("product_Name"));


                OrderItem item = new OrderItem();
                item.setOrder_ID(rs.getInt("order_ID"));
                item.setProduct(product);
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice_unit(rs.getFloat("price_unit"));
              

                listOrderItem.add(item);
            }
            return listOrderItem;
        } catch (SQLException e) {
            System.out.println(e);
            throw e;
        }
    }
    public void updateOrderStatus(int orderId, String status) throws SQLException {
        String sql = "UPDATE [dbo].[Order] SET order_status = ? WHERE order_ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, orderId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            throw e;
        }
    }

    public static void main(String[] args) {
        AdminOrderDao adminOrderDao = new AdminOrderDao();

        // Test getAllOrders method
        List<Order> allOrders = adminOrderDao.getAllOrders();
        System.out.println("All orders in the system:");
        if (allOrders != null) {
            for (Order order : allOrders) {
                System.out.println(order);
            }
        } else {
            System.out.println("No orders found or there was an error retrieving the orders.");
        }

        // Test getOrderDetail method
        int testOrderId = 1; // Change to a valid order ID
        try {
            Order order = adminOrderDao.getOrderDetail(testOrderId);
            if (order != null) {
                System.out.println("Order details for order ID " + testOrderId + ":");
                System.out.println(order);

                System.out.println("Order items:");
                for (OrderItem item : order.getItems()) {
                    System.out.println(item);
                }
            } else {
                System.out.println("No order found with the specified order ID, or there was an error retrieving the order details.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
}
