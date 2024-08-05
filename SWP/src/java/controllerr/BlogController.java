/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerr;

import data.BlogContext;
import entity.Blog;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Hoàng Sơn
 */
public class BlogController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BlogContext blogDB = new BlogContext();

        if (request.getParameter("page") != null) {
            ArrayList<Blog> list = blogDB.getBlogsPaging(Integer.parseInt(request.getParameter("page")));
            Blog mainBlog = blogDB.getMainBlog();
            request.setAttribute("list", list);
            request.setAttribute("mainBlog", mainBlog);
        }
        if (request.getParameter("categoryBlog") != null) {
            ArrayList<Blog> listBlogbyCate = blogDB.getBlogsByCategory(Integer.parseInt(request.getParameter("categoryBlog")));
            request.setAttribute("listBlogbyCate", listBlogbyCate);
        }
        request.getRequestDispatcher("view/Blog/BlogList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
              BlogContext blogDB = new BlogContext();
        System.out.println(req.getParameter("searchBlog"));
        
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
