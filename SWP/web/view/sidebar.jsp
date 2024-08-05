<%-- 
    Document   : sidebar
    Created on : May 21, 2024, 8:55:47 AM
    Author     : Admin
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sidebar</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div id="sidebar" class="p-4 border bg-light">
        <h3>Search Products</h3>
        <form action="searchProducts" method="get" class="form-inline mb-3">
            <input type="text" name="query" class="form-control mr-2" placeholder="Search...">
            <input type="submit" value="Search" class="btn btn-primary">
        </form>
        

        <h3>Product Categories</h3>
        <ul class="list-group mb-3">
            <li class="list-group-item"><a href="https://4menshop.com/ao-nam.html">Aó</a></li>
            <li class="list-group-item"><a href="https://4menshop.com/quan-nam.html">Quần</a></li>
            <li class="list-group-item"><a href="https://shop.webthethao.vn/bong-da-phu-kien">Phụ Kiện</a></li>
        </ul>

        <h3>Contacts</h3>
        <p>Email: <a href="mailto:support@example.com">support@example.com</a></p>
        <p>Phone: <a href="tel:+123456789">+123456789</a></p>
    </div>
    <!-- Bootstrap JS and dependencies (Optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>