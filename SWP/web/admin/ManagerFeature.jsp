<%-- 
    Document   : FeatureManager
    Created on : May 21, 2024, 8:31:10 AM
    Author     : admin
--%>

<%@page import="Model.Feature"%>
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
                    <h1 style="font-family: initial;">Danh sách chức năng</h1>
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
                    ArrayList<Feature> list = (ArrayList<Feature>) request.getAttribute("list");
                    if (list == null || list.size() == 0) {
                    %>
                    <button style="background-color: #212529; border-bottom: none; height: 37px; margin: 10px" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addFeature">Add Feature</button>
                    <h5>Chưa có chức năng nào</h5>

                    <%
                } else {
                    %>
                    <div style="display: flex; justify-content: end">
                        <button style="background-color: #212529; border-bottom: none; height: 37px; margin: 10px" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addFeature">Add Feature</button>
                    </div>
                    <table border="1px solid" style="border-collapse: collapse">
                        <tr>
                            <th>FeatureID</th>
                            <th>FeatureName</th>
                            <th>Path</th>
                            <th>Operation</th>
                        </tr>
                        <%
                            for (Feature f : list) {
                        %>
                        <tr>
                            <td><%= f.getFu_ID() %></td>
                            <td><%= f.getFu_Name() %></td>
                            <td><%= f.getUrl() %></td>
                            <td>
                                <a href="managerfeature?delete=<%= f.getFu_ID() %>" class="delete-link" onclick="return confirm('Bạn có chắc muốn xóa không?');">Delete</a> &nbsp;&nbsp;

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
        <div class="modal fade" id="addFeature" tabindex="-1" aria-labelledby="addFeatureLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addSportModalLabel">Add Feature</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/managerfeature" method="post">
                            <div class="mb-3">
                                <label for="fuName" class="form-label">Feature Name</label>
                                <input placeholder="Nhập tên của chức năng" type="text" class="form-control" id="fuName" name="fuName" required>
                            </div>
                            <div class="mb-3">
                                <label for="clbName" class="form-label">URL</label>
                                <input placeholder="Nhập đường dẫn của chức năng" type="text" class="form-control" id="url" name="url" required>
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
