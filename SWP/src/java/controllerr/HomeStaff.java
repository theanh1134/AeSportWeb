/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerr;

import Model.UserAccount;
import data.AuthorizationContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Hoàng Sơn
 */
public class HomeStaff extends HttpServlet {

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
        AuthorizationContext db = new AuthorizationContext();
        UserAccount account = (UserAccount) request.getSession().getAttribute("CRRAccount");

        if (account != null) {
            String role = db.getRole(account.getUse_ID());
            if ("admin".equals(role) || role.contains("nhan_vien")) {
                request.getRequestDispatcher("view/Homestaff/HomeStaff.jsp").forward(request, response);
            } else if ("user".equals(role)) {
                request.getRequestDispatcher("view/AccessInvalid.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("view/AccessInvalid.jsp").forward(request, response);
        }
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
