/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerr;

import Model.Category;
import data.CategoryContext;
import data.ProductContext;
import entity.SubCategory;
import entity.product;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author Hoàng Sơn
 */
public class ManageHotProducts extends HttpServlet {

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
        String type = request.getParameter("type");

        String productID = request.getParameter("productID");
        String category = request.getParameter("category");
        String Subcategory = request.getParameter("Subcategory");
        request.setAttribute("select1", select1);
        request.setAttribute("category", category);
        request.setAttribute("Subcategory", Subcategory);
        if ("2".equals(type)) {
            p.deleteStatusProduct(Integer.parseInt(productID));
        }
        if ("1".equals(type)) {
            p.updateStatusProduct(Integer.parseInt(productID), "hot");
        }
        if (select1 != null && select1 != "") {
            ArrayList<Category> listCA = b.getCategorys(select1);
            request.setAttribute("listCA", listCA);
        }
        if (category != null && category != "") {
            ArrayList<SubCategory> listSub = b.getSubCategorys(Integer.parseInt(category));
            request.setAttribute("listSub", listSub);
        }
        ArrayList<product> hotProducts = p.getproductsbyStatus("hot");
        request.setAttribute("HotProducts", hotProducts);

        request.getRequestDispatcher("view/Product/ManageHotProducts.jsp").forward(request, response);
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
        ProductContext p = new ProductContext();
        CategoryContext b = new CategoryContext();
        ArrayList<product> hotProducts = p.getproductsbyStatus("hot");
        request.setAttribute("HotProducts", hotProducts);

        String select1 = request.getParameter("select1");
        request.setAttribute("select1", select1);
        String category = request.getParameter("category");
        request.setAttribute("category", category);
        String Subcategory = request.getParameter("Subcategory");
        request.setAttribute("Subcategory", Subcategory);

        if (select1 != null && category != null && Subcategory != null) {
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
        request.getRequestDispatcher("view/Product/ManageHotProducts.jsp").forward(request, response);
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
