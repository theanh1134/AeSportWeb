<%-- 
    Document   : productDetail
    Created on : Jun 6, 2024, 11:12:04 PM
    Author     : Hoàng Sơn
--%>

<%@page import="entity.product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
            .cart{
                background-color: #fff;
                padding: 4vh 5vh;
                border-bottom-left-radius: 1rem;
                border-top-left-radius: 1rem;
            }
            @media(max-width:767px){
                .cart{
                    padding: 4vh;
                    border-bottom-left-radius: unset;
                    border-top-right-radius: 1rem;
                }
            }
            .summary{
                background-color: #ddd;
                border-top-right-radius: 1rem;
                border-bottom-right-radius: 1rem;
                padding: 4vh;
                color: rgb(65, 65, 65);
            }
            @media(max-width:767px){
                .summary{
                    border-top-right-radius: unset;
                    border-bottom-left-radius: 1rem;
                }
            }
            .summary .col-2{
                padding: 0;
            }
            .summary .col-10
            {
                padding: 0;
            }
            .row{
                margin: 0;
            }
            .title b{
                font-size: 1.5rem;
            }
            .main{
                margin: 0;
                padding: 2vh 0;
                width: 100%;
            }
            .col-2, .col{
                padding: 0 1vh;
            }
            a{
                padding: 0 1vh;
            }
            .close{
                margin-left: auto;
                font-size: 0.7rem;
            }
            .back-to-shop{
                margin-top: 4.5rem;
            }
            h5{
                margin-top: 4vh;
            }
            hr{
                margin-top: 1.25rem;
            }
            form{
                padding: 2vh 0;
            }
            select{
                border: 1px solid rgba(0, 0, 0, 0.137);
                padding: 1.5vh 1vh;
                margin-bottom: 4vh;
                outline: none;
                width: 100%;
                background-color: rgb(247, 247, 247);
            }
            input{
                border: 1px solid rgba(0, 0, 0, 0.137);
                padding: 1vh;
                margin-bottom: 4vh;
                outline: none;
                width: 100%;
                background-color: rgb(247, 247, 247);
            }
            input:focus::-webkit-input-placeholder
            {
                color:transparent;
            }
            .btn{
                background-color: #000;
                border-color: #000;
                color: white;
                width: 100%;
                font-size: 0.7rem;
                margin-top: 4vh;
                padding: 1vh;
                border-radius: 0;
            }
            .btn:focus{
                box-shadow: none;
                outline: none;
                box-shadow: none;
                color: white;
                -webkit-box-shadow: none;
                -webkit-user-select: none;
                transition: none;
            }
            .btn:hover{
                color: white;
            }
            a{
                color: black;
                text-decoration: none;
            }
            a:hover{
                color: black;
                text-decoration: none;
            }
            #code{
                background-image: linear-gradient(to left, rgba(255, 255, 255, 0.253) , rgba(255, 255, 255, 0.185)), url("https://img.icons8.com/small/16/000000/long-arrow-right.png");
                background-repeat: no-repeat;
                background-position-x: 95%;
                background-position-y: center;
            }
            .m-250{
                margin-top: 250px;
            }
        </style>
    </head>
    <body >
        <jsp:include page="HomePage/header.jsp"/>
        <div class="container m-250">
            <nav aria-label="breadcrumb " >
                <ol class="breadcrumb m-5 ms-0 transition-1">
                    <li class="breadcrumb-item"><span><i class="bi bi-house-door mx-3"></i></span><a href="HomePage" class="text-decoration-none text-black">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Giỏ Hàng</li>

                </ol>
            </nav>            
        </div>
        <div class="row">
            <div class="col-md-8 cart">
                <div class="title">
                    <div class="row">
                        <div class="col"><h4><b>Giỏ Hàng</b></h4></div>
                        <div class="col align-self-center text-right text-muted">${sessionScope.cart.size()} Sản Phẩm</div>
                    </div>
                </div>    
                <c:forEach items="${sessionScope.cart}" var="item">
                    <div class="row border-top border-bottom">
                        <div class="row main align-items-center">
                            <div class="col-2"><img class="img-fluid" src="img/product/${item.key.image.get(0).url}"></div>
                            <div class="col">
                                <div class="row text-muted">${item.key.brand.name}</div>
                                <div class="row">${item.key.productName}</div>
                                <input type="hidden" value="${item.key.price}" id="item-price-${item.key.productID}" />
                                <input type="hidden" value="${item.key.discount.discount_Amount}" id="item-discount-${item.key.productID}" />
                            </div>
                            <div class="col">
                                <a onclick="decreaseItem(${item.key.productID})" href="#">-</a>
                                <a href="#" id="number-item-${item.key.productID}" class="border">${item.value}</a>
                                <a onclick="increaseItem(${item.key.productID})" href="#">+</a>
                            </div>
                            <div class="col price-product" id="price-${item.key.productID}">${item.key.price * item.value * (100 - item.key.discount.discount_Amount) / 100}đ</div>
                            <div class="col">
                                <a href="deleteItem?id=${item.key.productID}"><span class="close">&#10005;</span></a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="back-to-shop"><a href="#" onclick="history.back()">&leftarrow;</a><span class="text-muted">Trở Lại Sản Phẩm</span></div>
            </div>
            <div class="col-md-4 summary">
                <div><h5><b>Tóm Tắt</b></h5></div>
                <hr>
                <div class="row">
                    <div class="col" style="padding-left:0;">Sản Phẩm ${sessionScope.cart.size()}</div>
                    <div class="col text-right" id="total-price">${String.format("%.2f", requestScope.total)} đ</div>
                </div>
                <form>
                    <p>Phí Giao Hàng</p>
                    <select><option class="text-muted">5đ</option></select>
                    <p>Nhập Mã </p>
                    <input id="code" placeholder="Nhập Mã Giảm Giá">
                </form>
                <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                    <div class="col">Tổng Giá</div>
                    <div class="col text-right" id="price-shipping">${String.format("%.2f", requestScope.total + 5)}đ</div>
                </div>
                <c:if test="${requestScope.total != 0}">
                    <button class="btn" onclick="window.location.href = '${pageContext.request.contextPath}/checkout'">Thanh Toán</button>
                </c:if>
            </div>
        </div>
    </div>
