<%-- 
    Document   : EditUserAccount
    Created on : May 20, 2024, 3:20:29 PM
    Author     : admin
--%>

<%@page import="Model.Address"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.UserAccount"%>
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

                <div style="margin: 30px; background: white; padding: 20px; border-radius: 10px; display: flex; justify-content: center; align-items: center;">
                    <%
                        UserAccount u = (UserAccount) request.getAttribute("user");
                        ArrayList<Address> adrList = (ArrayList<Address>)request.getAttribute("adrList");
                        if (u == null) {
                            response.sendRedirect("manageruseraccount");
                        } else {
                    %>
                    <div style="width: 900px;">
                        <h1 style="padding: 10px; text-align: center">Chỉnh sửa tài khoản ID: <%=u.getUse_ID()%></h1>
                        <form action="edituseraccount" method="post" class="row" style="width: 100%;" >
                            <div class="col-4" style="margin-top: 10px">
                                <%
                                    String userImage = u.getImg();
                                    if (userImage != null && !userImage.trim().isEmpty()) {
                                %>
                                <img src="img/account/<%= userImage %>" alt="User Image" style="width: 260px; height: 194px; border-radius: 20px"/><br/>
                                <%
                                } else {
                                %>
                                <img src="img/account/no.webp" alt="User Image" style="width: 260px; height: 194px; border-radius: 20px"/><br/>
                                <%
                                }
                                %>
                                <input style="margin-top: 10px" type="file" name="img1" value="" /><br/>
                                <input type="text" value="<%=u.getImg()%>" name="img2" hidden/>
                            </div>

                            <div class="col-8" style="font-weight: bold">
                                UserID: <input type="number" name="uid" value="<%=u.getUse_ID()%>" readonly /><br/>

                                FullName: <input type="text" name="fname" value="<%=u.getFull_Name()%>" required/><br/>
                                <div class="a1">
                                    UserName: <input type="text" name="uname" value="<%=u.getUserName()%>" required/><h5 style="color: red">${error1}</h5>
                                </div>
                                Password: 
                                <div style="display: flex">
                                    <input type="password" id="pword" name="pword" value="<%=u.getPassword()%>" required/>
                                    <button style="margin: 10px;"type="button" onclick="togglePassword()">Show</button>
                                </div>

                                <div class="a1">
                                    Email: <input type="email" name="email" value="<%=u.getEmail()%>" required/><br/><h5 style="color: red">${error2}</h5>
                                </div>
                                Phone: <input type="text" name="phone" value="<%=u.getPhone_number()%>" required/><br/><br/>
                                
                                Address: <input type="text" name="address" value="<%=u.getAddress()%>" required/><br/><br/>
                                
                            </div>

                            <div style="display: flex;">
                                <input type="submit" value="Edit"/><br/>
                                <input type="reset" value="Reset"/>
                            </div>
                        </form>

                        <script>
                            function togglePassword() {
                                var passwordField = document.getElementById("pword");
                                var button = event.target;
                                if (passwordField.type === "password") {
                                    passwordField.type = "text";
                                    button.textContent = "Hide";
                                } else {
                                    passwordField.type = "password";
                                    button.textContent = "Show";
                                }
                            }
                        </script>

                    </div>
                    <%
                        }
                    %>
                </div>

            </div>
    </body>
</html>




