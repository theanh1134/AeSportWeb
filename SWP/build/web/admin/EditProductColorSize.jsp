<%@page import="Model.ProductSizeColor"%>
<%@page import="Model.Size"%>
<%@page import="Model.Color"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Product"%>
<%@page import="DBContext.AdminDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/table.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/form.css">
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

            .equal-width {
                width: 33.33%;
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
                <div style="display: flex; justify-content: center">
                    <%
                        String productID = request.getParameter("pID");
                        AdminDAO dao = new AdminDAO();
                        Product product = dao.getProductByID(Integer.parseInt(productID));
                        ArrayList<ProductSizeColor> listSC = dao.getAllProductSizeColorByPID(Integer.parseInt(productID));

                    %>
                    <form action="${pageContext.request.contextPath}/editproduct?key=4" method="post" style="margin-top: 50px; width: 800px;">
                        <input type="hidden" value="<%=request.getParameter("pID")%>" name="pID">

                        <h1 style="font-family: initial; text-align: center">Thêm màu và cỡ cho sản phẩm ID<%=request.getParameter("pID")%></h1>
                        <!-- Product Size Color Table -->
                        <table border="1" style="border-collapse: collapse;">
                            <thead>
                                <tr>
                                    <th class="equal-width">Màu sắc</th>
                                    <th class="equal-width">Khích cỡ</th>
                                    <th class="equal-width">Số lượng</th>
                                    <th style="color: orangered;">Xóa</th> <!-- Thêm cột cho việc xóa -->
                                </tr>
                            </thead>
                            <tbody>
                                <% for (ProductSizeColor psc : listSC) { %>
                                <tr>
                                    <td class="equal-width">
                                        <input type="hidden" name="colorID" value="<%= psc.getColorID() %>">
                                        <p><%= dao.getColorByCID(psc.getColorID()).getColor_Name() %></p>
                                    </td>
                                    <td class="equal-width">
                                        <input type="hidden" name="sizeID" value="<%= psc.getSizeID() %>">
                                        <p><%= dao.getSizeBySID(psc.getSizeID()).getSize_Name() %></p>
                                    </td>
                                    <td class="equal-width">
                                        <input type="number" name="quantity" value="<%= psc.getQuantity()%>">
                                    </td>
                                    <td>
                                        <input style="width:25px;height:25px" type="checkbox" name="deleteRow" value="<%= psc.getColorID() + "-" + psc.getSizeID() %>">
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                        <div style="display: flex; justify-content: flex-start; margin-top: 20px">
                            <button type="submit" style="margin-right: 20px; width: 100px; height: 44px;" class="btn btn-dark">Lưu</button>
                            <a href="${pageContext.request.contextPath}/editproduct?pID=<%=request.getParameter("pID")%>" class="btn btn-dark">Cancel</a>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </body>
</html>
