package controllerr;

import DBContext.AccountDAO;
import DBContext.ProductDao;
import Model.Product;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ReportController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        AccountDAO dao = new AccountDAO();
        ProductDao productDAO = new ProductDao();
        try {
            // Báo cáo đăng kí
            int registrationsToday = dao.getRegistrationsToday();
            int registrationsThisWeek = dao.getRegistrationsThisWeek();
            int registrationsThisMonth = dao.getRegistrationsThisMonth();
          

            request.setAttribute("registrationsToday", registrationsToday);
            request.setAttribute("registrationsThisWeek", registrationsThisWeek);
            request.setAttribute("registrationsThisMonth", registrationsThisMonth);
          
          


            switch (action) {
                case "registrationReport":
                    handleRegistrationReport(request, response, dao);
                    break;
                case "activityReport":
                   
                    break;
                case "customActivityReport":
                    
                    break;
                
                default:
                    request.setAttribute("error", "Invalid action.");
                    request.getRequestDispatcher("/WEB-INF/error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/error.jsp").forward(request, response);
        }
    }

    private void handleRegistrationReport(HttpServletRequest request, HttpServletResponse response, AccountDAO dao)
            throws ServletException, IOException {
        Map<String, Integer> report = dao.getAllUserRegistrationReport();
        request.setAttribute("registrationReport", report);
        request.getRequestDispatcher("/admin/registrationReport.jsp").forward(request, response);
    }

    
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
