package controllerr;

import DBContext.ProductDao;
import Model.OrderItem;
import Model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ReportProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    // Tạo đối tượng DAO
    ProductDao productDAO = new ProductDao();

    // Lấy dữ liệu sản phẩm
    List<OrderItem> topProductsByRevenue = productDAO.getTopSellingProductsByRevenue();
    List<OrderItem> topProductsByQuantity = productDAO.getTopSellingProductsByQuantity();

    // Tính toán số lượng sản phẩm bán chạy nhất
    Product topProductsTotal = productDAO.getTop1ProductByQuantity();

    // Lấy sản phẩm doanh thu cao nhất
    String topRevenueProduct = "N/A";
    if (!topProductsByRevenue.isEmpty()) {
        Product topProduct = topProductsByRevenue.get(0).getProduct();
        if (topProduct != null) {
            topRevenueProduct = topProduct.getProductName();
        }
    }

    // Cài đặt thuộc tính yêu cầu
    request.setAttribute("topProductsByRevenue", topProductsByRevenue);
    request.setAttribute("topProductsByQuantity", topProductsByQuantity);
    request.setAttribute("topProductsTotal", topProductsTotal);
    request.setAttribute("topRevenueProduct", topRevenueProduct);

    // Chuyển tiếp yêu cầu đến JSP
    request.getRequestDispatcher("/admin/productPerformance.jsp").forward(request, response);
}


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
