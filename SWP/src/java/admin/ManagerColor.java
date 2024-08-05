/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import DBContext.AdminDAO;
import Model.Color;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class ManagerColor extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();
        if (request.getParameter("delete") != null) {
            try {
                int cid = Integer.parseInt(request.getParameter("delete"));
                dao.deleteColorByID(cid);
                request.setAttribute("info", "Xóa màu thành công!");
            } catch (Exception e) {
                request.setAttribute("error", "Màu đang được (sản phẩm) sử dụng không thể xóa!");
            }
        }
        ArrayList<Color> list = dao.getAllColor();
        request.setAttribute("list", list);
        request.getRequestDispatcher("admin/ManagerColor.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();
        if (dao.getColorByName(request.getParameter("colorname")) == null) {
            dao.insertColor(request.getParameter("colorname"),request.getParameter("colorcode"));
            request.setAttribute("info", "Thêm màu thành công!");
        } else {
            request.setAttribute("error", "Màu đã tồn tại!");
        }
        ArrayList<Color> list = dao.getAllColor();
        request.setAttribute("list", list);
        request.getRequestDispatcher("admin/ManagerColor.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
