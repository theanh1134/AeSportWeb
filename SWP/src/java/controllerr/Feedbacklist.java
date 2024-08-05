/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerr;

import DBContext.DAOFeedback;
import Model.Feedback;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class Feedbacklist extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAOFeedback daofb = new DAOFeedback();
        ArrayList<Feedback> feedback = daofb.list();
        String indexPage = request.getParameter("index");

        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        int count = daofb.gettotalfeedback();
        int endPage = count / 5;
        if (count % 5 != 0) {
            endPage++;
        }
        List<Feedback> list = daofb.pagingFeedback(index);
        request.setAttribute("listA", list);
        request.setAttribute("endPage", endPage);
        request.setAttribute("feedback", feedback);
        request.getRequestDispatcher("view/feedbacklist.jsp").forward(request, response);
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
        String username = request.getParameter("username");
        List<Feedback> fb = null;
        DAOFeedback daofb = new DAOFeedback();

        if (username != null && !username.trim().isEmpty()) {
            try {
                fb = daofb.getFeedbacksByUsername(username);
            } catch (Exception ex) {
            }
        } else {
            try {
                fb = daofb.list();
            } catch (Exception ex) {
            }
        }
        System.out.println(username);
        request.setAttribute("listA", fb);
        request.getRequestDispatcher("view/feedbacklist.jsp").forward(request, response);
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
