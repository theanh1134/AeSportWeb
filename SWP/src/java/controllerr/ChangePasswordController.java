package controllerr;

import DBContext.AccountDAO;
import Model.UserAccount;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ChangePasswordController extends HttpServlet {

    private AccountDAO ADAO;

    @Override
    public void init() throws ServletException {
        ADAO = new AccountDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // This method is not needed for now.
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("view/ViewProfile.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String newPassword = request.getParameter("pass");
        String userName = request.getParameter("uName");
        String oldPassword = request.getParameter("oldpass");
        String confirmPassword = request.getParameter("repass");

        UserAccount user = ADAO.CheckLogin(userName, oldPassword);
        if (user == null) {
            // Old password incorrect
            String mess = "Old password incorrect! Please enter again...";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("view/ViewProfile.jsp").forward(request, response);
        } else {
            // Old password correct
            if (!newPassword.equals(confirmPassword)) {
                String mess1 = "New password and confirmation password do not match! Please enter again...";
                request.setAttribute("mess1", mess1);
                request.getRequestDispatcher("view/ViewProfile.jsp").forward(request, response);
            } else {
                ADAO.change(newPassword, userName);
                String mess2 = "Password changed successfully!";
                request.setAttribute("mess2", mess2);
                request.getRequestDispatcher("view/ViewProfile.jsp").forward(request, response);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