</div>
<jsp:include page="HomePage/footer.jsp"/>
<script>
    const convertPrice = (ele, price) => {
        if (price.toString().includes('.')) {
            ele.text(price.toFixed(2) + "$");
        } else {
            ele.text(price + ".0$");
        }
    };

    const sumPrice = () => {
        const prices = $(".price-product");
        var totalPrice = 0;
        prices.each(function (index, element) {
            const priceText = $(element).text();
            let price = Number(priceText.replaceAll('$', ''));
            totalPrice += price;
        });
        convertPrice($("#total-price"), totalPrice);
        convertPrice($("#price-shipping"), totalPrice + 5);
    };

    const decreaseItem = (productId) => {
        const number = $("#number-item-" + productId);
        const itemPrice = $("#item-price-" + productId);
        const discount = $("#item-discount-" + productId);
        let numberDiscount = Number(discount.val());
        let quantity = Number(number.text());
        if (quantity === 1)
            return;
        let price = Number(itemPrice.val()) * (quantity - 1) * (100 - numberDiscount) / 100;
        const url = "<%=request.getContextPath()%>" + "/cart-change";
        $.ajax({
            type: 'POST',
            url: url,
            data: {
                productId: productId,
                number: quantity - 1
            },
            success: function (response) {
                convertPrice($("#price-" + productId), price);
                number.text(quantity - 1);
                sumPrice();
            }
        });

    };

    const increaseItem = (productId) => {
        const number = $("#number-item-" + productId);
        const itemPrice = $("#item-price-" + productId);
        const discount = $("#item-discount-" + productId);
        let numberDiscount = Number(discount.val());
        let quantity = Number(number.text()) + 1;
        let price = Number(itemPrice.val()) * quantity * (100 - numberDiscount) / 100;
        const url = "<%=request.getContextPath()%>" + "/cart-change";
        $.ajax({
            type: 'POST',
            url: url,
            data: {
                productId: productId,
                number: quantity
            },
            success: function (response) {
                number.text(quantity);
                convertPrice($("#price-" + productId), price);
                sumPrice();
            }
        });

    };

</script>
</body>
</html>
