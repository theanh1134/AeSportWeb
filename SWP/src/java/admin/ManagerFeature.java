
package admin;

import DBContext.AdminDAO;
import Model.Feature;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;


@WebServlet(name = "ManagerFeature", urlPatterns = {"/managerfeature"})
public class ManagerFeature extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();
        if(request.getParameter("delete") != null){
            int feID = Integer.parseInt(request.getParameter("delete"));
            try {
                dao.deleteFeatureByID(feID);
            request.setAttribute("info", "Xóa chức năng thành công!");
            } catch (Exception e) {
                request.setAttribute("error", "Chức năng đang nằm trong vai trò không thể xóa!");
            }
            
        }
        ArrayList<Feature> list = dao.getAllFeature();
        request.setAttribute("list", list);
        request.getRequestDispatcher("admin/ManagerFeature.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fuName = request.getParameter("fuName");
        String url = request.getParameter("url");
        boolean key = true;
        try {
            AdminDAO dao = new AdminDAO();
            for (Feature f : dao.getAllFeature()) {
                if (f.getFu_Name().toLowerCase().equals(fuName.toLowerCase())) {
                    request.setAttribute("error", "Tên chức năng đã tồn tại!");
                    key = false;
                }

                if (f.getUrl().equals(url)) {
                    request.setAttribute("error", "Đường dẫn đã tồn tại!");
                    key = false;
                }
            }
            if (key) {
                dao.insertFeature(fuName, url);
                request.setAttribute("info", "Thêm chức năng thành công!");
            }
            ArrayList<Feature> list = dao.getAllFeature();
            request.setAttribute("list", list);
            request.getRequestDispatcher("admin/ManagerFeature.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println(e);
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
