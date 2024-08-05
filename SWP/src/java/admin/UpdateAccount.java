package admin;

import DBContext.AdminDAO;
import Model.Role;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class UpdateAccount extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Kiểm tra null của biến uID
        if (request.getParameter("uID") != null) {

            AdminDAO dao = new AdminDAO();
            int id = Integer.parseInt(request.getParameter("uID"));// Lấy Id từ trang quản lý người dùng       
            ArrayList<Role> list = dao.getAllRole();// Lấy danh sách role để update
            request.setAttribute("list", list);
            request.getRequestDispatcher("admin/UpdateUserAccount.jsp?uID="+id).forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();

        try {
            int uid = Integer.parseInt(request.getParameter("uID"));

            if (uid != 1) { // Nếu tk update không phải là tk admin gốc
                int roleid = Integer.parseInt(request.getParameter("role")); // lấy roleID
                if (request.getParameter("role").equals("6")) { // kiểm tra role bằng "user" thì xóa role của tk trong bảng UserRole
                    dao.deleteUserRole(uid);
                    dao.insertUserRole(uid, roleid);
                    response.sendRedirect(request.getContextPath() + "/manageruseraccount?role="+uid);

                } else {
                    dao.deleteUserRole(uid);// xóa role cũ
                    dao.insertUserRole(uid, roleid);// update role mơi
                    response.sendRedirect(request.getContextPath() + "/manageremployeeaccount?role="+uid);

                }
            } else {
                // trở về trang quản lý nhân viên và thông báo
                response.sendRedirect(request.getContextPath() + "/manageremployeeaccount?role=admin");
            }

        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/manageruseraccount");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
