<%-- 
    Document   : ManagerRole
    Created on : May 26, 2024, 8:47:37 PM
    Author     : admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Role"%>
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
                    <h1 style="font-family: initial;">Danh sách vai trò</h1>
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
                        ArrayList<Role> list = (ArrayList<Role>) request.getAttribute("list");
                        if (list == null || list.size() == 0) {
                    %>
                    <h3>Empty</h3>

                    <%
                } else {
                    %>
                    <table border="1px solid" style="border-collapse: collapse">
                        <tr>
                            <th>RoleID</th>
                            <th>RoleName</th>
                            <th>Operation</th>
                        </tr>
                        <%
                            for (Role r : list) {
                        %>
                        <tr>
                            <td><%= r.getRoleID() %></td>
                            <td><%= r.getRoleName() %></td>
                            <td>
                                <%
                                //if(!r.getRoleName().toLowerCase().equals("admin")){
                                %>
                                <a href="${pageContext.request.contextPath}/updaterole?rID=<%= r.getRoleID()%>" class="update-link">Update</a> &nbsp;&nbsp;
                                <%
                                   // }
                                %>
                                <a href="${pageContext.request.contextPath}/managerrole?delete=<%= r.getRoleID()%>" class="delete-link" onclick="return confirm('Bạn có chắc muốn xóa không?');">Delete</a> &nbsp;&nbsp;
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </table><br/>

                    <%
                        }
                    %>
                    <form action="managerrole" method="post" class="search-form">
                        <input value="${param.rolename}" type="text" name="rolename" placeholder="Nhập tên của Role" class="search-input">
                        <input type="submit" value="Thêm" class="search-button">
                    </form>
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
