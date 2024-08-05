
import DBContext.AdminOrderDao;
import Model.Order;
import Model.UserAccount;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class AdminOrderController extends HttpServlet {

    private AdminOrderDao adminOrderDao;

    @Override
    public void init() {
        adminOrderDao = new AdminOrderDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        UserAccount user = (UserAccount) request.getSession().getAttribute("CRRAccount");
        if (user == null) {
            response.sendRedirect("view/Login.jsp");
        } else {
            try {
                switch (action) {
                    case "list":
                        listOrders(request, response);
                        break;
                    case "detail":
                        orderDetail(request, response);
                        break;
                    case "update":
                        updateOrderStatus(request, response);
                        break;
                    default:
                        listOrders(request, response);
                        break;
                }
            } catch (Exception ex) {
                throw new ServletException("Lỗi khi xử lý yêu cầu: " + ex.getMessage(), ex);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Admin Order Controller manages all admin functionalities for orders.";
    }

    private void listOrders(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Order> orders = adminOrderDao.getAllOrders();
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("view/OrderList.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Lỗi khi lấy danh sách đơn hàng: " + e.getMessage(), e);
        }
    }

    private void orderDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        try {
            Order orderDetail = adminOrderDao.getOrderDetail(orderId);
            if (orderDetail != null) {
                request.setAttribute("orderDetail", orderDetail);
                request.getRequestDispatcher("view/OrderDetail.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy đơn hàng.");
            }
        } catch (Exception e) {
            throw new ServletException("Lỗi khi lấy chi tiết đơn hàng: " + e.getMessage(), e);
        }
    }

    private void updateOrderStatus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String status = request.getParameter("status");
        adminOrderDao.updateOrderStatus(orderId, status);
        response.sendRedirect("AdminOrder?action=update");

    }
}
