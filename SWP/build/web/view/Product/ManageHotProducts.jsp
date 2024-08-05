<%-- 
    Document   : managerHotProduct
    Created on : Jun 16, 2024, 4:33:58 PM
    Author     : Hoàng Sơn
--%>

<%@page import="entity.SubCategory"%>
<%@page import="Model.Category"%>
<%@page import="data.CategoryContext"%>
<%@page import="entity.product"%>
<%@page import="data.ProductContext"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="selectedCategory" value="${param.category}" />
<c:set var="selectedValue" value="${param.select1}" />
<c:set var="Subcategory" value="${param.Subcategory}" />

<%@page import="java.util.ArrayList"%>
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
            .animated-button {
                position: relative;
                display: flex;
                align-items: center;
                gap: 4px;
                padding: 16px 36px;
                border: 4px solid;
                border-color: transparent;
                font-size: 16px;
                border-radius: 100px;
                font-weight: 600;
                color: #1f387e;
                box-shadow: 0 0 0 2px #ffffff;
                cursor: pointer;
                overflow: hidden;
                transition: all 0.6s cubic-bezier(0.23, 1, 0.32, 1);
            }

            .animated-button svg {
                position: absolute;
                width: 24px;
                fill: #1f387e;
                z-index: 9;
                transition: all 0.8s cubic-bezier(0.23, 1, 0.32, 1);
            }

            .animated-button .arr-1 {
                right: 16px;
            }

            .animated-button .arr-2 {
                left: -25%;
            }

            .animated-button .circle {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 20px;
                height: 20px;
                background-color: #c5e5e4;
                border-radius: 50%;
                opacity: 0;
                transition: all 0.8s cubic-bezier(0.23, 1, 0.32, 1);
            }

            .animated-button .text {
                position: relative;
                z-index: 1;
                transform: translateX(-12px);
                transition: all 0.8s cubic-bezier(0.23, 1, 0.32, 1);

            }

            .animated-button:hover {
                box-shadow: 0 0 0 12px transparent;
                color: #212121;
                border-radius: 12px;
            }

            .animated-button:hover .arr-1 {
                right: -25%;
            }

            .animated-button:hover .arr-2 {
                left: 16px;
            }

            .animated-button:hover .text {
                transform: translateX(12px);
            }

            .animated-button:hover svg {
                fill: #1f387e;
            }

            .animated-button:active {
                scale: 0.95;
                box-shadow: 0 0 0 4px greenyellow;
            }

            .animated-button:hover .circle {
                width: 220px;
                height: 220px;
                opacity: 1;
            }


            .fs-0 {
                font-size: 78px;
            }

            .plusButton {
                position: relative;
                display: flex;
                justify-content: center;
                align-items: center;
                border: 1px solid white;
                width: 2.5rem;
                height: 2.5rem;
                background-color: #000000;
                overflow: hidden;
            }

            .plusButton::before {
                position: absolute;
                content: "";
                top: 0;
                right: 0;
                width: 0;
                height: 0;
                border-width: 0 0.9rem 0.9rem 0;
                border-style: solid;
                border-color: transparent white transparent transparent;
                transition-timing-function: ease-in-out;
                transition-duration: 0.2s;
            }

            .plusButton:hover::before {
                border-width: calc(2.5rem * 2);
            }

            .plusButton .plusIcon {
                fill: white;
                width: 1.75rem;
                height: 1.75rem;
                z-index: 1;
                transition-timing-function: ease-in-out;
                transition-duration: 0.2s;
            }

            .plusButton:hover .plusIcon {
                fill: black;
                transform: rotate(180deg);
            }

            .button {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                background-color: rgb(20, 20, 20);
                border: none;
                font-weight: 600;
                display: flex;
                align-items: center;
                justify-content: center;
                box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.164);
                cursor: pointer;
                transition-duration: .3s;
                overflow: hidden;
                position: relative;
            }

            .svgIcon {
                width: 12px;
                transition-duration: .3s;
            }

            .svgIcon path {
                fill: white;
            }

            .button:hover {
                width: 120px;
                border-radius: 50px;
                transition-duration: .3s;
                align-items: center;
            }

            .button1:hover {
                background-color: #19355e;
            }

            .button2:hover {
                background-color: rgb(255, 69, 69);
            }

            .button:hover .svgIcon {
                width: 50px;
                transition-duration: .3s;
                transform: translateY(60%);
            }

            .button::before {
                position: absolute;
                top: -20px;
                color: white;
                transition-duration: .3s;
                font-size: 2px;
            }

            .button1::before {
                content: "Chi Tiết";
            }

            .button2::before {
                content: "Thêm";
            }

            .button:hover::before {
                font-size: 13px;
                opacity: 1;
                transform: translateY(30px);
                transition-duration: .3s;
            }

            .btnDE {
                display: inline-block;
                width: 110px;
                height: 50px;
                border-radius: 10px;
                border: 1px solid #03045e;
                position: relative;
                overflow: hidden;
                transition: all 0.5s ease-in;
                z-index: 1;
            }

            .btnDE::before,
            .btnDE::after {
                content: '';
                position: absolute;
                top: 0;
                width: 0;
                height: 100%;
                transform: skew(15deg);
                transition: all 0.5s;
                overflow: hidden;
                z-index: -1;
            }

            .btnDE::before {
                left: -10px;
                background: #240046;
            }

            .btnDE::after {
                right: -10px;
                background: #5a189a;
            }

            .btnDE:hover::before,
            .btnDE:hover::after {
                width: 58%;
            }

            .btnDE:hover span {
                color: #e0aaff;
                transition: 0.3s;
            }

            .btnDE span {
                color: #03045e;
                font-size: 18px;
                transition: all 0.3s ease-in;
            }

            .transition-table {
                transform: translate(0, 55px);
            }
            .rounded-table {
                border-radius: 15px;
                overflow: hidden;
            }
            .Btn {
                display: flex;
                align-items: center;
                justify-content: flex-start;
                width: 45px;
                height: 45px;
                border: none;
                border-radius: 50%;
                cursor: pointer;
                position: relative;
                overflow: hidden;
                transition-duration: .3s;
                box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.199);
                background-color: rgb(255, 65, 65);
            }

            /* plus sign */
            .sign {
                width: 100%;
                transition-duration: .3s;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .sign svg {
                width: 17px;
            }

            .sign svg path {
                fill: white;
            }
            /* text */
            .text {
                position: absolute;
                right: 0%;
                width: 0%;

                font-size: 1.2em;
                font-weight: 600;
                transition-duration: .3s;
            }
            /* hover effect on button width */

        </style>

        <script>
            function submit() {
                document.getElementsByClassName("form").submit();
            }
        </script>
    </head>
    <body>
        <div class="row">
            <div class="col-1">
                <jsp:include page="../Homestaff/SideBar.jsp"/>
            </div>
            <div class="col-11">
                <div class="mt-5 w-75 container">
                    <h1 class="my-4">Tất Cả Sản Phẩm Hot</h1>
                    <table class="table  table-hover table-dark  rounded-table  mt-5">
                        <thead class="table-dark align-middle">
                            <tr>
                                <th class="p-4 text-center">#</th>
                                <th class="p-4 text-center">Tên Sản Phẩm</th>
                                <th class="p-4 text-center">Giá </th>
                                <th class="p-4 text-center">Số lượng đã bán</th>
                                <th class="p-4 text-center">Doanh mục</th>
                                <th class="p-4 text-center"></th>

                            </tr>
                        </thead>
                        <tbody class="table-group-divider table-divider-color">
                            <c:forEach items="${requestScope.HotProducts}" var="p" varStatus="status">
                                <tr class="p-3 text-center">
                                    <th class="p-2">${status.index +1}</th>
                                    <td class="text-start">${p.productName}</td>
                                    <td class="text-center text-danger">${p.price}</td>
                                    <td class="text-center text-warning">${p.quantity_sold}  sản phẩm</td>

                                    <td class="text-center">
                                        <c:if test="${p != null and p.cate != null and p.cate.type != null}">
                                            <c:if test="${'nam'.equals(p.cate.type)}">
                                                Nam
                                            </c:if>
                                            <c:if test="${'nu'.equals(p.cate.type)}">
                                                Nữ
                                            </c:if>
                                            <c:if test="${'phu_kien'.equals(p.cate.type)}">
                                                Phụ Kiện
                                            </c:if>
                                        </c:if>
                                        /   <span>${p.cate.category_Name}</span>  
                                        /   <span>${p.getSubCate().getSubcategory_Name()}</span>  
                                    </td>

                                    <td> <a href="ManageHotProducts?type=2&productID=${p.productID}"> <button class="Btn">
                                                <div class="sign text-light">
                                                    <i class="bi bi-trash3"></i>
                                                </div>
                                            </button>  </a> 


                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <h3>Thêm Sản Phẩm Hot</h3>
                    <div id="menu" >
                        <form class="form" action="ManageHotProducts" method="post">
                            <div class="d-flex">
                                <select    id="select1" name="select1" class="form-select mx-3 w-25 " aria-label="Thể Loại 1" onchange="submit()" required>
                                    <option value="" <c:if test="${empty selectedValue}">selected</c:if>>Chọn</option>
                                    <option value="nam" <c:if test="${selectedValue == 'nam'}">selected</c:if>>Nam</option>
                                    <option value="nu" <c:if test="${selectedValue == 'nu'}">selected</c:if>>Nữ</option>
                                    <option value="phukien" <c:if test="${selectedValue == 'phukien'}">selected</c:if>>Phụ Kiện</option>
                                    <option value="thethao" <c:if test="${selectedValue == 'thethao'}">selected</c:if>>Môn Thể Thao</option>
                                    <option value="thuonghieu" <c:if test="${selectedValue == 'thuonghieu'}">selected</c:if>>Thương Hiệu</option>
                                    </select>
                                <c:if test="${ not empty requestScope.listCA}" >

                                    <select  name="category" class="form-select mx-3 w-25" aria-label="Thể Loại 2" onchange="submit()" required >
                                        <option value="0" <c:if test="${empty selectedCategory}">selected</c:if>>Chọn</option>
                                        <c:forEach items="${requestScope.listCA}" var="cate">
                                            <option value="${cate.category_ID}"
                                                    <c:if test="${selectedCategory==cate.category_ID}">selected</c:if>
                                                    >${cate.category_Name}</option>
                                        </c:forEach>
                                        <c:if test="${empty requestScope.listCA}">
                                            <option >No categories available</option>
                                        </c:if>
                                    </select>

                                    <c:if test="${ not empty requestScope.listSub}" >

                                        <select  name="Subcategory" class="form-select mx-3 w-25" aria-label="Thể Loại 3" required >
                                            <option value="0" <c:if test="${empty selectedCategory}">selected</c:if>>Chọn</option>
                                            <c:forEach items="${requestScope.listSub}" var="Subcate">
                                                <option value="${Subcate.getSubcategory_ID()}" 
                                                        <c:if test="${Subcategory==Subcate.getSubcategory_ID()}">selected</c:if>
                                                        >${Subcate.getSubcategory_Name()}</option>
                                            </c:forEach>
                                            <c:if test="${empty requestScope.listSub}">
                                                <option >No SubCategory available</option>
                                            </c:if>
                                        </select>
                                    </div>  
                                    <div class="d-flex justify-content-end my-4">
                                        <button class=" animated-button" name="checkProducts"  type="submit"  value="true">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="arr-2" viewBox="0 0 24 24">
                                            <path
                                                d="M16.1716 10.9999L10.8076 5.63589L12.2218 4.22168L20 11.9999L12.2218 19.778L10.8076 18.3638L16.1716 12.9999H4V10.9999H16.1716Z"
                                                ></path>
                                            </svg>
                                            <span class="text">Lọc</span>
                                            <span class="circle"></span>
                                            <svg xmlns="http://www.w3.org/2000/svg" class="arr-1" viewBox="0 0 24 24">
                                            <path
                                                d="M16.1716 10.9999L10.8076 5.63589L12.2218 4.22168L20 11.9999L12.2218 19.778L10.8076 18.3638L16.1716 12.9999H4V10.9999H16.1716Z"
                                                ></path>
                                            </svg>
                                        </button>
                                    </div>

                                </c:if>
                            </c:if>
                        </form>
                        <c:if test="${param.checkProducts == 'true' && empty requestScope.products}">
                            <p class="fst-italic text-danger">Không có sản phẩm nào!</p>
                        </c:if>
                    </div>    

                    <c:if test="${not empty requestScope.products}">
                        <div  class="row alert alert-secondary flex-wrap py-5 justify-content-center">
                            <c:forEach items="${requestScope.products}" var="pro">
                                <div class="card text-center bg-white shadow m-2" style="width: 18rem">

                                    <img
                                        src="img/product/${pro.image.get(0).getUrl()}"
                                        class="card-img-top"
                                        alt="..."
                                        />
                                    <div class="card-body">
                                        <a href="" class="text-decoration-none">
                                            <h5 class="card-title text-black" style="height: 3.5rem">
                                                ${ pro.getProductName()}
                                            </h5></a
                                        >
                                        <p class="card-text fs-4 text-danger  mt-4">${pro.getPrice()}đ</p>

                                        <a  href="Product?productId=${pro.getProductID()}">
                                            <button class="button1 button float-start">
                                                <i class="bi bi-amd text-light svgIcon"></i> 
                                            </button>  
                                        </a>
                                        <a href="ManageHotProducts?type=1&productID=${pro.productID}&select1=${selectedValue}&category=${selectedCategory}&Subcategory=${Subcategory}" >
                                            <button class=" button2 button   float-end ">
                                                <i class="bi bi-plus-circle-dotted svgIcon text-light text-center"></i>
                                            </button>
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                    </c:if>
                </div>
            </div>

        </div>
    </body>
</html>
