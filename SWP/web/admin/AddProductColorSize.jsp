<%-- 
    Document   : AddProductColorSize
    Created on : Jul 6, 2024, 12:03:57 AM
    Author     : admin
--%>

<%@page import="Model.Product"%>
<%@page import="DBContext.AdminDAO"%>
<%@page import="Model.ProductSizeColor"%>
<%@page import="Model.Size"%>
<%@page import="Model.Color"%>
<%@page import="java.util.ArrayList"%>
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
                    <form action="editproduct?key=3" method="post" style="margin-top: 100px; width: 800px;">
                        <h1 style="font-family: initial; text-align: center">Thêm màu và cỡ cho sản phẩm ID<%=request.getParameter("pID")%></h1>
                        <input type="hidden" value="<%=request.getParameter("pID")%>" name="pID">

                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Màu sắc</th>
                                    <th>Kích cỡ</th>
                                    <th>Số lượng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int numberColorSize = Integer.parseInt(request.getAttribute("numberColorSize").toString());
                                    ArrayList<Color> listColor = (ArrayList<Color>) request.getAttribute("listColor");
                                    ArrayList<Size> listSize = (ArrayList<Size>) request.getAttribute("listSize");
                                    for (int i = 0; i < numberColorSize; i++) {
                                %>
                                <tr>
                                    <td>
                                        <select class="form-select" id="colorID" name="colorID_<%=i%>">
                                            <%
                                                for (Color color : listColor) {
                                            %>
                                            <option value="<%=color.getColor_ID()%>"><%=color.getColor_Name()%></option>
                                            <% }%>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-select" id="sizeID" name="sizeID_<%=i%>">
                                            <%
                                                for (Size size : listSize) {
                                            %>
                                            <option value="<%=size.getSize_ID()%>"><%=size.getSize_Name()%></option>
                                            <% }%>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="number" class="form-control" id="quantity" name="quantity_<%=i%>" min="1">
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                        <input type="hidden" value="<%=numberColorSize%>" name="numberColorSize">
                        <div style="display: flex; justify-content: flex-start">
                            <button type="submit" style="margin-right: 20px; width: 100px; height: 44px;" class="btn btn-dark">Thêm</button>
                            <a style="" href="${pageContext.request.contextPath}/editproduct?pID=<%=request.getParameter("pID")%>" class="btn btn-dark">Cancel</a>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
