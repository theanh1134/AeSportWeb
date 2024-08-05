/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import DBContext.AdminDAO;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class AddProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AdminDAO dao = new AdminDAO();
        request.setAttribute("listCategory", dao.getAllSubCategory());
        request.setAttribute("listColor", dao.getAllColor());
        request.setAttribute("listSize", dao.getAllSize());
        request.setAttribute("listSport", dao.getAllSport());
        request.setAttribute("listBrand", dao.getAllBrand());
        request.setAttribute("num", request.getParameter("num"));
        request.getRequestDispatcher("admin/AddProduct.jsp").forward(request, response);
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
        AdminDAO dao = new AdminDAO();
        boolean keyCheck = true;
        String productName = request.getParameter("pname");
        String image = request.getParameter("image");
        if(image.trim().isEmpty()){    
            image = "no.webp";
        }
                
        String status = request.getParameter("status");
        String description = request.getParameter("description");

        int subcategoryID = 0;
        double price = 0;
        int sportID = 0;
        int brandID = 0;
        double importPrice = 0;
        
        try {
            subcategoryID = Integer.parseInt(request.getParameter("category"));
            sportID = Integer.parseInt(request.getParameter("sport"));
            brandID = Integer.parseInt(request.getParameter("brand"));
            price = Double.parseDouble(request.getParameter("price"));
            importPrice = Double.parseDouble(request.getParameter("import_price"));
        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        // kiem tra ten san pham ton tai chua
        Product productCheck = dao.getProductByName(productName);
        if (productCheck != null) {
            request.setAttribute("error1", "Tên sản phẩm đã tồn tại!");
            keyCheck = false;
        }

        if (keyCheck) {
            Product p = new Product(price, description, status, sportID, productName, brandID, subcategoryID, importPrice);
            int n = 1;
            try {
                System.out.println(sportID);
                dao.insertProduct(p);
                
            } catch (Exception e) {
                System.out.println(e);
                n = 0;
            }
            // insert product
            if (n == 1) {

                int productID = dao.getLastInsertedProductId();
                // insert anh
                dao.insertImgProduct(image, productID);

                //lay mau va size cua san pham de insert
                int numColors = Integer.parseInt(request.getParameter("num"));
                for (int i = 1; i <= numColors; i++) {
                    int color = Integer.parseInt(request.getParameter("color" + i));

                    String[] sizes = request.getParameterValues("size" + i);
                    String[] quantities = request.getParameterValues("num" + i);

                    ArrayList<String> sizeList = new ArrayList<>();
                    if (sizes != null) {
                        for (String size : sizes) {
                            if (size != null && !size.trim().isEmpty()) {
                                sizeList.add(size.trim());
                            }
                        }
                    }

                    ArrayList<String> quantityList = new ArrayList<>();
                    if (quantities != null) {
                        for (String quantity : quantities) {
                            if (quantity != null && !quantity.trim().isEmpty()) {
                                quantityList.add(quantity.trim());
                            }
                        }
                    }

                    // Gọi hàm insertColorSize để chèn dữ liệu vào cơ sở dữ liệu
                    insertColorSize(color, sizeList, quantityList, productID);
                }

                dao.updateAmountProduct();
                response.sendRedirect("managerproduct?add=1");
            }else{
                response.sendRedirect("managerproduct?add=0");
            }

        } else {
            request.setAttribute("listCategory", dao.getAllSubCategory());
            request.setAttribute("listColor", dao.getAllColor());
            request.setAttribute("listSize", dao.getAllSize());
            request.setAttribute("listSport", dao.getAllSport());
            request.setAttribute("listBrand", dao.getAllBrand());
            request.getRequestDispatcher("admin/AddProduct.jsp").forward(request, response);
        }
    }

    private static void insertColorSize(int color, ArrayList<String> sizes, ArrayList<String> quantities, int productID) {
        AdminDAO dao = new AdminDAO();

        if (sizes != null && quantities != null && sizes.size() == quantities.size()) {
            for (int i = 0; i < sizes.size(); i++) {
                String size = sizes.get(i);
                String quantity = quantities.get(i);

                // Chỉ xử lý nếu cả size và quantity đều không null và không trống
                if (size != null && quantity != null && !size.isEmpty() && !quantity.isEmpty()) {
                    int sizeInt = Integer.parseInt(size);
                    int quantityInt = Integer.parseInt(quantity);
                    if (dao.getProductSizeColorByID(color, sizeInt, productID) == null) {
                        dao.insertProduct_Color_Size(color, sizeInt, productID, quantityInt);
                    } else {
                        dao.updateProductColorSize(color, sizeInt, productID, quantityInt);
                    }
                }
            }
        } else {
            System.err.println("Sizes and quantities lists are not properly aligned or are null.");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
