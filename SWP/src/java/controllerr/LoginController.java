/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerr;

import DBContext.AccountDAO;
import DBContext.AdminDAO;
import Model.UserAccount;
import Service.Email;
import com.sun.source.tree.BreakTree;
import data.AuthorizationContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Laptop K1
 */
public class LoginController extends HttpServlet {

    private void Login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        AuthorizationContext AuthorizationDB = new AuthorizationContext();
        AccountDAO ADAO = new AccountDAO();
        String pass = request.getParameter("password");
        String uName = request.getParameter("username");
        UserAccount U = ADAO.CheckLogin(uName, pass);

        if (U != null) {
            if ("active".equals(U.getStatus())) {
                request.getSession().setAttribute("CRRAccount", U);
                if ("admin".equals(AuthorizationDB.getRole(U.getUse_ID()))) {
                    response.sendRedirect("report?action=registrationReport");
                }
                if ("user".equals(AuthorizationDB.getRole(U.getUse_ID()))) {
                    response.sendRedirect("HomePage");
                }
                if (AuthorizationDB.getRole(U.getUse_ID()).contains("nhan_vien")) {
                    response.sendRedirect("HomeStaff");
                }
            } else {
                request.setAttribute("message", "Tài khoản chưa được xác minh.");
                request.getRequestDispatcher("view/Login.jsp").forward(request, response);
            }

        } else {
            request.setAttribute("message", "Sai tên đăng nhập hoặc nhập khẩu! Vui lòng kiểm tra lại.");
            request.getRequestDispatcher("view/Login.jsp").forward(request, response);
        }
    }

    private void Register(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        AdminDAO adminDao = new AdminDAO();
        AccountDAO ADAO = new AccountDAO();
        String userName = request.getParameter("username");
        String userPhone = request.getParameter("numberphone");
        String address = request.getParameter("address");
        String userEmail = request.getParameter("email");
        String fullName = request.getParameter("fullname");
        String password = request.getParameter("password");
        String confirm_password = request.getParameter("confirm-password");
        String message = "";
        if (!password.equals(confirm_password)) {
            message = "Mật khẩu không khớp!";
        } else if (ADAO.GetAccountByEmail(userEmail) > 0) {
            message = "Email đã tồn tại, ";
        } else if (ADAO.validateUserName(userName)) {
            message = "tên đăng nhập  đã tồn tại";
        } else {
            LocalDate currentDate = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
            String formattedDate = currentDate.format(formatter);

            // Parse the date
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            java.util.Date utilDate = sdf.parse(formattedDate);
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

            UserAccount uA = new UserAccount();
            uA.setUserName(userName);
            uA.setAddress(address);
            uA.setFull_Name(fullName);
            uA.setEmail(userEmail);
            uA.setPhone_number(userPhone);
            uA.setPassword(confirm_password);
            uA.setDateCreate(sqlDate);

            int newIdInsert = ADAO.insertUserAccount(uA);
            if (newIdInsert > 0) {
                message = "Vui lòng xác nhận email! và đăng nhập lại";
                Email.sendEmail(userEmail, "AESport, Active you account", "Click this link to active your account: http://localhost:9999/SWP/Account?Action=ActiveAccount&AccountId=" + newIdInsert);
                adminDao.insertUserRole(newIdInsert, 6);
                request.setAttribute("message", message);
                request.getRequestDispatcher("view/Login.jsp").forward(request, response);

            }
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("view/Register.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/Login.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("login".equals(action)) {
            try {
                Login(request, response);
            } catch (Exception ex) {
                Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if ("register".equals(action)) {
            try {
                Register(request, response);
            } catch (Exception ex) {
                Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
