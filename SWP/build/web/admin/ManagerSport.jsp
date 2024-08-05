<%@page import="entity.sport"%>
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
                    <h1 style="font-family: initial;">Danh sách môn thể thao</h1>
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
                        ArrayList<sport> list = (ArrayList<sport>) request.getAttribute("list");
                        ArrayList<String> listName = (ArrayList<String>) request.getAttribute("listName");
                        if (list == null || list.size() == 0) {
                    %>
                    <h5>Chưa có môn thể thao nào</h5>
                    <button style="background-color: #212529" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addSportModal">Add</button>
                    <%
                    } else {
                    %>

                    <div style="display: flex; justify-content: space-between;">
                        <h5 style="padding: 10px">Tổng <%=list.size()%> môn thể thao </h5>
                        <div style="margin-left: 65%;height: 37px">
                            <form action="managersport" method="get" id="sportForm">
                                <select style="background-color: #212529; padding: 6px;color: white;border-radius: 6px" name="op" onchange="document.getElementById('sportForm').submit();">
                                    <option value="all" <%= request.getParameter("op") != null && request.getParameter("op").equals("all") ? "selected" : "" %>>All</option>
                                    <% 
                                    String selectedOp = request.getParameter("op");
                                    for (String elem : listName) { 
                                    %>
                                    <option value="<%=elem%>" <%= selectedOp != null && selectedOp.equals(elem) ? "selected" : "" %>><%=elem%></option>
                                    <% 
                                    } 
                                    %>
                                </select>
                            </form>
                        </div>


                        <button style="background-color: #212529; border-bottom: none; height: 37px; margin-right: 3%" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addSportModal">Add</button>
                    </div>

                    <table border="1" style="border-collapse: collapse">
                        <tr>
                            <th>SportID</th>
                            <th>SportName</th>
                            <th>CLBName</th>
                            <th>Operation</th>
                        </tr>
                        <%
                            for (sport s : list) {
                        %>
                        <tr>
                            <td><%= s.getSport_Id()%></td>
                            <td><%= s.getSport_Name()%></td>
                            <td><%= s.getClb_Name()%></td>

                            <td>
                                <a href="managersport?delete=<%= s.getSport_Id()%>" class="delete-link" onclick="return confirm('Bạn có chắc muốn xóa không?');">Delete</a> &nbsp;&nbsp;

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
        <div class="modal fade" id="addSportModal" tabindex="-1" aria-labelledby="addSportModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addSportModalLabel">Add Sport</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.request.contextPath}/managersport?key=1" method="post">
                            <div class="mb-3">
                                <label for="sportName" class="form-label">Sport Name</label>
                                <input type="text" class="form-control" id="sportName" name="sportname" required>
                            </div>
                            <div class="mb-3">
                                <label for="clbName" class="form-label">CLB Name</label>
                                <input type="text" class="form-control" id="clbName" name="clbname" required>
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
