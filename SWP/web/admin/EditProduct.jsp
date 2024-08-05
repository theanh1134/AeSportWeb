<%-- 
    Document   : ManagerProduct
    Created on : Jun 3, 2024, 5:33:35 PM
    Author     : admin
--%>
<%@page import="Model.Discount"%>
<%@page import="entity.Brand"%>
<%@page import="entity.sport"%>
<%@page import="Model.Product"%>
<%@page import="DBContext.AdminDAO"%>
<%@page import="Model.SubCategory"%>
<%@page import="Model.ImgProduct"%>
<%@page import="Model.ProductSizeColor"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/table.css">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
            />
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
        ></script>
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
            />
        <style>
            .carousel-inner img {
                width: 100%;
                height: 400px;
                object-fit: contain;
            }

            table {
                border-collapse: collapse;
                width: 100%;
            }

            table th, table td {
                border: none; /* Remove all borders */
                padding: 8px;
                text-align: center;
            }

            table tr {
                border-bottom: 1px solid #ddd; /* Add a border only to the bottom of each row */
                background: #f8f9fa;
            }

            table tr:last-child {
                border-bottom: none; /* Remove the border from the last row */
            }

            table th {
                background-color: #343a40;
            }

            .mb-3 label{
                font-weight:bold;
            }
            .col-form-label {
                font-size: 1.2rem; /* Điều chỉnh kích thước chữ của nhãn */
                white-space: nowrap; /* Ngăn chữ xuống dòng */

            }
            .form-group {
                margin-bottom: 1rem; /* Điều chỉnh khoảng cách giữa các trường */
            }
            .align-items-center {
                align-items: center; /* Giữ các mục căn giữa theo chiều dọc */
            }

        </style>
        <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
    </head>
    <body>
        <div class="row">
            <div class="col-2 border-4 border-black" style="padding-right: 0px;">
                <jsp:include page="AdministratorPage.jsp"/>
            </div>

            <div class="col-10" style="background: #e2e7e8">
                <jsp:include page="HeaderAdmin.jsp"/>

                <div style="margin: 30px; background: white;padding: 20px;border-radius: 10px" >

                    <%
                        String productID = request.getParameter("pID");
                        if (productID != null) {
                            AdminDAO dao = new AdminDAO();
                            Product product = dao.getProductByID(Integer.parseInt(productID));
                            ArrayList<SubCategory> categories = dao.getAllSubCategory();
                            ArrayList<sport> sports = dao.getAllSport();
                            ArrayList<Brand> brands = dao.getAllBrand();
                            ArrayList<Discount> discounts = dao.getAllDiscount();
                            ArrayList<ImgProduct> listImg = dao.getImgProductByProductID(Integer.parseInt(productID));
                            ArrayList<ProductSizeColor> listSC = dao.getAllProductSizeColorByPID(Integer.parseInt(productID));
                            if (product != null) {
                    %>

                    <h1 style="text-align: center; font-family: initial; font-weight: bold">Chỉnh sửa sản phẩm ID:<%=productID%></h1>

                    <div class="row">
                        <div class="col-6" >
                            <div class="col-12">
                                <!-- Image Carousel -->
                                <div id="productImages" class="carousel slide" data-bs-ride="carousel" style="padding: 20px; background-color: #212121">
                                    <div class="carousel-inner">
                                        <%
                                            for (int i = 0; i < listImg.size(); i++) {
                                                ImgProduct img = listImg.get(i);
                                        %>
                                        <div class="carousel-item <%= i == 0 ? "active" : ""%>">
                                            <img src="img/product/<%=img.getImgUrl()%>" class="d-block w-100" alt="Product Image <%= i + 1%>">
                                        </div>
                                        <%
                                            }
                                        %>
                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#productImages" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#productImages" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>
                                </div>
                            </div>
                            <div class="col-12">
                                <form action="editproduct?key=2" method="post">
                                    <input type="hidden" name="pID" value="<%=productID%>">
                                    <table border="1" style="border-collapse: collapse;">
                                        <thead>
                                            <tr>
                                                <th>Image</th>
                                                <th>Image URL</th>
                                                <th>Select</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                for (ImgProduct img : listImg) {
                                            %>
                                            <tr>
                                                <td><img src="img/product/<%= img.getImgUrl()%>" alt="Product Image" style="width: 50px; height: 50px;"></td>
                                                <td><%= img.getImgUrl()%></td>
                                                <td>
                                                    <input style="width: 20px; height: 20px"type="checkbox" name="imgID" value="<%= img.getImgID()%>">
                                                </td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                        </tbody>
                                    </table>

                                    <div style="display: flex; justify-content: center; margin: 20px">
                                        <button style="background-color: #212529; border-bottom: none; height: 37px; margin-right: 3%;" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addImg">Thêm ảnh</button>
                                        <button type="submit" class="btn btn-danger"> Xóa ảnh đã chọn </button>
                                    </div>
                                </form>

                            </div>
                        </div>
                        <div class="col-6">
                            <form action="editproduct" method="post" class="row">
                                <div class="col-12" style="background-color: wheat;">
                                    <input type="hidden" name="productID" value="<%= product.getProductID()%>"/>
                                    <div class="row mb-3 align-items-center" style="margin-top: 15px">
                                        <label for="productName" class="col-sm-4 col-form-label">Tên sản phẩm</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="productName" name="productName" value="<%= product.getProductName()%>" required>
                                        </div>
                                    </div>
                                    <div class="row mb-3 align-items-center">
                                        <label for="category" class="col-sm-4 col-form-label">Thể loai</label>
                                        <div class="col-sm-8">
                                            <select id="category" name="category" class="form-select" required>
                                                <% for (SubCategory category : categories) {%>
                                                <option value="<%= category.getSubcategory_ID()%>" <%= category.getCategory_ID() == product.getSubcategoryID() ? "selected" : ""%>><%= category.show()%></option>
                                                <% } %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row mb-3 align-items-center">
                                        <label for="sport" class="col-sm-4 col-form-label">Môn thể thao</label>
                                        <div class="col-sm-8">
                                            <select id="sport" name="sport" class="form-select" required>
                                                <% for (sport sport : sports) {%>
                                                <option value="<%= sport.getSport_Id()%>" <%= sport.getSport_Id() == product.getSportID() ? "selected" : ""%>><%= sport.getNameAndClb()%></option>
                                                <% } %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row mb-3 align-items-center">
                                        <label for="brand" class="col-sm-4 col-form-label">Thương hiệu</label>
                                        <div class="col-sm-8">
                                            <select id="brand" name="brand" class="form-select" required>
                                                <% for (Brand brand : brands) {%>
                                                <option value="<%= brand.getId()%>" <%= brand.getId() == product.getBrandID() ? "selected" : ""%>><%= brand.getName()%></option>
                                                <% }%>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row mb-3 align-items-center">
                                        <label for="status" class="col-sm-4 col-form-label">Trạng thái</label>
                                        <div class="col-sm-8">
                                            <select id="status" name="status" class="form-select" required>
                                                <option value="Normal" ${param.status == "Normal" ? "selected" : ""}>Normal</option>
                                                <option value="New" <%= product.getStatus().equals("New") ? "selected" : ""%>>New</option>
                                                <option value="Hot" <%= product.getStatus().equals("Hot") ? "selected" : ""%>>Hot</option>
                                                <option value="Sale" <%= product.getStatus().equals("Sale") ? "selected" : ""%>>Sale</option>
                                                <option value="Hide" <%= product.getStatus().equals("Hide") ? "selected" : ""%>>Hide</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row mb-3 align-items-center">
                                        <label for="inprice" class="col-sm-4 col-form-label">Giá nhập/1 sản phẩm</label>
                                        <div class="col-sm-8">
                                            <input type="number" class="form-control" id="inprice" name="inprice" value="<%=product.getImport_price()%>" min="1" step="0.01" required>

                                        </div>
                                    </div>
                                    <div class="row mb-3 align-items-center">
                                        <label for="exprice" class="col-sm-4 col-form-label">Giá bán/1 sản phẩm</label>
                                        <div class="col-sm-8">
                                            <input type="number" class="form-control" id="exprice" name="exprice" value="<%=product.getPrice()%>" min="1"  step="0.01" required>
                                        </div>
                                    </div>
                                    <div class="row mb-3 align-items-center">
                                        <label for="brand" class="col-sm-4 col-form-label">Giảm giá</label>
                                        <div class="col-sm-8">
                                            <select id="discount" name="discount" class="form-select" required>
                                                <% for (Discount discount : discounts) {%>
                                                <option value="<%= discount.getDiscount_ID() %>" <%= discount.getDiscount_ID() == product.getDiscountID() ? "selected" : ""%>><%= discount.getDiscount_Name()+" ("+discount.getDiscount_Amount()+"%)" %></option>
                                                <% }%>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row mb-3 align-items-center">
                                        <label for="quantity" class="col-sm-4 col-form-label">Tổng số lượng</label>
                                        <div class="col-sm-8">
                                            <input type="number" class="form-control" id="quantity" name="quantity" value="<%= product.getQuantity()%>" readonly>
                                        </div>
                                    </div>
                                    <div style="padding-bottom: 10px">
                                        <label style="font-weight: bold; margin-bottom: 5px;" for="description">Mô tả:</label><br>
                                        <div class="form-group" style="display: flex;justify-content: center">
                                            <textarea id="description" name="description" required><%= product.getDescription()%></textarea>
                                        </div>
                                    </div>
                                </div>



                                <div class=" col-12" style="background-color: wheat">
                                    <!-- Product Size Color Table -->
                                    <table border="1" style="border-collapse: collapse;">
                                        <thead>
                                            <tr>
                                                <th>Màu sắc</th>
                                                <th>Khích cỡ</th>
                                                <th>Số lượng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                for (ProductSizeColor psc : listSC) {
                                            %>
                                            <tr>
                                                <td><%= dao.getColorByCID(psc.getColorID()).getColor_Name()%></td>
                                                <td><%= dao.getSizeBySID(psc.getSizeID()).getSize_Name()%></td>
                                                <td><%= psc.getQuantity()%></td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                    <br>


                                    <input type="hidden" value="<%=request.getParameter("pID")%>" name="pID">
                                    <div style="display: flex; justify-content: center; margin-bottom: 20px">
                                        <a style="margin-right: 40px" href="${pageContext.request.contextPath}/admin/EditProductColorSize.jsp?pID=<%= request.getParameter("pID")%>" class="btn btn-dark">Sửa màu và kích cỡ</a>
                                        <button style="background-color: #212529; margin-right: 40px;" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addColorSize">Thêm màu và kích cỡ</button>
                                        <button style="margin-right: 20px" type="submit" class="btn btn-dark">Lưu thay đổi</button>
                                        <a style="margin-left: 20px; display: flex; align-items: center; justify-content: center;" href="${pageContext.request.contextPath}/managerproduct" class="btn btn-dark">Cancel</a>

                                    </div>
                                </div>
                            </form>

                            <%
                            } else {
                            %>
                            <p>Product not found.</p>
                            <%
                                }
                            } else {
                            %>
                            <p>Invalid product ID.</p>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="addImg" tabindex="-1" aria-labelledby="addImgModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addImgModalLabel">Thêm ảnh sản phẩm</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="${pageContext.request.contextPath}/editproduct" method="get">
                                <div class="mb-3">
                                    <label for="numberColor" class="form-label" style="font-weight: bold">Nhập số lượng ảnh muốn thêm </label>
                                    <input type="text" class="form-control" id="numberImg" name="numberImg" required>
                                    <input type="hidden" value="<%=request.getParameter("pID")%>" name="pID">
                                </div>
                                <button style="background-color: #212529" type="submit" class="btn btn-primary">Add</button>

                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="addColorSize" tabindex="-1" aria-labelledby="addColorSizeModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addImgModalLabel">Thêm màu và cỡ sản phẩm</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="${pageContext.request.contextPath}/editproduct" method="get">
                                <div class="mb-3">
                                    <label for="numberColorSize" class="form-label" style="font-weight: bold">Nhập số lượng màu và cỡ muốn thêm </label>
                                    <input type="text" class="form-control" id="numberColorSize" name="numberColorSize" required>
                                    <input type="hidden" value="<%=request.getParameter("pID")%>" name="pID">
                                </div>
                                <button style="background-color: #212529" type="submit" class="btn btn-primary">Add</button>

                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                // Khởi tạo CKEditor cho textarea có id="description"
                CKEDITOR.replace('description');
            </script>
    </body>
</html>
