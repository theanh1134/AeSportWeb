/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerr;

import DBContext.AdminDAO;
import Model.Category;
import Model.Discount;
import data.CategoryContext;
import data.ProductContext;
import entity.SubCategory;
import entity.product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * @author Hoàng Sơn
 */
public class ManageSaleProducts extends HttpServlet {

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
        ProductContext p = new ProductContext();
        CategoryContext b = new CategoryContext();

        String select1 = request.getParameter("select1");
        String productID = request.getParameter("productID");
        String category = request.getParameter("category");
        String Subcategory = request.getParameter("Subcategory");

        String type = request.getParameter("type");

        if ("2".equals(type)) {
            p.deleteStatusProduct(Integer.parseInt(productID));
        }
        if (select1 != null && select1 != "") {
            ArrayList<Category> listCA = b.getCategorys(select1);
            request.setAttribute("listCA", listCA);
        }

        if (category != null && category != "0") {
            ArrayList<SubCategory> listSub = b.getSubCategorys(Integer.parseInt(category));
            request.setAttribute("listSub", listSub);
        }

        ArrayList<product> saleProducts = p.getproductsbyStatus("sale");
        
        request.setAttribute("select1", select1);
        request.setAttribute("category", category);
        request.setAttribute("Subcategory", Subcategory);
        request.setAttribute("SaleProducts", saleProducts);
        request.getRequestDispatcher("view/Product/ManageSaleProducts.jsp").forward(request, response);
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
        AdminDAO adminDao = new AdminDAO();
        ProductContext p = new ProductContext();
        CategoryContext b = new CategoryContext();

        String select1 = request.getParameter("select1");
        request.setAttribute("select1", select1);
        String category = request.getParameter("category");
        request.setAttribute("category", category);
        String Subcategory = request.getParameter("Subcategory");
        request.setAttribute("Subcategory", Subcategory);

        String type = request.getParameter("type");

        if ("1".equals(type)) {
            String productID = request.getParameter("productID");

            String discount = request.getParameter("discount");
            System.out.println(discount);
            p.updateDiscountProduct(Integer.parseInt(productID), Integer.parseInt(discount));
            p.updateStatusProduct(Integer.parseInt(productID), "sale");

        }

        if (select1 != null && category != null && Subcategory != null) {
            ArrayList<Discount> listDiscount = adminDao.getAllDiscount();
            request.setAttribute("listDiscount", listDiscount);
            ArrayList<product> products = p.getproductAllArrayListByCondition(Integer.parseInt(Subcategory), Integer.parseInt(category), select1, "normal");
            request.setAttribute("products", products);
        }
        if (select1 != null && select1 != "") {
            ArrayList<Category> listCA = b.getCategorys(select1);
            request.setAttribute("listCA", listCA);
        }
        if (category != null && category != "") {
            ArrayList<SubCategory> listSub = b.getSubCategorys(Integer.parseInt(category));
            request.setAttribute("listSub", listSub);
        }
        ArrayList<product> saleProducts = p.getproductsbyStatus("sale");

        request.setAttribute("SaleProducts", saleProducts);
        request.getRequestDispatcher("view/Product/ManageSaleProducts.jsp").forward(request, response);

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
