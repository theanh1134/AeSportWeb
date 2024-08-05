package controllerr;

import DBContext.DAOFeedback;
import DBContext.DAOProduct;
import Model.Color;
import Model.Feedback;
import Model.Product1;
import Model.Size;
import data.ImgContext;
import data.ProductContext;
import entity.img;
import entity.product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDetail extends HttpServlet {

    DAOFeedback daofb = new DAOFeedback();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productId = request.getParameter("productId");
        ProductContext productDB = new ProductContext();
        ImgContext imgDB = new ImgContext();

        product productDetail = productDB.getProduct(Integer.parseInt(productId));
        ArrayList<Size> listSize = productDB.getSizebyProductId(Integer.parseInt(productId));
        ArrayList<img> listImg = imgDB.getImgsofProduct(Integer.parseInt(productId));
        ArrayList<Color> listColor = productDB.getColorbyProductId(Integer.parseInt(productId));
        List<Feedback> listbyproID = daofb.getFeedbackByProductId(Integer.parseInt(productId));
        ArrayList<product> productsRelated = productDB.getProductsbySubcategory(productDetail.getSubCate().getSubcategory_ID());

        request.setAttribute("productsRelated", productsRelated);
        request.setAttribute("listbyproID", listbyproID);
        request.setAttribute("listSize", listSize);
        request.setAttribute("listImg", listImg);
        request.setAttribute("listColor", listColor);
        request.setAttribute("productDetail", productDetail);

        request.getRequestDispatcher("/view/Product/productDetail.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productId = request.getParameter("productId");
        String size = request.getParameter("size");
        String color = request.getParameter("color");
        String number = request.getParameter("number");

        System.out.println(size);

        ProductContext productDB = new ProductContext();
        product productDetail = productDB.getProduct(Integer.parseInt(productId));

        int quantity = Integer.parseInt(request.getParameter("number"));
        HttpSession session = request.getSession();
        Map<product, Integer> cart = (HashMap<product, Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }
        cart.put(productDetail, quantity);
        session.setAttribute("cart", cart);
        response.sendRedirect("CartPage");
    }

    @Override
    public String getServletInfo() {
        return "Product Detail Servlet";
    }
}
