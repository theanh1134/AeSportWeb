<%-- 
    Document   : Product1.jsp
    Created on : Jul 14, 2024, 4:41:53 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <style>

            body{
                overflow-x: hidden;
            }
            .m-200{
                margin-top: 200px;
            }

            .fixed-height {
                height: 4em;

            }
            .button {
                --width: 120px;
                --height: 40px;
                --tooltip-height: 35px;
                --tooltip-width: 90px;
                --gap-between-tooltip-to-button: 18px;
                --button-color: #222;
                --tooltip-color: #fff;
                width: var(--width);
                height: var(--height);
                background: var(--button-color);
                position: relative;
                text-align: center;
                border-radius: 0.45em;
                font-family: "Arial";
                transition: background 0.3s;
            }

            .button::before {
                position: absolute;
                content: attr(data-tooltip);
                width: var(--tooltip-width);
                height: var(--tooltip-height);
                background-color: #555;
                font-size: 0.9rem;
                color: #fff;
                border-radius: .25em;
                line-height: var(--tooltip-height);
                bottom: calc(var(--height) + var(--gap-between-tooltip-to-button) + 10px);
                left: calc(50% - var(--tooltip-width) / 2);
            }

            .button::after {
                position: absolute;
                content: '';
                width: 0;
                height: 0;
                border: 10px solid transparent;
                border-top-color: #555;
                left: calc(50% - 10px);
                bottom: calc(100% + var(--gap-between-tooltip-to-button) - 10px);
            }

            .button::after,.button::before {
                opacity: 0;
                visibility: hidden;
                transition: all 0.5s;
            }

            .text {
                display: flex;
                justify-content: center;
            }

            .button-wrapper,.text,.icon {
                overflow: hidden;
                position: absolute;
                width: 100%;
                height: 100%;
                left: 0;
                color: #fff;
            }

            .text {
                top: 0
            }

            .text,.icon {
                transition: top 0.5s;
            }

            .icon {
                color: #fff;
                top: 100%;
                display: flex;
                justify-content: center;
            }


            .button:hover {
                background: #222;
            }

            .button:hover .text {
                top: -100%;
            }

            .button:hover .icon {
                top: 0;
            }

            .button:hover:before,.button:hover:after {
                opacity: 1;
                visibility: visible;
            }

            .button:hover:after {
                bottom: calc(var(--height) + var(--gap-between-tooltip-to-button) - 20px);
            }

            .button:hover:before {
                bottom: calc(var(--height) + var(--gap-between-tooltip-to-button));
            }

            .search-form {
                display: flex;
                align-items: center;
            }
            .search-input {
                flex-grow: 1;
                margin-right: 5px;
            }
            .search-button {
                background-color: #007bff;
                color: white;
                border: none;
            }
            .search-button i {
                font-size: 1.2em;
            }


        </style>
    </head>
    <body>

        <jsp:include page="../view/HomePage/header.jsp"/>
        <header class=" m-200 py-5 bg-light border-bottom mb-4">

            <div class="text-center my-3">
                <h1 class="fw-bolder">
                    <c:set var="found" value="false"/>

                    <!-- First foreach -->
                    <c:forEach items="${listsub}" var="o">
                        <c:if test="${param.Subcategory_ID == o.subcategory_ID}">
                            ${o.subcategory_Name}
                            <c:set var="found" value="true"/>
                        </c:if>
                    </c:forEach>

                    <!-- Second foreach -->
                    <c:forEach items="${listsport}" var="o">
                        <c:if test="${param.sport_Id == o.sport_Id}">
                            ${o.sport_Name}
                            <c:set var="found" value="true"/>
                        </c:if>
                    </c:forEach>

                    <!-- Third foreach -->
                    <c:forEach items="${listbrand}" var="o">
                        <c:if test="${param.id == o.id}">
                            ${o.name}/-strong/-heart:>:o:-((:-h<c:set var="found" value="true"/>
                        </c:if>
                    </c:forEach>

                    <!-- Check if nothing was found -->
                    <c:if test="${not found}">
                        Tất Cả Sản Phẩm
                    </c:if>

                </h1>
            </div>

        </header>
        <div class="row m-3 mt-3">
            <div class="breadcrumb-container">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <span><i class="bi bi-house-door mx-3"></i></span>
                            <a href="/SWP/HomePage" class="text-decoration-none text-black">Trang chủ</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            Tất Cả Sản Phẩm
                        </li>
                    </ol>
                </nav>
            </div>
        </div>

        <div id="productList" class="container-fluid">
            <div class="row">
                <div class="col-3">
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Phân Loại</div>
                        <ul class="list-group category_block">
                            <c:forEach items="${listsub}" var="o">
                                <li class="list-group-item">
                                    <a href="subcategory?Subcategory_ID=${o.subcategory_ID}" class="text-decoration-none text-dark">
                                        ${o.subcategory_Name}
                                    </a>
                                </li>

                            </c:forEach>
                        </ul>

                    </div>
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-success text-white text-uppercase">Sản Phẩm Mới</div>
                        <div class="card-body">
                            <c:forEach items="${p}" var="o">
                                <img class="img-fluid" src="img/product/${o.img}" />
                                <h5 class="card-title">
                                    <a href="Product?productId=${o.productID}" class="text-decoration-none text-dark">
                                        <span class="badge bg-primary">New</span> <!-- Ví dụ: badge để đánh dấu sản phẩm mới -->
                                        ${o.productName}
                                    </a>
                                </h5>
                                <p class="card-text">${o.description}</p>
                                <p class="bloc_left_price">${o.price} đ</p>
                            </c:forEach>
                        </div>
                    </div>
                </div>/-strong/-heart:>:o:-((:-h<div class="col-9">
                    <div class="row mb-3">
                        <div class="col-md-8">
                            <form method="GET" action="productList" class="form-inline" id="buttonForm">
                                <button type="submit" name="sort" value="popularity" class="btn btn-outline-primary">Phổ Biến</button>
                                <button type="submit" name="sort" value="newest" class="btn btn-outline-primary">Mới Nhất</button>
                                <button type="submit" name="sort" value="best_selling" class="btn btn-outline-primary">Sale</button>
                            </form>
                            <form method="POST" action="productList" class="form-inline" id="selectForm">
                                <select name="sortType" class="form-control" id="sortTypeSelect" onchange="submitForm()">
                                    <option value="price">Giá</option>
                                    <option value="price_asc">Giá: Thấp đến Cao</option>
                                    <option value="price_desc">Giá: Cao đến Thấp</option>
                                </select>
                            </form>

                            <script>
                                function submitForm() {
                                    document.getElementById('selectForm').submit();
                                }
                            </script>
                        </div>
                        <div class="col-md-4">
                            <form action="searchprd" method="GET" class="d-flex">
                                <input type="text" class="form-control me-2" placeholder="Tìm Kiếm Sản Phẩm" name="keyword">
                                <button type="submit" class="btn btn-primary"><i class="bi bi-search"></i></button>
                            </form>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach var="prd" items="${productLists}" varStatus="loop">
                            <div class="col-lg-3 col-md-6 mb-4 product-item">
                                <img src="img/product/${prd.img}" class="img-fluid" alt="${prd.productName}">
                                <h4>${prd.productName}</h4>
                                <div class="price mb-3">${prd.status}</div>
                                <p class="card-text fs-4 text-danger">${prd.price} đ</p>
                                <div data-tooltip="Giá: ${prd.price} đ" class="button btn btn-primary">
                                    <a href="Product?productId=${prd.productID}" class="text-white">
                                        <div class="button-wrapper">
                                            <div class="text">Chi Tiết!</div>
                                            <span class="icon fs-6">/-strong/-heart:>:o:-((:-h<i class="bi bi-bag-plus"></i>
                                            </span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>


                </div>

                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <c:forEach begin="1" end="${endPage}" var="i">
                            <li class="page-item"><a class="page-link" href="productall?index=${i}">${i}</a></li>
                            </c:forEach>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

</body>
</html>