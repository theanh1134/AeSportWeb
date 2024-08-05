<%-- 
    Document   : productDetail
    Created on : Jun 6, 2024, 11:12:04 PM
    Author     : Hoàng Sơn
--%>

<%@page import="entity.product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="productDetail" value="${requestScope.productDetail}" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sản Phẩm</title>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <style>
            .form-check-input {
                display: none;
            }
            .form-check-label {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                display: inline-block;
                cursor: pointer;
                transition: transform 0.3s, box-shadow 0.3s;
            }
            .form-check-input:checked + .form-check-label {
                border: 4px solid #000;
                box-shadow: 0 0 20px rgba(0, 123, 255, 0.5); /* Hiệu ứng bóng */
            }
            input[type="number"]::-webkit-outer-spin-button,
            input[type="number"]::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
            input[type="number"] {
                -moz-appearance: textfield;
            }

            .yellow-star {
                color: yellow;
                font-size: 28px; /* Kích thước của sao */
            }

            .btn-check:checked + label  {
                border: 2px solid #007bff;
                box-shadow: 0 0 10px rgba(0, 123, 255, 0.5); /* Hiệu ứng bóng */
            }
            .btn-check + label {
                border: 2px solid transparent;
                transition: border-color 0.3s ease, box-shadow 0.3s ease;
            }
            .card-title {
                color: #db0075;
            }
            .card-text {
                color: #17E6E6;
            }
            .list-inline-item {
                color: #ffd700
            }
            .price {
                color: #d92644;
            }
            .btn-pink {
                background-color: #fcb2b2 !important;
            }

            .button-view {
                width: 6.5em;
                height: 2.3em;
                margin: 0.5em;
                background: black;
                color: white;
                border: none;
                border-radius: 0.625em;
                font-size: 20px;
                font-weight: bold;
                cursor: pointer;
                position: relative;
                z-index: 1;
                overflow: hidden;
            }

            .button-view:hover {
                color: black;
            }

            .button-view:after {
                content: "";
                background: white;
                position: absolute;
                z-index: -1;
                left: -20%;
                right: -20%;
                top: 0;
                bottom: 0;
                transform: skewX(-45deg) scale(0, 1);
                transition: all 0.5s;
            }

            .button-view:hover:after {
                transform: skewX(-45deg) scale(1, 1);
                -webkit-transition: all 0.5s;
                transition: all 0.5s;
            }

        </style>
    </head>


    <body>
        <jsp:include page="../HomePage/header.jsp"/>
        <div class="m-223 container  ">
            <nav aria-label="breadcrumb" >
                <ol class="breadcrumb my-5 py-5 ms-0 transition-1">
                    <li class="breadcrumb-item ">
                        <span><i class="bi bi-house-door mx-3"></i></span>
                        <a href="HomePage" class="text-decoration-none text-black">Home</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Sản Phẩm</li>
                </ol>
            </nav>

            <div class="row  ">
                <div class="col-6 px-0 ">
                    <div class="position-relative">
                        <img src="img/product/${requestScope.listImg.get(o).url}" style="width: 670px; height: 700px;" id="largeImage" class="img-thumbnail " alt="...">
                        <c:if test="${ productDetail.getStatus() == 'sale'}">
                            <span  class="  z-1 position-absolute p-3 m-2 rounded-circle text-white bg-danger fs-5  end-0">-${productDetail.getDiscount().getDiscount_Amount()}%</span>
                        </c:if>
                    </div>

                    <div class="row mt-3">
                        <c:forEach var="img" items="${requestScope.listImg}">
                            <div class="col-2 px-0">
                                <img src="img/product/${img.url}" class="img-thumbnail thumbnail-image" alt="Thumbnail${img.id}">
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="col-6 ps-5">
                    <h2 class="mt-5">${productDetail.productName}</h2>
                    <div class="d-flex">
                        <div class="d-flex">
                            <span class="yellow-star">&#9733;</span>
                            <span class="yellow-star">&#9733;</span>
                            <span class="yellow-star">&#9733;</span>
                            <span class="yellow-star">&#9733;</span>
                            <span class="yellow-star">&#9733;</span>
                            <p class="mb-0 d-flex align-items-center">(5/5)</p>
                        </div>
                        <div class="d-flex align-items-center">
                            <span class="mx-3">&#124;</span>
                            <p class="font-monospace mb-0">Đã bán ${productDetail.getQuantity_sold()} sản phẩm</p>
                        </div>
                    </div>

                    <form action="Product" method="post" id="productForm">
                        <input type="hidden" name="productId" value="${param.productId}"/>
                        <label for="size">Size</label>
                        <div id="size-options" class="mt-3 ms-3">
                            <div id="sizeForm" class="d-flex">
                                <c:forEach var="size" items="${listSize}">
                                    <input type="radio" class="btn-check size-radio" name="size" id="size${size.size_ID}" value="${size.size_ID}" autocomplete="off">
                                    <label class="btn mx-1 bg-body-tertiary d-flex justify-content-center align-items-center" for="size${size.size_ID}">${size.size_Name}</label>
                                </c:forEach>
                            </div>
                        </div>

                        <label for="color">Màu</label>
                        <div class="d-flex mt-3 justify-content-start">
                            <c:forEach var="color" items="${listColor}">
                                <div class="form-check">
                                    <input type="radio" class="form-check-input" id="radio${color.color_Name}" name="color" value="${color.getColor_ID()}">
                                    <label class="form-check-label" style="background-color:${color.getCode()}; width: 30px; height: 30px" for="radio${color.color_Name}"></label>
                                </div>
                            </c:forEach>
                        </div>

                        <label for="quantity">Số lượng</label>
                        <div class="my-3 d-flex align-items-center">
                            <div class="input-group">
                                <button class="btn btn-dark input-group-text" id="decreaseBtn" type="button">-</button>
                                <input type="number" class="form-control text-center" id="numberInput" name="number" value="1" readonly>
                                <button class="btn btn-dark input-group-text" id="increaseBtn" type="button">+</button>
                            </div>
                        </div>


                        <label for="price">Giá bán</label>
                        <!-- Kiểm tra nếu trạng thái sản phẩm không phải là 'sale' -->
                        <c:if test="${productDetail.status != 'sale'}">
                            <h1 class="text-danger w-50 text-center">${productDetail.price}đ</h1>
                        </c:if>


                        <c:if test="${productDetail.status == 'sale'}">
                            <span class=" fs-3 text-decoration-line-through ms-3">      ${productDetail.price}đ</span>


                            <h1 class="text-danger w-50 text-center">
                                ${Math.round((productDetail.price / 100) * (100 - productDetail.discount.discount_Amount))}đ
                            </h1>
                        </c:if>



                        <div class="mt-3">
                            <button type="submit" class="fs-5 btn btn-danger w-50" value="1" name="action" id="buyNowBtn">Mua Ngay!</button>
                            <button type="button" onclick="addToCart(${param.productId})" class="fs-4 btn ms-2 bg-body-tertiary text-danger" value="2" name="action" id="addToCartBtn"><i class="bi bi-cart-plus"></i></button>
                        </div>
                    </form>

                </div>

                <div class="text-dark my-5">
                    <hr>
                </div>
                <div class="row w-100 ">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active text-black" id="detail-tab" data-bs-toggle="tab" data-bs-target="#detail-tab-pane" type="button" role="tab" aria-controls="detail-tab-pane" aria-selected="true">Chi tiết sản phẩm</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link  text-black" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="false">Mô tả sản phẩm</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link text-black" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Đánh Giá</button>
                        </li>
                    </ul>

                    <div class="tab-content mt-5" id="myTabContent">
                        <div class="tab-pane fade show active" id="detail-tab-pane" role="tabpanel" aria-labelledby="detail-tab" tabindex="0">
                            <p class="fw-semibold">Doanh Mục:<span class="fw-normal">   
                                    <c:if test="${productDetail.cate.type == 'nam'}">Nam</c:if>
                                    <c:if test="${productDetail.cate.type == 'nu'}">Nữ</c:if>
                                    <c:if test="${productDetail.cate.type == 'phu_kien'}">Phụ Kiện</c:if>
                                    <c:if test="${productDetail.cate.type == 'the_thao'}">Thể Thao</c:if>
                                    <c:if test="${productDetail.cate.type == 'thuong_hieu'}">Thương Hiệu</c:if>
                                    / ${productDetail.cate.category_Name} </span>
                            </p>
                            <p class="fw-semibold">Loại trang phục: <span class="fw-normal">:${productDetail.getSubCate().getSubcategory_Name()} </span></p>
                            <p class="fw-semibold">Xuất xứ::  <span class="fw-normal">Việt Nam</span> </p>
                        </div>

                        <div class="tab-pane fade show " id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">${productDetail.description}</div>
                        <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
                            <div class="row">
                                <div class="col-md-8">

                                    <!-- Form tìm kiếm -->
                                    <h1 class="mb-4">Phản Hồi</h1>

                                    <table class="table table-bordered table-striped">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>User</th>
                                                <th>Đánh Giá Chi Tiết</th>
                                                <th>Hình Ảnh</th>
                                                <th>Số Sao</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="fbl" items="${listbyproID}">
                                                <tr>
                                                    <td>${fbl.username}</td>
                                                    <td>${fbl.detal}</td>
                                                    <td><img src="img/product/${fbl.img}" alt="Feedback Image" class="img-thumbnail" style="max-width: 150px;"></td>
                                                    <td>
                                                        <div class="d-flex align-items-center">
                                                            <c:forEach var="i" begin="1" end="${fbl.start}">
                                                                <span class="yellow-star">&#9733;</span>
                                                            </c:forEach>
                                                            <c:forEach var="i" begin="${fbl.start + 1}" end="5">
                                                                <span class="grey-star">&#9733;</span>
                                                            </c:forEach>
                                                            <p class="mb-0 ml-2">(${fbl.start}/5)</p>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table> 

                                    <div class="card feedback-card">
                                        <div class="card-header bg-primary text-white">
                                            <h5 class="card-title mt-2">Ý Kiến Của Bạn</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="text-center">
                                                <i class="far fa-file-alt feedback-icon mb-3"></i>
                                                <p><strong>Ý kiến của bạn rất quan trọng</strong></p>
                                                <p>Có một số ý tưởng về cách cải thiện sản phẩm của chúng tôi?  <strong>Hãy cho chúng tôi phản hồi của bạn.</strong></p>
                                            </div>
                                            <hr />
                                            <form class="px-4" action="feedback1" method="POST">
                                                <div class="mb-3">
                                                    <p class="text-center"><strong>Chọn Sao</strong></p>
                                                    <select class="form-select" aria-label="Default select example" name="rating" id="rating" style="color: yellow;">
                                                        <option value="5">&#9733; &#9733; &#9733; &#9733; &#9733; 5 Sao</option>
                                                        <option value="4">&#9733; &#9733; &#9733; &#9733; 4 Sao</option>
                                                        <option value="3">&#9733; &#9733; &#9733; 3 Sao</option>
                                                        <option value="2">&#9733; &#9733; 2 Sao</option>
                                                        <option value="1">&#9733; 1 Sao</option>
                                                    </select>
                                                </div>
                                                <p class="text-center"><strong>Chúng tôi có thể cải thiện điều gì?</strong></p>
                                                <div data-mdb-input-init class="form-outline mb-4">
                                                    <textarea class="form-control" id="form4Example3" name="feedback" rows="4"></textarea>
                                                    <label class="form-label" for="form4Example3">Phản hồi của bạn</label>
                                                </div>
                                                <button type="submit" class="btn btn-primary">Gửi</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class=" my-5">
                <h2 class="w-100 ms-3 border-start border-5 border-black border-opacity-75 mb-4 ps-2">   SẢN PHẨM LIÊN QUAN</h2>
                <div class="d-flex justify-content-between mb-3">
                    <c:forEach items="${requestScope.productsRelated}" var="p">
                        <c:if test="${param.productId != p.getProductID()}">
                            <div  class=" bg-body-tertiary  shadow">
                                <div class="card" style="width: 18rem;">
                                    <c:if test="${ p.getStatus() == 'sale'}">
                                        <span  class="  z-1 position-absolute p-2 m-2 rounded-5 text-white bg-danger top-0 end-0 ">-${p.getDiscount().getDiscount_Amount()}%</span>
                                    </c:if>
                                    <img src="img/product/${p.getImage().get(0).getUrl()}" class="card-img-top" alt="...">
                                    <div class="card-body text-center">
                                        <h5 class="card-title text-black" style="height: 3.5rem">
                                            ${ p.getProductName()}
                                        </h5>

                                        <c:if test="${ p.getStatus() == 'sale'}">
                                            <p class="card-text fs-6 text-decoration-line-through my-3 mb-0 text-body-secondary " >
                                                ${p.getPrice()}đ
                                            </p>
                                            <h4 class="text-danger my-2 ">
                                                ${Math.round((p.getPrice() / 100) * (100-p.getDiscount().getDiscount_Amount()))} đ
                                            </h4>
                                        </c:if>
                                        <c:if test="${ p.getStatus() != 'sale'}">
                                            <h4 class="text-danger mt-5 ">
                                                ${p.getPrice()} đ
                                            </h4>
                                        </c:if>

                                        <a href="Product?productId=${p.getProductID()}">
                                            <button class="button-view"> 
                                                <div class="button-wrapper1 ">
                                                    <div class="text1  "> MUA!</div>
                                                </div>
                                            </button>

                                        </a>

                                    </div>
                                </div> 
                            </div>
                        </c:if>
                    </c:forEach>
                </div>


            </div>
            <div>   

            </div>



        </div>           
    </div>
    <jsp:include page="../HomePage/footer.jsp"/>
    <script>
        const numberInput = document.getElementById('numberInput');
        const increaseBtn = document.getElementById('increaseBtn');
        const decreaseBtn = document.getElementById('decreaseBtn');

        increaseBtn.addEventListener('click', function (event) {
            event.preventDefault();
            numberInput.stepUp();
        });
        decreaseBtn.addEventListener('click', function (event) {
            event.preventDefault();
            if (numberInput.value > 1) {
                numberInput.stepDown();
            }
        });

        var thumbnailImages = document.querySelectorAll('.thumbnail-image');
        thumbnailImages.forEach(function (image) {
            image.addEventListener('click', function () {
                var smallImageUrl = this.src;
                document.getElementById('largeImage').src = smallImageUrl;
            });
        });

        document.getElementById("productForm").addEventListener("submit", function (event) {
            var sizeSelected = document.querySelector('input[name="size"]:checked');
            var colorSelected = document.querySelector('input[name="color"]:checked');

            if (!colorSelected && !sizeSelected) {
                event.preventDefault();
                alert("Vui lòng chọn Màu và Size tiếp tục.");
            }

            if (!sizeSelected && colorSelected) {
                event.preventDefault();
                alert("Vui lòng chọn Size tiếp tục.");
            }
            if (!colorSelected && sizeSelected) {
                event.preventDefault();
                alert("Vui lòng chọn Màu tiếp tục.");
            }

        });


        const addToCart = (productId) => {
            const url = "<%=request.getContextPath()%>" + "/CartPage";
            var sizeSelected = document.querySelector('input[name="size"]:checked');
            var colorSelected = document.querySelector('input[name="color"]:checked');

            if (!colorSelected && !sizeSelected) {
                alert("Vui lòng chọn Màu và Size tiếp tục.");
            } else if (!sizeSelected && colorSelected) {
                alert("Vui lòng chọn Size tiếp tục.");
            } else if (!colorSelected && sizeSelected) {
                alert("Vui lòng chọn Màu tiếp tục.");
            } else {
                $.ajax({
                    type: 'POST',
                    url: url,
                    data: {
                        productId: productId,
                        number: $("#numberInput").val()
                    },
                    success: function (response) {
                        var data = JSON.parse(response);
                        $("#cart-size").text(data.size);
                        alert(data.message);
                    }
                });
            }
        };



    </script>
</body>
</html>
