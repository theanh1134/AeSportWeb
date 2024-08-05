<%-- 
    Document   : feedbackphanhoi
    Created on : May 21, 2024, 8:41:19 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đánh giá sản phẩm</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
        <style>
            /* Đảm bảo header không che khuất phần chính */
            header {
                padding-bottom: 20px; /* Thay đổi giá trị này để phù hợp với chiều cao của header */
            }
            .content {
                flex: 1;
            }
            .footer {
                background-color: #f1f1f1;
                padding: 10px;
                text-align: center;
            }

            .bredcrum{
                display: flex;
                padding-top: 200px;
            }

            /* Đặt các thuộc tính cho breadcrumb container */
            .breadcrumb-container {
                background-color: #f8f9fa; /* Màu nền nhẹ để tạo sự tương phản */
                padding: 10px 0; /* Khoảng cách trên và dưới */
                border-radius: 5px; /* Bo tròn các góc */
            }

            /* Đặt các thuộc tính cho breadcrumb */
            .breadcrumb {
                background-color: #e9ecef; /* Màu nền của breadcrumb */
                padding: 0.75rem 1.25rem; /* Padding cho breadcrumb */
                border-radius: 0.25rem; /* Bo tròn các góc */
                margin-bottom: 0; /* Loại bỏ khoảng cách dưới breadcrumb */
                font-size: 0.875rem; /* Kích thước chữ */
            }

            /* Đặt các thuộc tính cho breadcrumb item */
            .breadcrumb-item a {
                color: #007bff; /* Màu chữ của liên kết */
                text-decoration: none; /* Bỏ gạch chân */
            }

            .breadcrumb-item a:hover {
                text-decoration: underline; /* Thêm gạch chân khi hover */
            }

            .breadcrumb-item.active {
                color: #6c757d; /* Màu chữ cho item hiện tại */
            }

            /* Đảm bảo khoảng cách phù hợp cho breadcrumb */
            .row.mx-3 {
                margin-left: 1rem; /* Khoảng cách bên trái */
                margin-right: 1rem; /* Khoảng cách bên phải */
            }
        </style>
    </head>
    <body>
        <div class="d-flex flex-column min-vh-100">
            <header>
                <jsp:include page="HomePage/header.jsp"></jsp:include>
                </header>
                <div class="bredcrum">
                    <div class="row m-3 mt-3">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb bg-light">
                                <li class="breadcrumb-item"><a href="/SWP/HomePage">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Đánh Giá Sản Phẩm</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <main class="content">
                    <div class="container">
                        <h2 class="mb-4">Đánh giá sản phẩm</h2>
                        <form action="submitFeedback" method="post"  >

                            <div class="form-group mb-3">
                                <label for="reviewDetail" class="form-label">Đánh giá chi tiết:</label>
                                <textarea id="reviewDetail" name="reviewDetail" class="form-control" rows="5" placeholder="Nhập đánh giá của bạn..."></textarea>
                            </div>

                            <div class="form-group mb-3">
                                <label for="productImage" class="form-label">Hình ảnh sản phẩm:</label>
                                <input type="file" id="productImage" name="productImage" class="form-control">
                            </div>
                            <input type="hidden" id="fileName" name="fileName">
                            <script>
                                document.getElementById('productImage').addEventListener('change', function (event) {
                                    var fileName = event.target.files[0].name;
                                    console.log('Tên file:', fileName);

                                    // Gửi tên file tới servlet qua AJAX hoặc lưu vào một trường ẩn trong form
                                    document.getElementById('fileName').value = fileName;
                                });
                            </script>
                            <div class="form-group mb-3">
                                <p class="text-center"><strong>Chọn Sao</strong></p>
                                <select class="form-select" aria-label="Default select example" name="rating" id="rating" style="color: yellow;">
                                    <option value="5">&#9733; &#9733; &#9733; &#9733; &#9733; 5 Sao</option>
                                    <option value="4">&#9733; &#9733; &#9733; &#9733; 4 Sao</option>
                                    <option value="3">&#9733; &#9733; &#9733; 3 Sao</option>
                                    <option value="2">&#9733; &#9733; 2 Sao</option>
                                    <option value="1">&#9733; 1 Sao</option>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-primary w-100">Gửi đánh giá</button>
                        </form>
                    </div>
                </main>

                <footer class="footer">
                <jsp:include page="HomePage/footer.jsp"></jsp:include>
            </footer>
        </div>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    </body>
</html>