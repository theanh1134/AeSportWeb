<%-- 
    Document   : EditDiscount
    Created on : Jul 14, 2024, 3:04:31 PM
    Author     : admin
--%>

<%@page import="Model.Discount"%>
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
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
            />
    </head>
    <body>
        <div class="row">
            <div class="col-2 border-4 border-black" style="padding-right: 0px;">
                <jsp:include page="AdministratorPage.jsp"/>
            </div>


            <div class="col-10" style="background: #e2e7e8">
                <jsp:include page="HeaderAdmin.jsp"/>
                <%
                    if (request.getParameter("dID") != null) {
                        int dID = Integer.parseInt(request.getParameter("dID"));
                        AdminDAO dao = new AdminDAO();
                        Discount d = dao.getDiscountByID(dID);

                %>

                <div style="margin: 30px; background: white; padding: 20px; border-radius: 10px; display: flex; justify-content: center; align-items: center;">
                    <form action="${pageContext.request.contextPath}/managerdiscount?key=edit" method="post" style="width: 600px; font-weight: bold">
                        <h1 style="text-align: center">Chỉnh sửa sư kiện giảm giá ID<%=d.getDiscount_ID()%></h1>
                        <input name="dID" hidden value="<%=d.getDiscount_ID() %>">
                        <div class="a1">
                            Tên sự kiện : <input type="text" name="dname" value="<%=d.getDiscount_Name() %>" required/> <h5 style="color: red; font-size: 0.7rem ">${error1}</h5>
                        </div>
                        Phần trăm giảm giá(%) : <input type="text" name="amount" value="<%=d.getDiscount_Amount() %>" required/><br/>
                        <div class="a1" style="margin-top: 10px">
                            Ngày bắt đầu : <br><input style="width: 560px; height: 40px" type="date" name="startdate" value="<%=d.getStartDate() %>" /><br/>
                        </div>
                        <div class="a1" style="margin-top: 20px">
                            Ngày kết thúc : <br><input style="width: 560px; height: 40px" type="date" name="enddate" value="<%=d.getEndDate() %>" required/> <h5 style="color: red; font-size: 0.7rem">${error2}</h5>
                        </div>

                        <div style="display: flex">
                            <input type="submit" value="Edit"/><br/>
                            <a style="margin-left: 20px ; width: 300px; height: 44px; margin-top: 10px" href="${pageContext.request.contextPath}/managerdiscount" class="btn btn-dark">Cancel</a>
                        </div>

                    </form>
                    <%
                    } else {
                    %>
                    <h3>Không lấy được ID của sự kiện</h3>
                    <%
                               }%>
                </div>
            </div>
        </div>

    </body>
</html>
