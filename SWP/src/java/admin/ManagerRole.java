/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import DBContext.AdminDAO;
import Model.Role;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class ManagerRole extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManagerRole</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerRole at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();
        
        if(request.getParameter("delete") != null){
            int roleID = Integer.parseInt(request.getParameter("delete"));
            try {
                dao.deleteRoleFeatureByID(roleID);
                dao.deleteRoleByID(roleID);
                request.setAttribute("info", "Xóa vai trò thành công!");
            } catch (Exception e) {
                 request.setAttribute("error", "Vai trò đang được sử dụng không thể xóa!");
            }
            
        }
        
        if(request.getParameter("update") != null){
            int roleID = Integer.parseInt(request.getParameter("update")); 
            request.setAttribute("info", "Update vai trò (ID:"+roleID+") thành công!");
        }
        ArrayList<Role> list = dao.getAllRole();
        request.setAttribute("list", list);
        request.getRequestDispatcher("admin/ManagerRole.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();

        String roleName = request.getParameter("rolename");
        Role roleTemp = dao.getRoleByName(roleName.toLowerCase());
        if (roleTemp == null) {
            dao.insertRole(roleName.toLowerCase());
            request.setAttribute("info", "Thêm vai trò thàng công!");
        }else{
            request.setAttribute("error", "Tên chức năng đã tồn tại!");
        }
        ArrayList<Role> list = dao.getAllRole();
        request.setAttribute("list", list);
        request.getRequestDispatcher("admin/ManagerRole.jsp").forward(request, response);
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
