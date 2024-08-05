

package controllerr;

import DBContext.DAOProduct;
import Model.Product1;
import Model.SubCategory;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductController extends HttpServlet {
DAOProduct prodao = new DAOProduct();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy tham số sắp xếp và trang hiện tại từ request
        
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        // Tính tổng số sản phẩm và số trang
        int count = prodao.getTotalProduct();
        int endPage = count / 8;
        if (count % 8 != 0) {
            endPage++;
        }

        // Lấy danh sách sản phẩm theo trang và sắp xếp
        List<Product1> products = prodao.pagingProduct(index);
        List<SubCategory> subcategory = prodao.getAllsubcategory();
        List<Product1> last = prodao.getLast();

        // Đặt các tham số lên request
        request.setAttribute("listsub", subcategory);
        request.setAttribute("p", last);
        request.setAttribute("productLists", products);
        request.setAttribute("endPage", endPage);
        

        // Chuyển tiếp request tới trang JSP để hiển thị
        request.getRequestDispatcher("view/Productcate.jsp").forward(request, response);

    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}