/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerr;

import Model.UserAccount;
import data.BlogContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Hoàng Sơn
 */
public class managerBlog extends HttpServlet {

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
        BlogContext blogdb = new BlogContext();
        String mode = request.getParameter("mode");
        String bID = request.getParameter("bID");
        if ("2".equals(mode)) {
            blogdb.updateStatusBlog(Integer.parseInt(bID), "pending", "delete");
        } else if ("3".equals(mode)) {
            blogdb.updateMainBlog(Integer.parseInt(bID));
        }
        request.getRequestDispatcher("view/Blog/manageBlog.jsp").forward(request, response);
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
        String mode = request.getParameter("mode");
        String title = request.getParameter("title");
        String img = request.getParameter("image");
        String detail = request.getParameter("content");
        String cate = request.getParameter("cate");
        BlogContext blogdb = new BlogContext();

        if ("1".equals(mode)) {
            String Blog_ID = request.getParameter("Blog_ID");
            if (img.isEmpty()) {
                String img_temp = request.getParameter("img_temp");
                blogdb.updateBlog(Integer.parseInt(Blog_ID), title, img_temp, detail, Integer.parseInt(cate));
            } else {
                blogdb.updateBlog(Integer.parseInt(Blog_ID), title, img, detail, Integer.parseInt(cate));
            }
        } else if ("2".equals(mode)) {
            UserAccount account = (UserAccount) request.getSession().getAttribute("CRRAccount");

            blogdb.insertBlog(title, img, detail, Integer.parseInt(cate), account.getFull_Name());
        }
        request.getRequestDispatcher("view/Blog/manageBlog.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
