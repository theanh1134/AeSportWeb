package controllerr;

import DBContext.OrderDao;
import Model.Order;
import Model.OrderItem;
import Model.UserAccount;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class OrderController extends HttpServlet {

    private OrderDao orderDao;

    @Override
    public void init() {
        orderDao = new OrderDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        UserAccount u = (UserAccount) request.getSession().getAttribute("CRRAccount");
        if (u == null) {
            response.sendRedirect("Login");
        } else {
            int user_id = u.getUse_ID();
            try {
                switch (action) {
                    case "list":
                        listOrders(request, response, user_id);
                        break;
                    case "detail":
                        orderDetail(request, response);
                        break;
                    case "myOrder":
                        myOrders(request, response, user_id);
                        break;
                    case "information":
                        ordersInformation(request, response);
                        break;
                    case "cancel":
                        cancelOrder(request, response);
                        break;
                    case "update":
                        updateOrder(request, response);
                        break;
                    default:
                        listOrders(request, response, user_id);
                        break;
                }
            } catch (Exception ex) {
                throw new ServletException(ex);
            }
        }
    }

    private void listOrders(HttpServletRequest request, HttpServletResponse response, int userID)
            throws SQLException, IOException, ServletException {
        List<Order> listOrder = orderDao.getAllOrders();
        request.setAttribute("listOrder", listOrder);
        request.getRequestDispatcher("admin/OrderList.jsp").forward(request, response);
    }

    public void orderDetail(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int idOrder = Integer.parseInt(request.getParameter("idOrder"));
        List<OrderItem> items = orderDao.getOrderItems(idOrder);
        request.setAttribute("order", orderDao.getOrderDetail(idOrder));
        request.setAttribute("items", items);
        request.getRequestDispatcher("admin/OrderDetail.jsp").forward(request, response);
    }

    public void myOrders(HttpServletRequest request, HttpServletResponse response, int userID)
            throws SQLException, IOException, ServletException {
        List<Order> orders = orderDao.getOrderUser(userID);
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("view/MyOrder.jsp").forward(request, response);
    }

    public void ordersInformation(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int idOrder = Integer.parseInt(request.getParameter("idOrder"));
        List<OrderItem> items = orderDao.getOrderItems(idOrder);
        request.setAttribute("order", orderDao.getOrderDetail(idOrder));
        request.setAttribute("items", items);
        request.getRequestDispatcher("view/OrderInformation.jsp").forward(request, response);
    }

    public void cancelOrder(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            String currentStatus = orderDao.getOrderStatus(orderId);
            if ("Cancelled".equals(currentStatus)) {
                response.getWriter().write("Order is already cancelled.");
            } else if ("Delivered".equals(currentStatus)) {
                response.getWriter().write("Order has already been delivered and cannot be cancelled.");
            } else {
                orderDao.cancelOrder(orderId);
                response.getWriter().write("Order cancelled successfully.");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Order ID");
        }
    }

    public void updateOrder(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String status = request.getParameter("status");
        orderDao.updateOrderStatus(orderId, status);
        response.sendRedirect("OrderDetail.jsp?orderId=" + orderId);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Order Controller Servlet";
    }

}
