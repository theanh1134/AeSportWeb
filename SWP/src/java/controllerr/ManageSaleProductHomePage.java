/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllerr;

import Model.Category;
import Model.UserAccount;
import data.AuthorizationContext;
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
public class ManageSaleProductHomePage extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductContext p = new ProductContext();
        CategoryContext b = new CategoryContext();

        ArrayList<product> productsSaleHomePage = p.getProductsonHomePage("sale");
        req.setAttribute("productsSaleHomePage", productsSaleHomePage);
        String select1 = req.getParameter("select1");

        req.setAttribute("select1", select1);
        String category = req.getParameter("category");
        req.setAttribute("category", category);

        String Subcategory = req.getParameter("Subcategory");
        req.setAttribute("Subcategory", Subcategory);

        if (select1 != null && category != null && Subcategory != null) {
            ArrayList<product> products = p.getproductByCondition(Integer.parseInt(Subcategory), Integer.parseInt(category), select1, "sale");
            req.setAttribute("products", products);

        }
        if (select1 != null && select1 != "") {
            ArrayList<Category> listCA = b.getCategorys(select1);
            req.setAttribute("listCA", listCA);

        }
        if (category != null && category != "0") {
            ArrayList<SubCategory> listSub = b.getSubCategorys(Integer.parseInt(category));
            req.setAttribute("listSub", listSub);
        }

        req.getRequestDispatcher("view/Product/managerSaleProductonHomePage.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductContext p = new ProductContext();
        CategoryContext b = new CategoryContext();

        AuthorizationContext db = new AuthorizationContext();
        UserAccount account = (UserAccount) req.getSession().getAttribute("CRRAccount");
        if (account != null) {
            String servletPath = req.getServletPath();
            servletPath = servletPath.substring(1);
            String role = db.getRole(account.getUse_ID());
            int idRole = db.getRoleIDbyRoleName(role);
            ArrayList<String> fetures = db.getFeature(idRole);
            if (fetures.contains(servletPath) || "admin".equals(role)) {
                String type = req.getParameter("type");
                String select1 = req.getParameter("select1");
                String productID = req.getParameter("productID");
                String category = req.getParameter("category");
                String Subcategory = req.getParameter("Subcategory");

                if (select1 != null && productID != null && category != null && Subcategory != null) {
                    req.setAttribute("select1", select1);
                    req.setAttribute("category", category);
                    req.setAttribute("Subcategory", Subcategory);
                    ArrayList<Category> listCA = b.getCategorys(select1);
                    req.setAttribute("listCA", listCA);
                    ArrayList<SubCategory> listSub = b.getSubCategorys(Integer.parseInt(category));
                    req.setAttribute("listSub", listSub);
                    if ("1".equals(type)) {
                        p.updateProductonHome(Integer.parseInt(productID), "true");
                    }

                    ArrayList<product> products = p.getproductByCondition(Integer.parseInt(Subcategory), Integer.parseInt(category), select1, "sale");
                    req.setAttribute("products", products);
                }
                if ("2".equals(type)) {
                    p.updateProductonHome(Integer.parseInt(productID), "false");
                }
                ArrayList<product> productsSaleHomePage = p.getProductsonHomePage("sale");
                req.setAttribute("productsSaleHomePage", productsSaleHomePage);
                req.getRequestDispatcher("view/Product/managerSaleProductonHomePage.jsp").forward(req, resp);
            } else {
                req.getRequestDispatcher("view/AccessInvalid.jsp").forward(req, resp);
            }
        } else {
            req.getRequestDispatcher("view/AccessInvalid.jsp").forward(req, resp);

        }

    }

}
