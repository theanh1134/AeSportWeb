<%-- 
    Document   : AddProductImg
    Created on : Jul 4, 2024, 5:29:14 PM
    Author     : admin
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    </head>
    <body>
        <div class="row">
            <div class="col-2 border-4 border-black" style="padding-right: 0px;" >
                <jsp:include page="AdministratorPage.jsp"/>
            </div>

            <div class="col-10" style="background: #e2e7e8">
                <jsp:include page="HeaderAdmin.jsp"/>
                <div style="display: flex; justify-content: center">
                    <form action="editproduct?key=1" method="post" style="margin: 20px; width: 800px;">
                        <h1 style="font-family: initial; text-align: center">Thêm ảnh cho sản phẩm ID<%=request.getParameter("pID")%></h1>
                        <input type="hidden" value="<%=request.getParameter("pID")%>" name="pID">
                        <%
                            // Retrieve the numberImg attribute from the request
                            String numberImgParam = (String) request.getAttribute("numberImg");
                            int numberImg = 0;
                            if (numberImgParam != null) {
                                try {
                                    numberImg = Integer.parseInt(numberImgParam);
                                } catch (NumberFormatException e) {
                                    // Handle the exception if the parameter is not a valid number
                                    out.println("<p>Invalid number of images specified.</p>");
                                }
                            }
                            
                            // Generate the input fields
                            for (int i = 1; i <= numberImg; i++) {
                        %>
                        <div class="mb-3">
                            <label for="image<%=i%>" style="font-weight: bold" class="form-label">Image <%=i%></label>
                            <input type="file" class="form-control" id="image<%=i%>" name="image<%=i%>">
                        </div>
                        <%
                            }
                        %>
                        <input type="hidden" value="<%=numberImg%>" name="numberImg">
                        <div style="display: flex; justify-content: center">
                            <button type="submit" class="btn btn-dark">Thêm</button>
                            <a style="margin-left: 20px" href="${pageContext.request.contextPath}/editproduct?pID=<%=request.getParameter("pID")%>" class="btn btn-dark">Cancel</a>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
