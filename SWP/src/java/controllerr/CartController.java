/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerr;

import data.ProductContext;
import entity.product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Objects;

/**
 *
 * @author admin
 */
public class CartController extends HttpServlet {

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
        HttpSession session = request.getSession();
        HashMap<product, Integer> cart = (HashMap<product, Integer>) session.getAttribute("cart");
        double total = 0;
        if (Objects.nonNull(cart)) {
            for (product item : cart.keySet()) {
                total += item.getPrice() * (100 - item.getDiscount().getDiscount_Amount()) / 100 * cart.get(item);
            }
        }
        request.setAttribute("total",  total);
        request.getRequestDispatcher("view/CartPage.jsp").forward(request, response);

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
        response.setContentType("text/html;charset=UTF-8");
        int productId = Integer.parseInt(request.getParameter("productId"));
        int number = Integer.parseInt(request.getParameter("number"));

        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            HashMap<product, Integer> cart = (HashMap<product, Integer>) session.getAttribute("cart");
            if (cart == null) {
                cart = new HashMap<>();
            }
            boolean checkProductInCart = cart.keySet().stream().anyMatch(p -> p.getProductID() == productId);

            if (checkProductInCart) {
                String resp = "{\"size\" : " + cart.size() + " , \"message\" : \"Sản phẩm đã tồn tại trong giỏ hàng \" }";
                out.print(resp);
            } else {
                ProductContext productDB = new ProductContext();
                product productDetail = productDB.getProduct(productId);
                cart.put(productDetail, number);
                session.setAttribute("cart", cart);
                String resp = "{\"size\" : " + cart.size() + " , \"message\" : \"Thêm vào giỏ hàng thành công \" }";
                out.print(resp);
            }
        }
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
