<%@page import="Model.Discount"%>
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
                border: none;
                padding: 8px;
                text-align: center;
            }

            table tr {
                border-bottom: 1px solid #ddd;
                background: #f8f9fa;
            }

            table tr:last-child {
                border-bottom: none;
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
                <div style="margin: 30px; background: white; padding: 20px; border-radius: 10px">
                    <h1 style="font-family: initial;">Danh sách sự kiện giảm giá</h1>
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
                        ArrayList<Discount> list = (ArrayList<Discount>) request.getAttribute("list");
                        if (list == null || list.size() == 0) {
                    %>
                    <h5>Chưa có sự kiện giảm giá nào</h5>
                    <div style="display: flex; justify-content: space-between">
                        <form action="managerdiscount" method="get" class="search-form" >
                            <input type="text" name="dname" placeholder="Tìm kiếm theo tên" value="${param.dname}" class="search-input">
                            <span style="margin-left: 5px; font-weight: bold">Start:</span><input style=" margin-right: 5px; border-radius: 4px" type="date" name="startDate" placeholder="Start Date" value="${param.startDate}" class="search-input">
                            <span style="font-weight: bold">End:</span><input style="border-radius: 4px"; type="date" name="endDate" placeholder="End Date" value="${param.endDate}" class="search-input">
                            <input style="margin-left: 5px" type="submit" value="Search" class="search-button">
                        </form>
                        <button style="background: #343a40; color: white; height: 43px; border-radius: 4px;" onclick="location.href = '${pageContext.request.contextPath}/admin/AddDiscount.jsp'">Add Discount</button>
                    </div>
                    <%
                    } else {
                    %>
                    <h5>Tổng <%= list.size() %> sự kiện giảm giá</h5>
                    <div style="display: flex; justify-content: space-between;">
                        <form action="managerdiscount" method="get" class="search-form">
                            <input style="border-radius: 4px" type="text" name="dname" placeholder="Tìm kiếm theo tên" value="${param.dname}" class="search-input">
                            <span style="margin-left: 5px; font-weight: bold">Start:</span><input style=" margin-right: 5px; border-radius: 4px" type="date" name="startDate" placeholder="Start Date" value="${param.startDate}" class="search-input">
                            <span style="font-weight: bold">End:</span><input style="border-radius: 4px"; type="date" name="endDate" placeholder="End Date" value="${param.endDate}" class="search-input">
                            <input style="margin-left: 5px" type="submit" value="Search" class="search-button">
                        </form>
                        <button style="background: #343a40; color: white; height: 43px; border-radius: 4px;" onclick="location.href = '${pageContext.request.contextPath}/admin/AddDiscount.jsp'">Add Discount</button>
                    </div>

                    <table border="1" style="margin-top: 10px;">
                        <tr>
                            <th>Discount ID</th>
                            <th>Discount Name</th>
                            <th>Discount Amount</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Operation</th>
                        </tr>
                        <%
                            for (Discount d : list) {
                        %>
                        <tr>
                            <td><%= d.getDiscount_ID() %></td>
                            <td><%= d.getDiscount_Name() %></td>
                            <td><%= d.getDiscount_Amount() %></td>
                            <td><%= d.getStartDate() %></td>
                            <td><%= d.getEndDate() %></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/EditDiscount.jsp?dID=<%= d.getDiscount_ID() %>" class="edit-link"><span><i class="bi bi-pencil-square"></i></span></a> &nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/managerdiscount?key=delete&dID=<%= d.getDiscount_ID() %>" class="delete-link" onclick="return confirm('Bạn có chắc muốn xóa không?');"><span><i class="bi bi-trash3-fill"></i></span></a> &nbsp;&nbsp;
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                    <br/>
                    <%
                        }
                    %>
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
