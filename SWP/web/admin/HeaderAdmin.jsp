<%-- 
    Document   : HeaderAdmin
    Created on : May 25, 2024, 1:17:29 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Header</title>
        
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/heade.css">
    </head>
    <body>
        <div class="header row ">
            
            <div class="admin-page col-8"><i class="bi bi-gear"> </i>Administrator Page</div>
            <div class="user-info col-2 d-flex justify-content-center ">
                
                <c:if test="${sessionScope.CRRAccount != null}">
                    <i style="margin-right: 8px" class="bi bi-person-circle"></i><a href="view/ViewProfile.jsp" class="font-monospace text-black fs-7"> ${sessionScope.CRRAccount.getFull_Name()}</a>
                </c:if>
            </div>
        </div>
    </body>
</html>
