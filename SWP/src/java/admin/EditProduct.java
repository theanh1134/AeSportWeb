
package admin;

import DBContext.AdminDAO;
import Model.ImgProduct;
import Model.Product;
import Model.ProductSizeColor;
import Model.SubCategory;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;


public class EditProduct extends HttpServlet {

    

    private final AdminDAO dao = new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productID = request.getParameter("pID");

        try {
            // sử lý chuyền dữ liệu sang trang thêm ảnh product
            if (request.getParameter("numberImg") != null) {
                request.setAttribute("numberImg", request.getParameter("numberImg"));
                request.setAttribute("pID", productID);
                request.getRequestDispatcher("admin/AddProductImg.jsp").forward(request, response);
                return;
            }
            // sử lý chuyền dữ liệu sang trang thêm size và color product
            if (request.getParameter("numberColorSize") != null) {
                request.setAttribute("listColor", dao.getAllColor());
                request.setAttribute("listSize", dao.getAllSize());
                request.setAttribute("numberColorSize", request.getParameter("numberColorSize"));
                request.setAttribute("pID", productID);
                request.getRequestDispatcher("admin/AddProductColorSize.jsp").forward(request, response);
                return;
            }

            if (productID != null) {
                Product product = dao.getProductByID(Integer.parseInt(productID));
                if (product != null) {
                    forwardToEditProduct(request, response, Integer.parseInt(productID));
                    return;
                } else {
                    System.out.println("Product not found.");
                }
            } else {
                System.out.println("Invalid product ID.");
            }
        } catch (NumberFormatException e) {
            System.out.println("Invalid product ID format.");
        }

        request.getRequestDispatcher("managerproduct").forward(request, response);
    }

    private void forwardToEditProduct(HttpServletRequest request, HttpServletResponse response, int pID) throws ServletException, IOException {
        ArrayList<SubCategory> categories = dao.getAllSubCategory();
        ArrayList<ImgProduct> listImg = dao.getImgProductByProductID(pID);
        ArrayList<ProductSizeColor> listSC = dao.getAllProductSizeColorByPID(pID);
        request.setAttribute("categories", categories);
        request.setAttribute("listImg", listImg);
        request.setAttribute("listSC", listSC);
        request.setAttribute("pID", pID);
        request.getRequestDispatcher("admin/EditProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String key = request.getParameter("key");
        int pID = Integer.parseInt(request.getParameter("pID"));

        try {
            // Process insert image file
            if ("1".equals(key)) {
                int numberImg = Integer.parseInt(request.getParameter("numberImg"));

                for (int i = 1; i <= numberImg; i++) {
                    String paramName = "image" + i;
                    String filePart = request.getParameter(paramName);
                    if (filePart != null) {
                        dao.insertImgProduct(filePart, pID);
                    }
                }
                forwardToEditProduct(request, response, pID);
                return; // Ensure no further processing
            
            // Process delete image file
            } else if ("2".equals(key)) {
                String[] imgIDs = request.getParameterValues("imgID");
                if (imgIDs != null) {
                    for (String imgID : imgIDs) {
                        int iID = Integer.parseInt(imgID);
                        dao.deleteProductImgByimgID(iID);
                    }
                }
                forwardToEditProduct(request, response, pID);
                return; // Ensure no further processing
            // Process insert Product_Color_Size
            } else if ("3".equals(key)) {
                int numberColorSize = Integer.parseInt(request.getParameter("numberColorSize"));
                for (int i = 0; i < numberColorSize; i++) {
                    int colorID = Integer.parseInt(request.getParameter("colorID_" + i));
                    int sizeID = Integer.parseInt(request.getParameter("sizeID_" + i));
                    int quantity = Integer.parseInt(request.getParameter("quantity_" + i));

                    if (dao.getProductSizeColorByID(colorID, sizeID, pID) == null) {
                        dao.insertProduct_Color_Size(colorID, sizeID, pID, quantity);
                    } else {
                        dao.updateProductColorSize(colorID, sizeID, pID, quantity);
                    }
                }
                dao.updateAmountProduct();
                forwardToEditProduct(request, response, pID);
                return;
             
            } else if ("4".equals(key)) { // Handling delete size color product
                
                String[] colorIDs = request.getParameterValues("colorID");
                String[] sizeIDs = request.getParameterValues("sizeID");
                String[] quantities = request.getParameterValues("quantity");
                String[] deleteRows = request.getParameterValues("deleteRow");

                // Process deletions
                if (deleteRows != null) {
                    for (String deleteRow : deleteRows) {
                        String[] ids = deleteRow.split("-");
                        int deleteColorID = Integer.parseInt(ids[0]);
                        int deleteSizeID = Integer.parseInt(ids[1]);
                        dao.deleteProductSizeColor(deleteColorID, deleteSizeID, pID);
                    }
                }

                // Process updates size color product
                for (int i = 0; i < colorIDs.length; i++) {
                    int colorID = Integer.parseInt(colorIDs[i]);
                    int sizeID = Integer.parseInt(sizeIDs[i]);
                    int quantity = Integer.parseInt(quantities[i]);

                    // Check if this row was marked for deletion
                    boolean isDeleted = false;
                    if (deleteRows != null) {
                        for (String deleteRow : deleteRows) {
                            String[] ids = deleteRow.split("-");
                            int deleteColorID = Integer.parseInt(ids[0]);
                            int deleteSizeID = Integer.parseInt(ids[1]);
                            if (colorID == deleteColorID && sizeID == deleteSizeID) {
                                isDeleted = true;
                                break;
                            }
                        }
                    }

                    // Update if not marked for deletion
                    if (!isDeleted) {
                        dao.updateProductColorSize(colorID, sizeID, pID, quantity);
                    }
                }

                dao.updateAmountProduct();
                forwardToEditProduct(request, response, pID);
                return;
            }

            response.setCharacterEncoding("UTF-8");
            int productID = Integer.parseInt(request.getParameter("productID"));
            String productName = request.getParameter("productName");
            int categoryID = Integer.parseInt(request.getParameter("category"));
            System.out.println("-"+categoryID);
            int discountID = Integer.parseInt(request.getParameter("discount"));
            int sportID = Integer.parseInt(request.getParameter("sport"));
            int brandID = Integer.parseInt(request.getParameter("brand"));
            String status = request.getParameter("status");
            double inPrice = Double.parseDouble(request.getParameter("inprice"));
            double exPrice = Double.parseDouble(request.getParameter("exprice"));
            System.out.println(inPrice + "-" + exPrice);
            String description = request.getParameter("description");

            Product product = new Product(productID, exPrice, description, status, sportID, productName, brandID, categoryID, discountID, inPrice);

            System.out.println(product);
            boolean success = dao.updateProduct(product);

            if (success) {
                response.sendRedirect("managerproduct?edit=1");
            } else {
                response.sendRedirect("managerproduct?edit=0");

            }

        } catch (Exception e) {
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            forwardToEditProduct(request, response, pID);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
