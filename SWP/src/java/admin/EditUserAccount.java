package admin;

import DBContext.AdminDAO;
import Model.Address;
import Model.UserAccount;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class EditUserAccount extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();
        int id = Integer.parseInt(request.getParameter("uID"));
        UserAccount user = dao.getUserAccountByUserID(id);
        request.setAttribute("user", user);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/manageruseraccount");
        } else {
            ArrayList<Address> adrList = dao.getAddressByUserID(id);
            request.setAttribute("adrList", adrList);
            request.getRequestDispatcher("admin/EditUserAccount.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            AdminDAO dao = new AdminDAO();
            int userId = Integer.parseInt(request.getParameter("uid"));
            String fullName = request.getParameter("fname");
            String userName = request.getParameter("uname");
            String password = request.getParameter("pword");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String img1 = request.getParameter("img1");
            String img2 = request.getParameter("img2");
            String img = img1;
            String address = request.getParameter("address");

            String error = "";

            UserAccount user = dao.getUserAccountByUserName(userName);
            if (user != null && !dao.getUserAccountByUserID(userId).getUserName().equals(userName)) {
                error += "e";
                request.setAttribute("error1", "UserName: (" + userName + ") đã tồn tại!");
            }
            user = dao.getUserAccountByEmail(email);
            if (user != null && !dao.getUserAccountByUserID(userId).getEmail().equals(email)) {
                error += "e";
                request.setAttribute("error2", "Email: (" + email + ") đã tồn tại!");
            }
            if (error.equals("")) {
                if (img1.trim().isEmpty()) {
                    img = img2;
                }
                UserAccount userTemp = new UserAccount(userId, password, userName, fullName, email, phone, img);
                dao.updateUserAccount(userTemp, address);

                if (dao.getUserRoleByUserID(userId).getRoleID() != 6) {
                    response.sendRedirect(request.getContextPath() + "/manageremployeeaccount?edit=" + userId);
                } else {
                    response.sendRedirect(request.getContextPath() + "/manageruseraccount?edit=" + userId);
                }

            } else {
                user = dao.getUserAccountByUserID(userId);
                request.setAttribute("user", user);
                request.getRequestDispatcher("admin/EditUserAccount.jsp").forward(request, response);

            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
