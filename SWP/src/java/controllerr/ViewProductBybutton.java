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
public class ViewProductBybutton extends HttpServlet {

    DAOProduct prodao = new DAOProduct();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy giá trị của tham số sort từ request
        String sortMethod = request.getParameter("sort");
        String sortType = request.getParameter("sortType");

        // Thực hiện các xử lý cần thiết dựa trên giá trị của sortMethod và sortType
        List<Product1> productList = null;
        if ("popularity".equals(sortMethod)) {
            // Lấy danh sách sản phẩm phổ biến từ DAO
            productList = prodao.getPopularProducts();
        } else if ("newest".equals(sortMethod)) {
            // Lấy danh sách sản phẩm mới nhất từ DAO
            productList = prodao.getNewestProducts();
        } else if ("best_selling".equals(sortMethod)) {
            // Lấy danh sách sản phẩm bán chạy từ DAO
            productList = prodao.getBestSellingProducts();
        } else if ("price".equals(sortType)) {
            // Lấy danh sách sản phẩm sắp xếp theo giá từ thấp đến cao từ DAO
            productList = prodao.getProductsSortedByPriceAsc();
        } else if ("price_asc".equals(sortType)) {
            // Lấy danh sách sản phẩm sắp xếp theo giá từ thấp đến cao từ DAO
            productList = prodao.getProductsSortedByPriceAsc();
        } else if ("price_desc".equals(sortType)) {
            // Lấy danh sách sản phẩm sắp xếp theo giá từ cao đến thấp từ DAO
            productList = prodao.getProductsSortedByPriceDesc();
        } else {
            // Mặc định khi không có tham số sort hoặc sortType được chọn
            productList = prodao.getDefaultProductList();
        }

        // Lấy danh sách sản phẩm mới nhất và danh sách các danh mục con từ DAO
        List<Product1> last = prodao.getLast();
        List<SubCategory> subcategory = prodao.getAllsubcategory();

        // Đẩy danh sách sản phẩm mới nhất và danh sách các danh mục con lên request để sử dụng trong JSP
        request.setAttribute("p", last);
        request.setAttribute("listsub", subcategory);

        // Đẩy danh sách sản phẩm lấy được lên request để sử dụng trong JSP
        request.setAttribute("productLists", productList);

        // Forward request và response tới trang JSP để hiển thị kết quả
        request.getRequestDispatcher("view/Productcate.jsp").forward(request, response);
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
        String sortMethod = request.getParameter("sort");
        String sortType = request.getParameter("sortType");

        // Thực hiện các xử lý cần thiết dựa trên giá trị của sortMethod và sortType
        List<Product1> productList = null;
        if ("popularity".equals(sortMethod)) {
            // Lấy danh sách sản phẩm phổ biến từ DAO
            productList = prodao.getPopularProducts();
        } else if ("newest".equals(sortMethod)) {
            // Lấy danh sách sản phẩm mới nhất từ DAO
            productList = prodao.getNewestProducts();
        } else if ("best_selling".equals(sortMethod)) {
            // Lấy danh sách sản phẩm bán chạy từ DAO
            productList = prodao.getBestSellingProducts();
        } else if ("price".equals(sortType)) {
            // Lấy danh sách sản phẩm sắp xếp theo giá từ thấp đến cao từ DAO
            productList = prodao.getProductsSortedByPriceAsc();
        } else if ("price_asc".equals(sortType)) {
            // Lấy danh sách sản phẩm sắp xếp theo giá từ thấp đến cao từ DAO
            productList = prodao.getProductsSortedByPriceAsc();
        } else if ("price_desc".equals(sortType)) {
            // Lấy danh sách sản phẩm sắp xếp theo giá từ cao đến thấp từ DAO
            productList = prodao.getProductsSortedByPriceDesc();
        } else {
            // Mặc định khi không có tham số sort hoặc sortType được chọn
            productList = prodao.getDefaultProductList();
        }

        // Lấy danh sách sản phẩm mới nhất và danh sách các danh mục con từ DAO
        List<Product1> last = prodao.getLast();
        List<SubCategory> subcategory = prodao.getAllsubcategory();

        // Đẩy danh sách sản phẩm mới nhất và danh sách các danh mục con lên request để sử dụng trong JSP
        request.setAttribute("p", last);
        request.setAttribute("listsub", subcategory);

        // Đẩy danh sách sản phẩm lấy được lên request để sử dụng trong JSP
        request.setAttribute("productLists", productList);

        // Forward request và response tới trang JSP để hiển thị kết quả
        request.getRequestDispatcher("view/Productcate.jsp").forward(request, response);
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
