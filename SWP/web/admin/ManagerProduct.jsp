<%@page import="Model.ImgProduct"%>
<%@page import="Model.SubCategory"%>
<%@page import="Model.Category"%>
<%@page import="DBContext.AdminDAO"%>
<%@page import="Model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        </style>
    </head>
    <body>
        <div class="row">
            <div class="col-2 border-4 border-black" style="padding-right: 0px;" >
                <jsp:include page="AdministratorPage.jsp"/>
            </div>

            <div class="col-10" style="background: #e2e7e8">
                <jsp:include page="HeaderAdmin.jsp"/>
                <div style="margin: 30px; background: white;padding: 20px;border-radius: 10px">
                    <h1 style="font-family: initial;">Danh sách sản phẩm </h1>
                    <hr style="size: 30px"/>

                    <%
                        String error = (String) request.getAttribute("error");
                        String info = (String) request.getAttribute("info");
                        if (error != null) {
                    %>
                    <div id="errorAlert" class="alert alert-danger" role="alert">
                        <%= error%>
                    </div>
                    <%
                        }
                        if (info != null) {
                    %>
                    <div id="errorAlert" class="alert alert-success" role="alert">
                        <%= info%>
                    </div>
                    <%
                        }

                        ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("list");
                        if (list == null || list.size() == 0) {
                    %>
                    <h5 style="padding: 10px">Chưa có sản phẩm nào</h5>

                    <div style="display: flex; justify-content: space-between; margin-bottom: 10px">
                        <form action="managerproduct" method="get" class="search-form" style="display: flex; flex-wrap: wrap; gap: 10px;">
                            <input type="text" value="${param.productname}" name="productname" placeholder="Tìm kiếm theo tên" class="search-input">
                            <select name="category" class="search-input">
                                <option value="">Chọn danh mục</option>

                                <%
                                    AdminDAO dao = new AdminDAO();
                                    ArrayList<SubCategory> categories = dao.getAllSubCategory();
                                    String selectedCategory = request.getParameter("category");
                                    for (SubCategory elm : categories) {
                                %>
                                <option value="<%=elm.getCategory_ID()%>" <%= (selectedCategory != null && selectedCategory.equals(elm.getCategory_ID() + "")) ? "selected" : ""%>><%= elm.show()%></option>
                                <%
                                    }
                                %>
                            </select>
                            <select name="status" class="search-input">
                                <option value="">Chọn trạng thái</option>
                                <option value="New" ${param.status == "New" ? "selected" : ""}>New</option>
                                <option value="Hot" ${param.status == "Hot" ? "selected" : ""}>Hot</option>
                                <option value="Sale" ${param.status == "Sale" ? "selected" : ""}>Sale</option>
                                <option value="Hide" ${param.status == "Hide" ? "selected" : ""}>Hide</option>
                            </select>
                            <input type="submit" value="Search" class="search-button">
                        </form>
                        <button style="background-color: #212529; border-bottom: none; height: 37px; margin-right: 3%" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProduct">Add</button>
                    </div>
                    <%
                    } else {
                    %>

                    <h5 style="padding: 10px">Tổng <%=list.size()%> sản phẩm </h5>
                    <div style="display: flex; justify-content: space-between; margin-bottom: 10px">
                        <form action="managerproduct" method="get" class="search-form" style="display: flex; flex-wrap: wrap; gap: 10px;">
                            <input type="text" value="${param.productname}" name="productname" placeholder="Tìm kiếm theo tên" class="search-input">
                            <select name="category" class="search-input">
                                <option value="">Chọn danh mục</option>

                                <%
                                    AdminDAO dao = new AdminDAO();
                                    ArrayList<SubCategory> categories = dao.getAllSubCategory();
                                    String selectedCategory = request.getParameter("category");
                                    for (SubCategory elm : categories) {
                                %>
                                <option value="<%=elm.getCategory_ID()%>" <%= (selectedCategory != null && selectedCategory.equals(elm.getCategory_ID() + "")) ? "selected" : ""%>><%= elm.show()%></option>
                                <%
                                    }
                                %>
                            </select>
                            <select name="status" class="search-input">
                                <option value="">Chọn trạng thái</option>
                                <option value="New" ${param.status == "New" ? "selected" : ""}>New</option>
                                <option value="Hot" ${param.status == "Hot" ? "selected" : ""}>Hot</option>
                                <option value="Sale" ${param.status == "Sale" ? "selected" : ""}>Sale</option>
                                <option value="Hide" ${param.status == "Hide" ? "selected" : ""}>Hide</option>
                            </select>
                            <input type="submit" value="Search" class="search-button">
                        </form>
                        <button style="background-color: #212529; border-bottom: none; height: 37px; margin-right: 3%" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProduct">Add</button>
                    </div>
                    <table border="1" style="border-collapse: collapse;">
                        <tr>
                            <th>ProductID</th>
                            <th>Image</th>
                            <th>ProductName</th>
                            <th>Category</th>
                            <th>Status</th>
                            <th>UnitPrice</th>
                            <th>Discount</th>
                            <th>Quantity</th>
                            <th>Operation</th>
                        </tr>
                        <%
                            for (Product p : list) {
                                ArrayList<ImgProduct> imgList = dao.getImgProductByProductID(p.getProductID());
                                String img = "";
                                if (imgList != null && imgList.size() >= 1) {
                                    img = imgList.get(0).getImgUrl();
                                } else {
                                    img = "no.webp"; // or any placeholder image
                                }
                        %>
                        <tr>
                            <td><%= p.getProductID()%></td>
                            <td><img src="img/product/<%=img%>" alt="User Image" style="width: 60px; height: 50px"/></td>
                            <td><%= p.getProductName()%></td>
                            <td><%=dao.getSubCategoryByID(p.getSubcategoryID()).show()%></td>
                            <td><%= p.getStatus()%></td>
                            <td><%= p.getPrice()%>đ</td>
                            <td>
                                <%= (dao.getDiscountByID(p.getDiscountID()) != null) ? dao.getDiscountByID(p.getDiscountID()).getDiscount_Amount() + "%" : "None"%>
                            </td>
                            <td><%= p.getQuantity()%></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/editproduct?pID=<%= p.getProductID()%>" class="edit-link"><span><i class="bi bi-pencil-square"></i></span></a> &nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/deleteproduct?pID=<%= p.getProductID()%>" class="delete-link" onclick="return confirm('Bạn có chắc muốn xóa không?');"><span><i class="bi bi-trash3-fill"></i></span></a> &nbsp;&nbsp;
<!--                                <a href="${pageContext.request.contextPath}/viewproduct?pID=<%= p.getProductID()%>" class="update-link"><span><i class="bi bi-eye-fill"></i></span></a> &nbsp;&nbsp;-->
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                    <br/>

                    <%
                        int currentPage = (Integer) request.getAttribute("currentPage");
                        int totalPages = (Integer) request.getAttribute("totalPages");

                        if (totalPages > 1) {
                    %>
                    <div style="display: flex; justify-content: end; margin-right: 100px">
                        <nav aria-label="Page navigation example" style="width: 30px;">
                            <ul class="pagination justify-content-center">
                                <li class="page-item <%= (currentPage == 1) ? "disabled" : "" %>">
                                    <a class="page-link" href="managerproduct?page=<%= currentPage - 1 %>" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <%
                                    for (int i = 1; i <= totalPages; i++) {
                                %>
                                <li class="page-item <%= (currentPage == i) ? "active" : "" %>">
                                    <a class="page-link" href="managerproduct?page=<%= i %>"><%= i %></a>
                                </li>
                                <%
                                    }
                                %>
                                <li class="page-item <%= (currentPage == totalPages) ? "disabled" : "" %>" >
                                    <a class="page-link" href="managerproduct?page=<%= currentPage + 1 %>" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                        <%
                            }
                        }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-1"></div>
        <!-- Modal -->
        <div class="modal fade" id="addProduct" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addSportModalLabel">Thêm sản phẩm</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/managerproduct" method="post">
                            <div class="mb-3">
                                <label for="numberColor" class="form-label">Nhập số lượng màu của sản </label>
                                <input min="1" type="number" class="form-control" id="numberColor" name="numberColor" required>
                            </div>
                            <button style="background-color: #212529" type="submit" class="btn btn-primary">Add</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            window.onload = function () {
                var errorAlert = document.getElementById('errorAlert');
                var infoAlert = document.getElementById('infoAlert');

                if (errorAlert) {
                    setTimeout(function () {
                        errorAlert.style.display = 'none';
                    }, 5000);
                }

                if (infoAlert) {
                    setTimeout(function () {
                        infoAlert.style.display = 'none';
                    }, 5000);
                }
            };
        </script>
    </body>
</html>
