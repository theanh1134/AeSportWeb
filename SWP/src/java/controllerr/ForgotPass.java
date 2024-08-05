/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerr;

import DBContext.AccountDAO;
import Service.Email;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hoàng Sơn
 */
public class ForgotPass extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("view/ForgotPass.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            ForgetPasswork(req, resp);
        } catch (Exception ex) {
            Logger.getLogger(ForgotPass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void ForgetPasswork(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        AccountDAO ADAO = new AccountDAO();
        String message = "";
        String emailForgot = request.getParameter("emailReset");
        int newAccID = ADAO.GetAccountByEmail(emailForgot);
        if (newAccID != 0) {

            // gửi email tới địa chỉ mail vừa được đăng ký
            String bodyMail = "Click this link to reset your account: http://localhost:9999/SWP/Account?Action=RQResetPassword&AccountId=" + newAccID;
            Email.sendEmail(emailForgot, "Request To Reset your account password", bodyMail);
            message = "Reset Thành Công! Vui lòng kiểm tra mail";
            request.setAttribute("message", message);
            request.getRequestDispatcher("view/Login.jsp").forward(request, response);

        } else {
            message = "Email chưa tồn tại!";
            request.setAttribute("message", message);
            request.getRequestDispatcher("view/ForgotPass.jsp").forward(request, response);
        }

    }
}
