package DBContext;

import Model.Order;
import Model.OrderItem;
import Model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductDao extends DBContext {

    // Lấy sản phẩm bán chạy nhất dựa trên doanh thu theo ngày
    public List<OrderItem> getTopSellingProductsByRevenue() {
        List<OrderItem> orderItems = new ArrayList<>();
        String sql = "SELECT p.product_ID, p.product_Name, CAST(o.order_date AS DATE) AS sale_date, SUM(oi.quantity * oi.price_unit) AS revenue " +
                     "FROM Order_item oi " +
                     "JOIN Product p ON oi.product_ID = p.product_ID " +
                     "JOIN [Order] o ON oi.order_ID = o.order_ID " +
                     "GROUP BY p.product_ID, p.product_Name, CAST(o.order_date AS DATE) " +
                     "ORDER BY sale_date ASC, revenue DESC";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                int productId = rs.getInt("product_ID");
                String productName = rs.getString("product_Name");
                Date saleDate = rs.getDate("sale_date");
                double revenue = rs.getDouble("revenue");

                Product product = new Product(productId, productName,revenue);
                Order order = new Order();
                order.setOrder_date(saleDate);

                OrderItem orderItem = new OrderItem();
                orderItem.setProduct(product);
                orderItem.setOrder(order);
                orderItems.add(orderItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderItems;
    }

    // Tương tự cho số lượng bán
   public List<OrderItem> getTopSellingProductsByQuantity() {
        List<OrderItem> orderItems = new ArrayList<>();
        String sql = "SELECT p.product_ID, p.product_Name, o.order_date AS sale_date, SUM(oi.quantity) AS total_quantity " +
                     "FROM Order_item oi " +
                     "JOIN Product p ON oi.product_ID = p.product_ID " +
                     "JOIN [Order] o ON oi.order_ID = o.order_ID " +
                     "GROUP BY p.product_ID, p.product_Name, o.order_date " +
                     "ORDER BY sale_date ASC, total_quantity DESC";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                int productId = rs.getInt("product_ID");
                String productName = rs.getString("product_Name");
                Date saleDate = rs.getDate("sale_date");
                int totalQuantity = rs.getInt("total_quantity");

                Product product = new Product(productId, productName, totalQuantity);
                Order order = new Order();
                order.setOrder_date(saleDate);

                OrderItem orderItem = new OrderItem();
                orderItem.setProduct(product);
                orderItem.setQuantity(totalQuantity);
                orderItem.setOrder(order);

                orderItems.add(orderItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderItems;
    }
   // Hàm lấy sản phẩm bán chạy nhất theo số lượng
    public Product getTop1ProductByQuantity() {
        Product topProduct = null;
        String sql = "SELECT TOP 1 " +
                     "p.product_ID, " +
                     "p.product_Name, " +
                     "SUM(oi.quantity) AS total_quantity " +
                     "FROM Order_item oi " +
                     "JOIN Product p ON oi.product_ID = p.product_ID " +
                     "GROUP BY p.product_ID, p.product_Name " +
                     "ORDER BY total_quantity DESC";

        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                int productId = rs.getInt("product_ID");
                String productName = rs.getString("product_Name");
                int totalQuantity = rs.getInt("total_quantity");

                // Tạo đối tượng Product
                topProduct = new Product();
                topProduct.setProductID(productId);
                topProduct.setProductName(productName);
                // Có thể lưu tổng số lượng nếu cần trong lớp Product hoặc trong lớp khác
                // topProduct.setTotalQuantity(totalQuantity); // Nếu lớp Product có thuộc tính này
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return topProduct;
    }
   
    public static void main(String[] args) {
        ProductDao productDao = new ProductDao();

        // Gọi phương thức getTopSellingProductsByQuantity và lấy kết quả
        List<OrderItem> topSellingProducts = productDao.getTopSellingProductsByRevenue();

        // In kết quả ra màn hình
        for (OrderItem item : topSellingProducts) {
            Product product = item.getProduct();
            Order order = item.getOrder();

            System.out.println("Product ID: " + product.getProductID());
            System.out.println("Product Name: " + product.getProductName());
            System.out.println("Total Quantity Sold: " + product.getRevenue());
            System.out.println("Sale Date: " + order.getOrder_date());
            System.out.println("------------------------------------");
        }
    }

}

