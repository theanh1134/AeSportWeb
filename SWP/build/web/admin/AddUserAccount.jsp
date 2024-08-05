<%-- 
    Document   : AddUserAccount
    Created on : May 20, 2024, 4:27:24 PM
    Author     : admin
--%>

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
                    <form action="adduseraccount" method="post" style="width: 600px">
                        <h1 style="text-align: center">Thêm tài khoản mới</h1>
                        FullName : <input type="text" name="fname" value="${param.fname}" required/><br/>
                        Address : <input type="text" name="address" value="${param.address}" required/><br/>
                        <div class="a1">
                            UserName : <input type="text" name="uname" value="${param.uname}" required/> <h5 style="color: red; font-size: 0.5rem ">${error2}</h5>
                        </div>
                        Password : <input type="text" name="pword" value="${param.pword}" required/><br/>
                        <div class="a1">
                            Email : <input type="email" name="email" value="${param.email}" required/> <h5 style="color: red; font-size: 0.5rem">${error3}</h5>
                        </div>
                        Phone : <input type="text" name="phone" value="${param.phone}" required/><br/>
                        Image : <br><input type="file" name="img" value="${param.img}" /><br/>

                        <div style="display: flex">
                            <input type="submit" value="Add"/><br/>
                            <input type="reset" value="Reset"/>
                        </div>

                    </form>
                </div>
            </div>

        </div>
    </body>
</html>
