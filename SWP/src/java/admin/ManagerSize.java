package admin;

import DBContext.AdminDAO;
import Model.Size;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class ManagerSize extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();
        if (request.getParameter("delete") != null) {
            try {
                int sid = Integer.parseInt(request.getParameter("delete"));
                dao.deleteSizeByID(sid);
                request.setAttribute("info", "Xóa kích cỡ thành công!");
            } catch (Exception e) {
                request.setAttribute("error", "Kích cỡ đang được (sản phẩm) sử dụng không thể xóa!");

            }
        }
        ArrayList<Size> list = dao.getAllSize();
        request.setAttribute("list", list);
        request.getRequestDispatcher("admin/ManagerSize.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();
        String sizetype = request.getParameter("sizetype");
        String sizename = request.getParameter("sizename");
        ArrayList<Size> list;

        if (sizetype.equals("Number")) {
            try {
                Integer.parseInt(sizename);
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Sai định dạng!");
                list = dao.getAllSize();
                request.setAttribute("list", list);
                request.setAttribute("sizetype", sizetype);
                request.getRequestDispatcher("admin/ManagerSize.jsp").forward(request, response);
                return;
            }
        }

        if (dao.getSizeByName(sizename) == null) {
            dao.insertSize(sizename, sizetype);
            request.setAttribute("info", "Thêm kích cỡ thành công!");
        } else {
            request.setAttribute("error", "Kích cỡ đã tồn tại!");
        }

        list = dao.getAllSize();
        request.setAttribute("list", list);
        request.getRequestDispatcher("admin/ManagerSize.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
