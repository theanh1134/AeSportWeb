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
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class SearchProduct extends HttpServlet {

    DAOProduct prodao = new DAOProduct();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");

        if (keyword != null && !keyword.isEmpty()) {
            // Chuyển đổi từ khóa tìm kiếm sang dạng không phân biệt chữ hoa chữ thường
            String searchKeyword = keyword.toLowerCase().trim();

            // Gọi DAO để lấy danh sách sản phẩm theo từ khóa
            List<Product1> products = null;
            try {
                products = prodao.searchProducts(searchKeyword);
            } catch (SQLException ex) {
                Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
                // Xử lý ngoại lệ nếu cần thiết
            }

            List<Product1> last = prodao.getLast();
            List<SubCategory> subcategory = prodao.getAllsubcategory();

            // Đẩy danh sách sản phẩm mới nhất và danh sách các danh mục con lên request để sử dụng trong JSP
            request.setAttribute("p", last);
            request.setAttribute("listsub", subcategory);

            // Đẩy danh sách sản phẩm lấy được lên request để sử dụng trong JSP
            request.setAttribute("productLists", products);

            // Forward request và response tới trang JSP để hiển thị kết quả
            request.getRequestDispatcher("view/Productcate.jsp").forward(request, response);

        }
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
