/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerr;

import DBContext.AccountDAO;
import DBContext.AdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.lang.System.Logger;
import java.lang.System.Logger.Level;

/**
 *
 * @author Laptop K1
 */
public class AccountController extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("Action");
        switch (action) {
            case "ActiveAccount":
                ActiveAccount(request, response);
                break;
            case "RQResetPassword":
                RQResetPassword(request, response);
                break;
            case "ResetPassword":
                ResetPassword(request, response);
                break;
        }
    }

    private void ActiveAccount(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        request.setAttribute("MessageActive", "Your account was activated");
        AdminDAO db = new AdminDAO();
        db.updateStatusAccount(Integer.parseInt(request.getParameter("AccountId")), "active");
        request.getRequestDispatcher("view/AccountAction.jsp").forward(request, response);
    }

    private void ResetPassword(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        int AccountId = Integer.parseInt(request.getParameter("AccountId"));
        String newPass = request.getParameter("NewPass");
        System.out.println(newPass);
        AccountDAO ao = new AccountDAO();
        ao.updateUserAccount(newPass, AccountId);
        request.setAttribute("AccountId", "Your account was activated");
        request.setAttribute("MessageActive", "Your pass change successful");
        request.getRequestDispatcher("view/AccountAction.jsp").forward(request, response);
    }

    private void RQResetPassword(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        String decryptedText = request.getParameter("AccountId");
        int AccountId = Integer.parseInt(decryptedText);
        request.setAttribute("AccountId", AccountId);
        request.setAttribute("MessageReset", true);
        request.getRequestDispatcher("view/AccountAction.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(AccountController.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            processRequest(request, response);
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(AccountController.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
