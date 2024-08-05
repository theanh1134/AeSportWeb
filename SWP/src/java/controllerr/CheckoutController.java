/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerr;

import Model.UserAccount;
import data.OrderContext;
import entity.product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;

/**
 *
 * @author admin
 */
public class CheckoutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            HashMap<product, Integer> cart = (HashMap<product, Integer>) session.getAttribute("cart");
            double total = 0;
            for (product item : cart.keySet()) {
                total += item.getPrice() * (100 - item.getDiscount().getDiscount_Amount()) / 100 * cart.get(item);
            }
            request.setAttribute("total", total);
            request.getRequestDispatcher("view/Checkout.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserAccount user = (UserAccount) session.getAttribute("CRRAccount");
        if (user == null) {
            request.setAttribute("error", "Bạn cần đăng nhập trước khi thực hiện chức năng này");
            doGet(request, response);
            return;
        }
        HashMap<product, Integer> cart = (HashMap<product, Integer>) session.getAttribute("cart");
        OrderContext orderContext = new OrderContext();
        String payment = request.getParameter("payment");
        double total = 0;
        for (product item : cart.keySet()) {
            total += item.getPrice() * (100 - item.getDiscount().getDiscount_Amount()) / 100 * cart.get(item);
        }
        orderContext.insertOrder(user.getUse_ID(), "Đang xử lý", Integer.parseInt(payment), total);
        int orderID = orderContext.getLastOrderID();
        for (product item : cart.keySet()) {
            orderContext.insertOrderDetail(orderID, item.getProductID(), cart.get(item), (int) (item.getPrice() * (100 - item.getDiscount().getDiscount_Amount()) / 100));
        }
        session.removeAttribute("cart");
        session.setAttribute("successMessage", "Bạn đã đặt hàng thành công!");
        response.sendRedirect("HomePage");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
