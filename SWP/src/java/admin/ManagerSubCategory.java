package admin;

import DBContext.AdminDAO;
import Model.SubCategory;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class ManagerSubCategory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();

        // Xử lý việc xóa thể loại con
        if (request.getParameter("delete") != null) {
            int sid = Integer.parseInt(request.getParameter("delete"));
            try {
                dao.deleteSubCategoryByID(sid);
                request.setAttribute("info", "Xóa thể loại con thành công!");
            } catch (Exception e) {
                request.setAttribute("error", "Thể loại đang được (sản phẩn) sử dụng không thể xóa!");
            }
        }

        // Lấy danh sách category và type
        ArrayList<SubCategory> list = dao.getAllSubCategory();
        ArrayList<Integer> listCategory = dao.getAllCategoryOfSubCategory();

        // Xử lý lọc category nếu tham số 'op' khác "all"
        if (request.getParameter("op") != null && Integer.parseInt(request.getParameter("op")) != 0) {
            int op = Integer.parseInt(request.getParameter("op"));
            ArrayList<SubCategory> filteredList = new ArrayList<>();
            for (SubCategory s : list) {
                if (s.getCategory_ID() == op) {
                    filteredList.add(s);
                }
            }
            list = filteredList;
        }

        // Đặt các thuộc tính cần thiết và chuyển tiếp yêu cầu đến trang JSP
        request.setAttribute("list", list);
        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("admin/ManagerSubCategory.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();
        String name = request.getParameter("subcategoryname");
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        if (dao.getSubCategoryByNameAndCategoryID(name, categoryID) == null) {
            dao.insertSubCategory(name, categoryID);
            request.setAttribute("info", "Thêm thể loại con thành công!");
        } else {

            request.setAttribute("error", "Tên thể loại con đã có danh mục " + dao.getCategoryByID(categoryID) + "!");
        }
        ArrayList<SubCategory> list = dao.getAllSubCategory();
        ArrayList<Integer> listCategory = dao.getAllCategoryOfSubCategory();
        request.setAttribute("list", list);
        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("admin/ManagerSubCategory.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
