
package admin;

import DBContext.AdminDAO;
import Model.Feature;
import Model.Role;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;


public class UpdateRole extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO dao = new AdminDAO();
        try {
            int rID = Integer.parseInt(request.getParameter("rID"));
            ArrayList<Feature> list = dao.getAllFeature();
            ArrayList<Feature> roleFeatures = dao.getAllFeatureOfRole(rID);
            String nameRole = dao.getRoleNameByID(rID);
            request.setAttribute("list", list);
            request.setAttribute("roleFeatures", roleFeatures);
            request.setAttribute("nameRole", nameRole);
            request.getRequestDispatcher("admin/UpdateRole.jsp").forward(request, response);

        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/managerrole");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
        String roleName = request.getParameter("nameRole");
        String[] selectedFeatures = request.getParameterValues("features");
        AdminDAO dao = new AdminDAO();
        Role role = dao.getRoleByName(roleName);  
        dao.deleteRoleFeatureByID(role.getRoleID());
        if(selectedFeatures !=null){
            
             for (int i = 0; i < selectedFeatures.length; i++) {
                int feID = Integer.parseInt(selectedFeatures[i]);
                 
                dao.insertRoleFeature(feID, role.getRoleID());
            }
           
        }
        response.sendRedirect(request.getContextPath() + "/managerrole?update="+role.getRoleID());
        } catch (Exception e) {
            System.out.println(e);
        }
        
                
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
