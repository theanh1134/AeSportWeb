<%-- 
    Document   : ManagerSubCategory
    Created on : Jun 7, 2024, 10:47:43 PM
    Author     : admin
--%>

<%@page import="Model.Category"%>
<%@page import="DBContext.AdminDAO"%>
<%@page import="Model.SubCategory"%>
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
            <div class="col-2 border-4 border-black" style="padding-right: 0px;">
                <jsp:include page="AdministratorPage.jsp"/>
            </div>


            <div class="col-10" style="background: #e2e7e8">
                <jsp:include page="HeaderAdmin.jsp"/>

                <div style="margin: 30px; background: white;padding: 20px;border-radius: 10px" >
                    <h1 style="font-family: initial;">Danh sách thể loại</h1>
                    <hr style="size: 30px"/>
                    <%
                        String error = (String) request.getAttribute("error");
                        String info = (String) request.getAttribute("info");
                        if (error != null) {
                    %>
                    <div id="errorAlert" class="alert alert-danger" role="alert">
                        <%= error %>
                    </div>
                    <%
                        }
                        if (info != null) {
                    %>
                    <div id="infoAlert" class="alert alert-success" role="alert">
                        <%= info %>
                    </div>
                    <%
                        }
                        AdminDAO dao = new AdminDAO();
                        ArrayList<SubCategory> list = (ArrayList<SubCategory>) request.getAttribute("list");
                        ArrayList<Integer> listCategory = (ArrayList<Integer>) request.getAttribute("listCategory");
                        if (list == null || list.size() == 0) {
                    %>
                    <h5>Chưa có thể loại nào</h5>
                    <button style="background-color: #212529" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addSubCategoryModal">Add</button>
                    <%
                    } else {
                    %>

                    <div style="display: flex; justify-content: space-between;">
                        <h5 style="padding: 10px">Tổng <%=list.size()%> thể loại </h5>
                        <div style="margin-left: 65%;height: 37px">
                            <form action="managersubcategory" method="get" id="subcategoryForm">
                                <select style="background-color: #212529; padding: 6px;color: white;border-radius: 6px" name="op" onchange="document.getElementById('subcategoryForm').submit();">
                                    <option value="0" <%= request.getParameter("op") != null && Integer.parseInt(request.getParameter("op")) == 0 ? "selected" : ""%>>All</option>
                                    <%
                                        String selectedOp = request.getParameter("op");
                                        for (int elem : listCategory) {

                                    %>
                                    <option value="<%=elem%>" <%= selectedOp != null && Integer.parseInt(selectedOp) == elem ? "selected" : ""%>><%=dao.getCategoryByID(elem)%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </form>
                        </div>


                        <button style="background-color: #212529; border-bottom: none; height: 37px; margin-right: 3%" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addSubCategoryModal">Add</button>
                    </div>

                    <table border="1" style="border-collapse: collapse">
                        <tr>
                            <th>SubCategoryID</th>
                            <th>SubCategoryName</th>
                            <th>CategoryType</th>
                            <th>Operation</th>
                        </tr>
                        <%
                            for (SubCategory c : list) {
                        %>
                        <tr>
                            <td><%= c.getSubcategory_ID()%></td>
                            <td><%= c.getSubcategory_Name()%></td>
                            <td><%= dao.getCategoryByID(c.getCategory_ID())%></td>

                            <td>
                                <a href="managersubcategory?delete=<%= c.getSubcategory_ID()%>" class="delete-link" onclick="return confirm('Bạn có chắc muốn xóa không?');">Delete</a> &nbsp;&nbsp;

                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </table><br/>

                    <%
                        }
                    %>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="addSubCategoryModal" tabindex="-1" aria-labelledby="addSubCategoryLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addSubCategoryLabel">Add SubCategory</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/managersubcategory?key=1" method="post">
                            <div class="mb-3">
                                <label for="subcategoryName" class="form-label">SubCategory Name</label>
                                <input type="text" class="form-control" id="sportName" name="subcategoryname" required>
                            </div>

                            <div class="mb-3">
                                <label for="Type" class="form-label">Category Type</label>
                                <select class="form-control" id="categoryID" name="categoryID" required>
                                    <option value="" disabled selected>Select an option</option>
                                    <% ArrayList<Category> listc = dao.getAllCategory();
                                        for (Category elem : listc) {
                                    %>
                                    <option value="<%=elem.getCategory_ID() %>"><%=elem%></option>
                                    <%
                                        }
                                    %>

                                </select>

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
