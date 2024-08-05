<%-- 
    Document   : ManagerUserAccount
    Created on : May 18, 2024, 9:58:04 PM
    Author     : admin
--%>
<%@page import="Model.UserAccount"%>
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
                    <h1 style="font-family: initial; b">Danh sách tài khoản <span style="color: blue">người dùng</span></h1>
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
                        ArrayList<UserAccount> list = (ArrayList<UserAccount>) request.getAttribute("list");
                        if (list == null || list.size() == 0) {
                    %>
                    <h5 style="padding:">Chưa có Người Dùng nào</h5>
                    <div style="display: flex; justify-content: space-between" >
                        <form action="manageruseraccount" method="post" class="search-form" style="margin-right: 700px">
                            <input type="text" name="fullname" placeholder="Tìm kiếm theo tên" value="${param.fullname}" class="search-input">
                            <input type="submit" value="Search" class="search-button">
                        </form>
                        <button style="background: #343a40;color: white; height: 43px; border-radius: 4px " onclick="location.href = '${pageContext.request.contextPath}/adduseraccount'">Add UserAccount</button>
                    </div>

                    <%
                    } else {
                    %>
                    <h5 style="">Tổng <%=list.size()%> tài khoản</h5>
                    <div style="display: flex; justify-content: space-between ">
                        <form action="manageruseraccount" method="post" class="search-form" style="margin-right: 700px">
                            <input type="text" name="fullname" placeholder="Tìm kiếm theo tên" value="${param.fullname}" class="search-input">
                            <input type="submit" value="Search" class="search-button">
                        </form>
                        <button style="background: #343a40;color: white; height: 43px; border-radius: 4px " onclick="location.href = '${pageContext.request.contextPath}/adduseraccount'">Add UserAccount</button>
                    </div>

                    <table border="1" style=" margin-top: 10px;">
                        <tr>
                            <th>UserID</th>
                            <th>UserName</th>
                            <th>FullName</th>
                            <th>Email</th>
                            <th>Registration Date</th>
                            <th>Active</th>
                            <th>Operation</th>
                        </tr>
                        <% String check = null;
                            for (UserAccount u : list) { %>
                        <tr>
                            <td><%= u.getUse_ID() %></td>
                            <td><%= u.getUserName() %></td>
                            <td><%= u.getFull_Name() %></td>
                            <td><%= u.getEmail() %></td>
                            <td><%= u.getDateCreate() %></td>
                            <td>
                                <form action="deleteuseraccount?key=1" method="post" style="margin: 0;">
                                    <input type="hidden" name="userID" value="<%= u.getUse_ID() %>">
                                    <input type="hidden" name="status" id="statusInput_<%= u.getUse_ID() %>" value="<%= u.getStatus() %>">
                                    <% if (u.getStatus() == null || "none".equals(u.getStatus())) {
                                         check = "";
                                    } else if ("active".equals(u.getStatus())) {
                                         check = "checked";
                                    }
                                    %>
                                    <input style="width: 20px;height: 20px" type="checkbox" <%= check %> id="statusCheckbox_<%= u.getUse_ID() %>" onchange="updateStatus('<%= u.getUse_ID() %>')">
                                </form>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/edituseraccount?uID=<%= u.getUse_ID() %>" class="edit-link"><span><i class="bi bi-pencil-square"></i></span></a> &nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/updateaccount?uID=<%= u.getUse_ID() %>" class="update-link"><span><i class="bi bi-gear-wide"></i></span></a> &nbsp;&nbsp;
                            </td>
                        </tr>
                        <% } %>
                    </table>
                    <br/>

                    <%
                        }
                    %>

                </div>
            </div>
        </div>

        <script>
            function updateStatus(userID) {
                var checkbox = document.getElementById('statusCheckbox_' + userID);
                var statusInput = document.getElementById('statusInput_' + userID);
                if (checkbox.checked) {
                    statusInput.value = 'active';
                } else {
                    statusInput.value = 'none';
                }
                checkbox.closest('form').submit();
            }

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
