<%-- 
    Document   : feedbacklist
    Created on : May 21, 2024, 7:56:41 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .pagination-container {
                display: flex;
                justify-content: center;
                margin-top: 20px;
            }

            .pagination-link {
                display: inline-block;
                width: 30px;
                height: 30px;
                margin: 0 5px;
                line-height: 30px;
                text-align: center;
                border: 1px solid #ddd;
                text-decoration: none;
                color: #007bff;
                transition: background-color 0.3s, color 0.3s;
                border-radius: 4px;
            }

            .pagination-link:hover {
                background-color: #007bff;
                color: #fff;
            }
            .product-card {
                border: 1px solid #ddd;
                padding: 16px;
                margin: 16px 0;
            }
            .product-image img {
                width: 100%;
                height: auto;
            }
            .product-info {
                margin-top: 16px;
            }
            .product-price {
                color: red;
                font-size: 1.5em;
            }
            .product-old-price {
                text-decoration: line-through;
                color: #888;
            }
            .product-rating {
                color: #f39c12;
            }
            .product-actions button {
                margin-right: 8px;
            }
        </style>

    </style>
</head>
<body>
    <div class="container mt-5">

        <h2 class="mb-4">Product List</h2>
        <div class="row">
            <!-- Product Card Start -->
            <div class="col-md-10">
                <div class="product-card">
                    <h4>Bộ thi đấu Đội tuyển Quốc gia 2024 (bản Fan)</h4>
                    <div class="product-image">
                        <img src="img\IMGProduct\aodoituyenvn.png" alt="Product Image">
                    </div>
                    <div class="product-info">
                        <h4>Bộ thi đấu Đội tuyển Quốc gia 2024 (bản Fan)</h4>
                        <p>ID Sản Phẩm: 2</p>
                        <p class="product-price">đ499,000</p>
                        <p>Mô Tả: Với khẩu hiệu "Hào khí Việt Nam - Non sông tiếp bước", BST tôn vinh các giá trị truyền thống quý báu và tinh thần dân tộc 

                            thông qua họa tiết chim lạc trên trống đồng Đông Sơn và biểu tượng ngôi sao 5 cánh đặc trưng.

                            Những chiến binh trên sân cỏ, những người con của đất Việt lớn lên từ hạt gạo, từ bông lúa của làng quê Việt Nam, 

                            sẽ được tiếp lửa từ sức mạnh của trời và đất, của núi và sông, của nước non Việt Nam tươi đẹp mà hùng vĩ, 

                            cũng như tiếp nối những giá trị từ hàng ngàn năm lịch sử để cùng nhau tạo nên kỳ tích trên đấu trường khu vực và quốc tế.</p>
                        <p>Size: XL</p>
                        <p>Số Lượng: 5</p>
                        <p>Trạng Thái: new</p>
                        <p>Sport ID: 1</p>
                        <p>Loại: Áo</p>
                        <p>Gender: Unisex </p>
                    </div>
                    <div class="product-actions">
                        <button class="btn btn-primary">Thêm vào giỏ hàng</button>
                        <button class="btn btn-secondary">Mua ngay</button>
                    </div>
                </div>
            </div>
            <!-- Product Card End -->
            <!-- Add more product cards as needed -->
        </div>



        <div class="row">
            <div class="col-md-8">
                <h2 class="mb-4">Đánh Giá Sản Phẩm</h2>
                <!-- Form tìm kiếm -->
                <form action="feedbacklist" method="POST" class="form-inline mb-4">
                    <input type="text" name="username" class="form-control mr-2" placeholder="Tìm theo tên người dùng" />
                    <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                </form>
                <table class="table table-bordered table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th>User</th>
                            <th>Đánh Giá Chi Tiết</th>
                            <th>Hình Ảnh</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="fbl" items="${listA}">
                            <tr>
                                <td>${fbl.username}</td>
                                <td>${fbl.detal}</td>
                                <td><img src="${fbl.img}" alt="Feedback Image" class="img-thumbnail" style="max-width: 150px;"></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-md-4">
                <jsp:include page="sidebar.jsp" />
            </div>
        </div>
        <div class="pagination-container">
            <c:forEach begin="1" end="${endPage}" var="i">
                <a href="feedbacklist?index=${i}" class="pagination-link">${i}</a>
            </c:forEach>
        </div>

    </div>
    <!-- Bootstrap JS and dependencies (Optional) -->

</body>
</html>
