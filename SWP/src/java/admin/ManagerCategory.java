package admin;

import DBContext.AdminDAO;
import Model.Category;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class ManagerCategory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();

        // Xử lý việc xóa thể loại
        if (request.getParameter("delete") != null) {
            int cid = Integer.parseInt(request.getParameter("delete"));
            try {
                dao.deleteCategoryByID(cid);
                request.setAttribute("info", "Xóa danh mục thành công!");
            } catch (Exception e) {
                request.setAttribute("error", "Danh mục đang được (thể loại con) sử dụng không thể xóa!");
            }

        }

        // Lấy danh sách category và type
        ArrayList<Category> list = dao.getAllCategory();
        ArrayList<String> listType = dao.getAllTypeCategory();

        // Xử lý lọc category nếu tham số 'op' khác "all"
        if (request.getParameter("op") != null && !request.getParameter("op").equals("all")) {
            String op = request.getParameter("op");
            ArrayList<Category> filteredList = new ArrayList<>();
            for (Category s : list) {
                if (s.getType().equals(op)) {
                    filteredList.add(s);
                }
            }
            list = filteredList;
        }

        // Đặt các thuộc tính cần thiết và chuyển tiếp yêu cầu đến trang JSP
        request.setAttribute("list", list);
        request.setAttribute("listType", listType);
        request.getRequestDispatcher("admin/ManagerCategory.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();
        String name = request.getParameter("categoryname");
        String type = request.getParameter("type");
        if (dao.getCategoryByNameAndType(name, type) == null) {
            dao.insertCategory(name, type);
            request.setAttribute("info", "Thêm danh mục thành công!");
        } else {
            request.setAttribute("error", "Tên danh mục đã có trong kiểu " + type + "!");
        }
        ArrayList<Category> list = dao.getAllCategory();
        ArrayList<String> listType = dao.getAllTypeCategory();
        request.setAttribute("list", list);
        request.setAttribute("listType", listType);
        request.getRequestDispatcher("admin/ManagerCategory.jsp").forward(request, response);
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
