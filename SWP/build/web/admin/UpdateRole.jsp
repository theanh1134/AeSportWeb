<%-- 
    Document   : UpdateRole
    Created on : May 28, 2024, 3:27:28 PM
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
    </head>
    <body>

        <div class="row">
            <div class="col-2 border-4 border-black" style="padding-right: 0px;" >
                <jsp:include page="AdministratorPage.jsp"/>
            </div>

            <div class="col-10" style="background: #e2e7e8">
                <jsp:include page="HeaderAdmin.jsp"/>
                <div style="margin: 30px; background: white;padding: 20px;border-radius: 10px">
                    <%
                        ArrayList<Feature> list = (ArrayList<Feature>) request.getAttribute("list");
                        ArrayList<Feature> roleFeatures = (ArrayList<Feature>) request.getAttribute("roleFeatures");
                        if (list != null && list.size() > 0) {
                    %>
                    <h1 style=" font-family: initial">Update vai trò: (<%=request.getAttribute("nameRole")%>)</h1>
                    <hr>
                    <h5 style="margin-left: 5px">Các chức năng có thể làm:</h5>
                    <form action="updaterole" method="post">  

                        <%
                            for (Feature elem : list) {
                                boolean isChecked = false;
                                if (roleFeatures != null) {
                                    for (Feature roleFeature : roleFeatures) {
                                        if (elem.getFu_ID() == roleFeature.getFu_ID()) {
                                            isChecked = true;
                                            break;
                                        }
                                    }
                                }
                        %>
                        <div style="margin: 10px; font-size: large">
                            <input type="checkbox" name="features" value="<%=elem.getFu_ID()%>" <%= isChecked ? "checked" : "" %>>
                            <label for="feature_<%=elem.getFu_ID()%>"><%=elem.getFu_Name()%></label><br>
                        </div>


                        <%
                            }
                        %>
                        <input name="nameRole" value="<%=request.getAttribute("nameRole")%>" hidden >
                        <div style="display: flex">
                            <input style="margin: 5px;background-color: #212121;color: white;
                                   border-radius: 5px;cursor: pointer;font-size: 1.1em;" type="submit" value="Update">
                            <input style="margin: 5px;background-color: #212121;color: white;
                                   border-radius: 5px;cursor: pointer;font-size: 1.1em;" type="reset" value="Reset">
                        </div>

                    </form>
                    <%
                        } else {
                    %>
                    <h3>Chưa có chức năng nào!</h3>
                    <%
                        }
                    %>
                </div>


                </body>
                </html>
