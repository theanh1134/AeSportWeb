/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBContext;

import Model.Product;
import Model.Product1;
import Model.SubCategory;
import entity.Brand;
import entity.sport;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class DAOProduct extends DBContext {

    public List<Product1> selectAllProducts() {
        List<Product1> products = new ArrayList<>();
        try {
            String sql = "select * from Product \n"
                    + "join ImgProduct on Product.product_ID = ImgProduct.product_ID";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Product1 product = new Product1();
                product.setProductID(rs.getInt("product_ID"));
                product.setPrice(rs.getDouble("price"));
                product.setImg(rs.getString("img_url"));
                product.setDescription(rs.getString("description"));
                product.setProductName(rs.getString("product_Name"));
                product.setStatus(rs.getString("status"));

                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public int getTotalProduct() {
        try {
            String sql = "select COUNT(*) from Product";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<Product1> pagingProduct(int index) {
        List<Product1> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product \n"
                    + "JOIN ImgProduct ON Product.product_ID = ImgProduct.product_ID\n"
                    + "order by Product.product_ID\n"
                    + "OFFSET ? rows fetch next 8 rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 8);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product1 product = new Product1();
                product.setProductID(rs.getInt("product_ID"));
                product.setPrice(rs.getDouble("price"));
                product.setImg(rs.getString("img_url"));
                product.setDescription(rs.getString("description"));
                product.setProductName(rs.getString("product_Name"));
                product.setStatus(rs.getString("status"));
                // Set other fields as necessary
                list.add(product);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<Product1> getbysubcategory(int Subcategory_ID) {
        List<Product1> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product\n"
                    + "JOIN ImgProduct ON Product.product_ID = ImgProduct.product_ID\n"
                    + "                   where Subcategory_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, Subcategory_ID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product1 product = new Product1();
                product.setSubcategory_ID(rs.getInt("Subcategory_ID"));
                product.setProductID(rs.getInt("product_ID"));
                product.setPrice(rs.getDouble("price"));
                product.setImg(rs.getString("img_url"));
                product.setDescription(rs.getString("description"));
                product.setProductName(rs.getString("product_Name"));
                product.setStatus(rs.getString("status"));
                // Set other fields as necessary
                list.add(product);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<SubCategory> getAllsubcategory() {
        List<SubCategory> SubCategory = new ArrayList<>();
        try {
            String sql = "select * from Subcategory";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                SubCategory product = new SubCategory();
                product.setSubcategory_ID(rs.getInt("SubCategory_ID"));
                product.setCategory_ID(rs.getInt("category_ID"));
                product.setSubcategory_Name(rs.getString("SubCategory_Name"));

                SubCategory.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return SubCategory;
    }

    public List<Product1> getLast() {
        List<Product1> listlast = new ArrayList<>();
        try {
            String sql = "select top 1 * from Product\n"
                    + "JOIN ImgProduct ON Product.product_ID = ImgProduct.product_ID\n"
                    + "order by Product.product_ID desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product1 product = new Product1();

                product.setProductID(rs.getInt("product_ID"));
                product.setPrice(rs.getDouble("price"));
                product.setImg(rs.getString("img_url"));
                product.setDescription(rs.getString("description"));
                product.setProductName(rs.getString("product_Name"));
                product.setStatus(rs.getString("status"));
                // Set other fields as necessary
                listlast.add(product);
            }
        } catch (Exception e) {
        }
        return listlast;
    }

    public List<Product1> getPopularProducts() {
        List<Product1> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product \n"
                    + "JOIN ImgProduct ON Product.product_ID = ImgProduct.product_ID\n"
                    + "WHERE status LIKE 'hot'";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product1 product = new Product1();

                product.setProductID(rs.getInt("product_ID"));
                product.setPrice(rs.getDouble("price"));
                product.setImg(rs.getString("img_url"));
                product.setDescription(rs.getString("description"));
                product.setProductName(rs.getString("product_Name"));
                product.setStatus(rs.getString("status"));
                // Set other fields as necessary
                list.add(product);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product1> getBestSellingProducts() {
        List<Product1> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product \n"
                    + "JOIN ImgProduct ON Product.product_ID = ImgProduct.product_ID\n"
                    + "WHERE status LIKE 'sale'";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product1 product = new Product1();

                product.setProductID(rs.getInt("product_ID"));
                product.setPrice(rs.getDouble("price"));
                product.setImg(rs.getString("img_url"));
                product.setDescription(rs.getString("description"));
                product.setProductName(rs.getString("product_Name"));
                product.setStatus(rs.getString("status"));
                // Set other fields as necessary
                list.add(product);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product1> getNewestProducts() {
        List<Product1> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product \n"
                    + "JOIN ImgProduct ON Product.product_ID = ImgProduct.product_ID\n"
                    + "WHERE status LIKE 'normal'";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product1 product = new Product1();

                product.setProductID(rs.getInt("product_ID"));
                product.setPrice(rs.getDouble("price"));
                product.setImg(rs.getString("img_url"));
                product.setDescription(rs.getString("description"));
                product.setProductName(rs.getString("product_Name"));
                product.setStatus(rs.getString("status"));
                // Set other fields as necessary
                list.add(product);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product1> getProductsSortedByPriceAsc() {
        List<Product1> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product \n"
                    + "JOIN ImgProduct ON Product.product_ID = ImgProduct.product_ID\n"
                    + "ORDER BY price ASC";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product1 product = new Product1();

                product.setProductID(rs.getInt("product_ID"));
                product.setPrice(rs.getDouble("price"));
                product.setImg(rs.getString("img_url"));
                product.setDescription(rs.getString("description"));
                product.setProductName(rs.getString("product_Name"));
                product.setStatus(rs.getString("status"));
                // Set other fields as necessary
                list.add(product);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product1> getProductsSortedByPriceDesc() {
        List<Product1> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product \n"
                    + "JOIN ImgProduct ON Product.product_ID = ImgProduct.product_ID\n"
                    + "ORDER BY price DESC";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product1 product = new Product1();

                product.setProductID(rs.getInt("product_ID"));
                product.setPrice(rs.getDouble("price"));
                product.setImg(rs.getString("img_url"));
                product.setDescription(rs.getString("description"));
                product.setProductName(rs.getString("product_Name"));
                product.setStatus(rs.getString("status"));
                // Set other fields as necessary
                list.add(product);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product1> getDefaultProductList() {
        List<Product1> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product \n"
                    + "JOIN ImgProduct ON Product.product_ID = ImgProduct.product_ID\n"
                    + "ORDER BY Product.product_ID";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product1 product = new Product1();

                product.setProductID(rs.getInt("product_ID"));
                product.setPrice(rs.getDouble("price"));
                product.setImg(rs.getString("img_url"));
                product.setDescription(rs.getString("description"));
                product.setProductName(rs.getString("product_Name"));
                product.setStatus(rs.getString("status"));
                // Set other fields as necessary
                list.add(product);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product1> getProductsSortedByPrice() {
        List<Product1> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Product \n"
                    + "JOIN ImgProduct ON Product.product_ID = ImgProduct.product_ID\n"
                    + "ORDER BY Product.product_ID";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product1 product = new Product1();

                product.setProductID(rs.getInt("product_ID"));
                product.setPrice(rs.getDouble("price"));
                product.setImg(rs.getString("img_url"));
                product.setDescription(rs.getString("description"));
                product.setProductName(rs.getString("product_Name"));
                product.setStatus(rs.getString("status"));
                // Set other fields as necessary
                list.add(product);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product1> searchProducts(String keyword) throws SQLException {
        List<Product1> productList = new ArrayList<>();

        try {
            String sql = "SELECT * FROM Product join ImgProduct "
                    + "on Product.product_ID = ImgProduct.product_ID\n"
                    + "WHERE LOWER(product_Name) LIKE ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setString(1, "%" + keyword.toLowerCase() + "%");

            try (
                    ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    Product1 product = new Product1();
                    product.setProductID(rs.getInt("product_ID"));
                    product.setProductName(rs.getString("product_Name"));
                    product.setPrice(rs.getDouble("price"));
                    product.setImg(rs.getString("img_url"));
                    product.setDescription(rs.getString("description"));
                    product.setStatus(rs.getString("status"));
                    // Set other fields as necessary
                    productList.add(product);
                }
            }
        } catch (SQLException e) {
        }
        return productList;
    }

    public List<Product1> getbysport(int Sport_ID) {
        List<Product1> list = new ArrayList<>();
        try {
            String sql = "select * from Product\n"
                    + "JOIN ImgProduct ON Product.product_ID = ImgProduct.product_ID\n"
                    + "where Product.Sport_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, Sport_ID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product1 product = new Product1();
                product.setSportID(rs.getInt("Sport_ID"));
                product.setProductID(rs.getInt("product_ID"));
                product.setPrice(rs.getDouble("price"));
                product.setImg(rs.getString("img_url"));
                product.setDescription(rs.getString("description"));
                product.setProductName(rs.getString("product_Name"));
                product.setStatus(rs.getString("status"));
                // Set other fields as necessary
                list.add(product);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<Product1> getbybrand(int brand_ID) {
        List<Product1> list = new ArrayList<>();
        try {
            String sql = "select * from Product\n"
                    + "JOIN ImgProduct ON Product.product_ID = ImgProduct.product_ID\n"
                    + "where Product.brand_ID = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, brand_ID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product1 product = new Product1();
                product.setBrandID(rs.getInt("brand_ID"));
                product.setProductID(rs.getInt("product_ID"));
                product.setPrice(rs.getDouble("price"));
                product.setImg(rs.getString("img_url"));
                product.setDescription(rs.getString("description"));
                product.setProductName(rs.getString("product_Name"));
                product.setStatus(rs.getString("status"));
                // Set other fields as necessary
                list.add(product);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<sport> getAllsport() {
        List<sport> sport = new ArrayList<>();
        try {
            String sql = "select * from Sport";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                sport product = new sport();
                product.setSport_Id(rs.getInt("Sport_ID"));
                product.setSport_Name(rs.getString("Sport_Name"));

                sport.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sport;
    }

    public List<Brand> getAllbrand() {
        List<Brand> Brand = new ArrayList<>();
        try {
            String sql = "select * from brand";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Brand product = new Brand();
                product.setId(rs.getInt("Brand_ID"));
                product.setName(rs.getString("Brand_Name"));

                Brand.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Brand;
    }

}
