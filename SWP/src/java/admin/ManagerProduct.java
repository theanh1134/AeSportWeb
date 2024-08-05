package admin;

import DBContext.AdminDAO;
import Model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class ManagerProduct extends HttpServlet {
    private static final int PRODUCTS_PER_PAGE = 10;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String productName = request.getParameter("productname");
        String categoryID = request.getParameter("category");
        String status = request.getParameter("status");
        String add = request.getParameter("add");
        String edit = request.getParameter("edit");

        if (add != null) {
            if (add.equals("1")) {
                request.setAttribute("info", "Thêm sản phẩm thành công!");
            } else {
                request.setAttribute("error", "Thêm sản phẩm không thành công!");
            }
        }

        if (edit != null) {
            if (edit.equals("1")) {
                request.setAttribute("info", "Chỉnh sửa sản phẩm thành công!");
            } else {
                request.setAttribute("error", "Chỉnh sửa sản phẩm không thành công!");
            }
        }

        AdminDAO dao = new AdminDAO();
        ArrayList<Product> list = dao.getAllProduct();

        if (productName != null && !productName.isEmpty()) {
            list = filterProductsByName(list, productName);
        }
        if (categoryID != null && !categoryID.trim().isEmpty()) {
            list = filterProductsByCategory(list, categoryID);
        }
        if (status != null && !status.isEmpty()) {
            list = filterProductsByStatus(list, status);
        }

        int page = 1;
        int totalProducts = list.size();
        int totalPages = (int) Math.ceil((double) totalProducts / PRODUCTS_PER_PAGE);
        String pageStr = request.getParameter("page");

        if (pageStr != null && !pageStr.isEmpty()) {
            try {
                page = Integer.parseInt(pageStr);
            } catch (NumberFormatException e) {
                page = 1;
            }
        }

        int startIndex = (page - 1) * PRODUCTS_PER_PAGE;
        int endIndex = Math.min(startIndex + PRODUCTS_PER_PAGE, totalProducts);
        ArrayList<Product> paginatedList = new ArrayList<>(list.subList(startIndex, endIndex));

        request.setAttribute("list", paginatedList);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("admin/ManagerProduct.jsp").forward(request, response);
    }

    private ArrayList<Product> filterProductsByName(ArrayList<Product> products, String name) {
        ArrayList<Product> filteredList = new ArrayList<>();
        for (Product product : products) {
            if (product.getProductName() != null && product.getProductName().toLowerCase().contains(name.toLowerCase())) {
                filteredList.add(product);
            }
        }
        return filteredList;
    }

    private ArrayList<Product> filterProductsByCategory(ArrayList<Product> products, String categoryID) {
        ArrayList<Product> filteredList = new ArrayList<>();
        for (Product product : products) {
            Integer subcategoryID = product.getSubcategoryID();
            if (subcategoryID != null && ((subcategoryID - 1) + "").equals(categoryID)) {
                filteredList.add(product);
            }
        }
        return filteredList;
    }

    private ArrayList<Product> filterProductsByStatus(ArrayList<Product> products, String status) {
        ArrayList<Product> filteredList = new ArrayList<>();
        for (Product product : products) {
            String productStatus = product.getStatus();
            if (productStatus != null && productStatus.equalsIgnoreCase(status)) {
                filteredList.add(product);
            }
        }
        return filteredList;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int num = Integer.parseInt(request.getParameter("numberColor"));
            request.setAttribute("num", num);
            response.sendRedirect("addproduct?num=" + num);
        } catch (Exception e) {
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
