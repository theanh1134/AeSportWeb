package admin;

import DBContext.AdminDAO;
import entity.sport;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class ManagerSport extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();

        // Xử lý việc xóa môn thể thao
        if (request.getParameter("delete") != null) {
            try {
                int bid = Integer.parseInt(request.getParameter("delete"));
                dao.deleteSportByID(bid);
                request.setAttribute("info", "Xóa môn thể thao thành công!");
            } catch (Exception e) {
                request.setAttribute("error", "Môn thể thao đang được (sản phẩm) sử dụng không thể xóa!");
            }
        }

        // Lấy danh sách môn thể thao và tên môn thể thao
        ArrayList<sport> list = dao.getAllSport();
        ArrayList<String> listName = dao.getAllNameSport();

        // Xử lý lọc môn thể thao nếu tham số 'op' khác "all"
        if (request.getParameter("op") != null && !request.getParameter("op").equals("all")) {
            String op = request.getParameter("op");
            ArrayList<sport> filteredList = new ArrayList<>();
            for (sport s : list) {
                if (s.getSport_Name().equals(op)) {
                    filteredList.add(s);
                }
            }
            list = filteredList;
        }

        // Đặt các thuộc tính cần thiết và chuyển tiếp yêu cầu đến trang JSP
        request.setAttribute("list", list);
        request.setAttribute("listName", listName);
        request.getRequestDispatcher("admin/ManagerSport.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();
        String name = request.getParameter("sportname");
        String clb = request.getParameter("clbname");
        if (dao.getSportByNameAndClb(name, clb) == null) {
            dao.insertSport(name, clb);
            request.setAttribute("info", "Thêm môn thể thao thành công!");
        } else {
            request.setAttribute("error", "Tên CLB đã có trong môn thể thao!");
        }
        ArrayList<sport> list = dao.getAllSport();
        ArrayList<String> listName = dao.getAllNameSport();
        request.setAttribute("list", list);
        request.setAttribute("listName", listName);
        request.getRequestDispatcher("admin/ManagerSport.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
