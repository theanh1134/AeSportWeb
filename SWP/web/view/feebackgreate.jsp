<%-- 
    Document   : feebackgreate
    Created on : Jul 19, 2024, 3:59:33 PM
    Author     : Admin
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lời Chúc Mua Sắm</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
            }
            .header {
                background-color: #343a40;
                padding: 10px 0;
            }
            .header .btn {
                margin: 5px;
            }
            .content {
                display: flex;
                justify-content: center;
                align-items: center;
                height: calc(100vh - 56px); /* Trừ chiều cao của header */
            }
            .container {
                text-align: center;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h1 {
                color: #333;
            }
            p {
                color: #666;
            }
        </style>
    </head>
    <body>
        <!-- Header với các nút -->
        <div class="header text-center">
            <button class="btn btn-info" onclick="window.location.href = 'HomePage'">HomePage</button>
            <button class="btn btn-primary" onclick="window.location.href = 'introBrand'">Giới Thiệu</button>
            <button class="btn btn-secondary" onclick="window.location.href = 'productall'">Tất Cả Sản Phẩm</button>
            <button class="btn btn-success" onclick="window.location.href = 'choosesize'">Cách Chọn Size</button>
            <button class="btn btn-danger" onclick="window.location.href = 'BlogList?page=1'">Tin Tức</button>
            <button class="btn btn-warning" onclick="window.location.href = 'help/support.jsp'">Hỗ Trợ</button>
        </div>

        <!-- Nội dung chính -->
        <div class="content">
            <div class="container">
                <h1>Cảm Ơn Quý Khách đã đánh giá sản phẩm của chúng tôi</h1>
                <p>Chúc quý khách có một trải nghiệm mua sắm tuyệt vời!</p>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
