package admin;

import DBContext.AdminDAO;
import Model.EmployeeAccount;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class ManagerEmployeeAccount extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();
        if (request.getParameter("role") != null) {
            if (request.getParameter("role").equals("admin")) {
                request.setAttribute("error", "Không thể chỉnh sửa Role của tài khoản (admin gốc)!");
            } else {
                int uID = Integer.parseInt(request.getParameter("role"));
                request.setAttribute("info", "Chỉnh sửa vai trò tài khoản(ID:" + uID + ") thành công!");
            }

        }
        
        if(request.getParameter("edit")!=null){
            int uID = Integer.parseInt(request.getParameter("edit"));
            request.setAttribute("info", "Chỉnh sửa tài khoản(ID:"+uID+") thành công!");
        }
        
        ArrayList<EmployeeAccount> list = dao.getAllEmployeeAccount();
        request.setAttribute("list", list);
        request.getRequestDispatcher("admin/ManagerEmployeeAccount.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = request.getParameter("fullname");
        AdminDAO dao = new AdminDAO();
        ArrayList<EmployeeAccount> list = dao.searchEmployeeAccount(fullName);
        request.setAttribute("list", list);
        request.getRequestDispatcher("admin/ManagerEmployeeAccount.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
