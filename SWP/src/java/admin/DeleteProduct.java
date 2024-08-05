/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import DBContext.AdminDAO;
import Model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class DeleteProduct extends HttpServlet {

    private static final int PRODUCTS_PER_PAGE = 10;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();
        boolean keyCheck = true;
        try {
            int productID = Integer.parseInt(request.getParameter("pID"));
            if (dao.getOrderItemByProductID(productID) != null) {
                request.setAttribute("error", "Sản phẩm đang có Order không thể xóa!");
                keyCheck = false;
            }

            if (keyCheck == true) {

                dao.deleteProductByID(productID);
                request.setAttribute("info", "Xóa thành công!");
            }

            ArrayList<Product> list = dao.getAllProduct();
            int page = 1;
            int totalProducts = list.size();
            int totalPages = (int) Math.ceil((double) totalProducts / PRODUCTS_PER_PAGE);
            String pageStr = request.getParameter("page");

            if (pageStr != null && !pageStr.isEmpty()) {
                try {
                    page = Integer.parseInt(pageStr);
                } catch (NumberFormatException e) {
                    page = 1;
                }
            }

            int startIndex = (page - 1) * PRODUCTS_PER_PAGE;
            int endIndex = Math.min(startIndex + PRODUCTS_PER_PAGE, totalProducts);
            ArrayList<Product> paginatedList = new ArrayList<>(list.subList(startIndex, endIndex));
            request.setAttribute("list", paginatedList);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.getRequestDispatcher("admin/ManagerProduct.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
