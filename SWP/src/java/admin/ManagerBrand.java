package admin;

import DBContext.AdminDAO;
import entity.Brand;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class ManagerBrand extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();
        if (request.getParameter("delete") != null) {
            try {
                int bid = Integer.parseInt(request.getParameter("delete"));
                dao.deleteBrandByID(bid);
                request.setAttribute("info", "Xóa thương hiệu thành công!");
            } catch (Exception e) {
                request.setAttribute("error", "Thương hiệu đang được (sản phẩm) sử dụng không thể xóa!");
            }
        }
        ArrayList<Brand> list = dao.getAllBrand();
        request.setAttribute("list", list);
        request.getRequestDispatcher("admin/ManagerBrand.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();
        if (dao.getBrandByName(request.getParameter("brandname")) == null) {
            dao.insertBrand(request.getParameter("brandname"));
            request.setAttribute("info", "Thêm thương hiệu thành công!");
        } else {
            request.setAttribute("error", "Tên thương hiệu đã tồn tại!");
        }
        ArrayList<Brand> list = dao.getAllBrand();
        request.setAttribute("list", list);
        request.getRequestDispatcher("admin/ManagerBrand.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
