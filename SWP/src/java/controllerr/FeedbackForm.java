/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerr;

import DBContext.DAOFeedback;
import Model.Feedback;
import Model.UserAccount;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.catalina.User;

/**
 *
 * @author Admin
 */
public class FeedbackForm extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/feedbackphanhoi.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String detal = request.getParameter("reviewDetail");
        String start = request.getParameter("rating");
        String img = request.getParameter("fileName");

        // Lấy thông tin từ session
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("CRRAccount") != null) {
            UserAccount user = (UserAccount) session.getAttribute("CRRAccount");
            int use_ID = user.getUse_ID(); // Giả sử User có phương thức getUserId()

            // Lưu dữ liệu vào cơ sở dữ liệu qua DAO
            DAOFeedback daofb = new DAOFeedback();
            try {
                System.out.println(use_ID);
                System.out.println(detal);
                System.out.println(start);
                System.out.println(img);
                daofb.saveFeedback(use_ID, detal, start, img);
                response.sendRedirect("feedback2");
            } catch (java.sql.SQLException ex) {
                Logger.getLogger(FeedbackForm.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            // Người dùng chưa đăng nhập
            response.sendRedirect("view/Login.jsp");
        }
    }

}
