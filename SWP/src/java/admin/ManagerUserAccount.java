

package admin;

import DBContext.AdminDAO;
import Model.UserAccount;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class ManagerUserAccount extends HttpServlet {
   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();
        if(request.getParameter("role")!=null){
            int uID = Integer.parseInt(request.getParameter("role"));
            request.setAttribute("info", "Chỉnh sửa vai trò tài khoản(ID:"+uID+") thành công!");
        }
        
        if(request.getParameter("edit")!=null){
            int uID = Integer.parseInt(request.getParameter("edit"));
            request.setAttribute("info", "Chỉnh sửa tài khoản(ID:"+uID+") thành công!");
        }
        // Lấy danh sách tài khoản người dùng hiển thị lên trang ManagerUserAccount.jsp
        ArrayList<UserAccount> list = dao.getAllUserAccount();
        request.setAttribute("list", list); 
        request.getRequestDispatcher("admin/ManagerUserAccount.jsp").forward(request, response);
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String fullName = request.getParameter("fullname");
        AdminDAO dao = new AdminDAO();
        // Lấy danh sách người dùng theo fullname (search)
        ArrayList<UserAccount> list = dao.searchUserAccount(fullName);
        request.setAttribute("list", list); 
             
        request.getRequestDispatcher("admin/ManagerUserAccount.jsp").forward(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
