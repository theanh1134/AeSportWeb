<%-- 
    Document   : header
    Created on : May 30, 2024, 12:07:15 AM
    Author     : Hoàng Sơn
--%>
<%@page import="data.SettingContext"%>
<%@page import="entity.SubCategory"%>
<%@page import="Model.Category"%>
<%@page import="data.CategoryContext"%>
<%@page import="entity.sport"%>
<%@page import="data.SportContext"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entity.Brand"%>
<%@page import="data.CartContext"%>
<%@page import="data.BrandContext"%>
<%@page import="data.BlogContext"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Header</title>
        <style>
            .fs-7 {
                font-size: 14px;
            }
            .transition-1 {
                transform: translate(-55px, 5px);
            }
            .transition-2 {
                transform: translate(-60px, 5px);
            }
            .transition-3 {
                transform: translate(-5px, 5px);
            }
            .transition-4 {
                transform: translate(-15px, 5px);
            }
            .transition-5 {
                transform: translate(-35px, 5px);
            }
            @media (min-width: 990px) and (max-width: 1363px) {
                .hide-on-small {
                    display: none;
                }
            }
            body {
                overflow-x: hidden;
            }
            @media (max-width: 990px) {
                .form-control {
                    width: 3rem;
                }
            }
            .form-control:focus {
                outline: none;
                box-shadow: none;
                border-color: #ced4da;
            }
            .input-group:focus-within {
                box-shadow: 0 0 0 0.25rem rgba(0, 123, 255, 0.25);
                border-color: #80bdff;
            }
            .input-group {
                width: 25%;
            }
            .m-223 {
                margin-top: 223px;
            }
            .fs-10 {
                font-size: 10px;
            }
            .icon-link {
                align-items: normal;
            }
            .dropdown-submenu .dropdown-submenu-menu {
                top: 0;
                left: 100%;
                margin-left: 0.1rem;
                margin-top: -0.5rem;
            }
            .dropdown-menu {
                display: none;
            }
            .dropdown:hover > .dropdown-menu {
                display: block;
            }
            .dropdown-submenu:hover > .dropdown-submenu-menu {
                display: block;
            }
            .m-200 {
                margin-top: 200px;
            }
        </style>
        <%
            CartContext cart = new CartContext();
            int count = cart.countProductInCart();
BrandContext brandb = new BrandContext();
            ArrayList<Brand> brands = brandb.getBrands();
            SportContext sportdb = new SportContext();
            ArrayList<sport> sports = sportdb.getSports();
            CategoryContext cateDB = new CategoryContext();
            ArrayList<Category> listCateMale = cateDB.getCategorys("nam");
            ArrayList<Category> listCateFemale = cateDB.getCategorys("nu");
            ArrayList<Category> listCateAccessory = cateDB.getCategorys("phu_kien");
            SettingContext settingDB = new SettingContext();
            String logo = settingDB.getLogo("logoh");
        %>
    </head>
    <body>
        <header class="fixed-top">
            <div class="row bg-black p-4">
                <div class="col">
                    <ul class="d-flex justify-content-end text-light list-unstyled mb-0">
                        <li class="mx-4">
                            <a href="introBrand" class="font-monospace text-decoration-none text-white">Giới Thiệu</a>
                        </li>
                        <span>&#124;</span>
                        <li class="mx-4">
                            <a href="productall" class="font-monospace text-decoration-none text-white">Tất Cả Sản Phẩm</a>
                        </li>
                        <span>&#124;</span>
                        <li class="mx-4">
                            <a href="choosesize" class="font-monospace text-decoration-none text-white">Cách Chọn Size</a>
                        </li>
                        <span>&#124;</span>
                        <li class="mx-4">
                            <a href="BlogList?page=1" class="font-monospace text-decoration-none text-white">Tin Tức</a>
                        </li>
                        <span>&#124;</span>
                        <li class="mx-4">
                            <a href="help/support.jsp" class="font-monospace text-decoration-none text-white">Hỗ trợ</a>
                        </li>
                        <span>&#124;</span>
                        <li class="mx-4">
                            <c:if test="${sessionScope.CRRAccount == null}">
                                <a class="font-monospace text-decoration-none text-white" href="Login">Đăng Nhập</a>
                            </c:if>
                            <c:if test="${sessionScope.CRRAccount != null}">
                                <a href="view/ViewProfile.jsp" class="font-monospace text-decoration-none text-white">${sessionScope.CRRAccount.getFull_Name()}</a>
                            </c:if>
                        </li>
                    </ul>
                </div>
            </div>

            <nav class="navbar navbar-expand-lg bg-body-tertiary text-center p-0 border-bottom border-black">
                <div class="container-fluid row">
                    <div class="col-2 d-flex justify-content-end">
                        <a href="HomePage">
                            <img src="img/logo/<%=logo%>" alt="Home" width="180" height="150" />
                        </a>
                    </div>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse col-10 align-items-center row" id="navbarNav">
                        <ul class="col-9 navbar-nav nav fs-5 align-items-center d-flex justify-content-center">

                            <li class="nav-item mx-5 dropdown py-3">
                                <a class="text-decoration-none text-black" role="button" id="navbarDropdownMale" data-bs-popper="static" aria-expanded="false" href="/SWP/productall">NAM</a>
                                <ul class="dropdown-menu transition-2 dropdown-sub dropdown-menu-end" aria-labelledby="navbarDropdownMale"> 
                                    <% for (Category cate : listCateMale) {%>
                                    <li class="dropdown-submenu dropend">
                                        <a href="#"class="dropdown-item dropdown-toggle" id="subnavbarDropdown<%=cate.getCategory_ID()%>" role="button" aria-expanded="false"><%=cate.getCategory_Name()%></a>
                                        <% ArrayList<SubCategory> listSubcate = cateDB.getSubCategorys(cate.getCategory_ID());
                                            if (!listSubcate.isEmpty()) {%>
                                        <ul class="dropdown-menu dropdown-submenu-menu" aria-labelledby="subnavbarDropdown<%=cate.getCategory_ID()%>">
                                            <%for (SubCategory subCate : listSubcate) {%>
                                            <li><a class="dropdown-item" href="/SWP/subcategory?Subcategory_ID=<%=subCate.getSubcategory_ID()%>"><%=subCate.getSubcategory_Name()%></a></li>
                                                <%}%>
                                        </ul>
                                        <%  } %>
                                    </li>
                                    <% } %>
                                </ul>
                            </li>

                            <li class="nav-item mx-5 dropdown py-3">
                                <a class="text-decoration-none text-black" role="button" id="navbarDropdownFemale" data-bs-popper="static" aria-expanded="false" href="/SWP/productall">NỮ</a>
                                <ul class="dropdown-menu transition-2 dropdown-sub dropdown-menu-end" aria-labelledby="navbarDropdownFemale">
                                    <% for (Category cate : listCateFemale) {%>
                                    <li class="dropdown-submenu dropend">
                                        <a class="dropdown-item dropdown-toggle" id="subnavbarDropdown<%=cate.getCategory_ID()%>" role="button" aria-expanded="false"><%=cate.getCategory_Name()%></a>
                                        <% ArrayList<SubCategory> listSubcate = cateDB.getSubCategorys(cate.getCategory_ID());
                                            if (!listSubcate.isEmpty()) {%>
                                        <ul class="dropdown-menu dropdown-submenu-menu" aria-labelledby="subnavbarDropdown<%=cate.getCategory_ID()%>">
                                            <%for (SubCategory subCate : listSubcate) {%>
                                            <li><a class="dropdown-item" href="/SWP/subcategory?Subcategory_ID=<%=subCate.getSubcategory_ID()%>"><%=subCate.getSubcategory_Name()%></a></li>
                                                <% } %>
                                        </ul>
                                        <%   } %>
                                    </li>
                                    <%   } %>
                                </ul>
                            </li>

                            <li class="nav-item mx-5 dropdown py-3">
                                <a class="text-decoration-none text-black" role="button" data-bs-popper="static" aria-expanded="false" href="#">MÔN THỂ THAO</a>
                                <ul class="dropdown-menu transition-3 fs-5" aria-labelledby="navbarDropdown">
                                    <% for (sport sport : sports) {%>
                                    <li><a class="dropdown-item" href="/SWP/sport?sport_Id=<%= sport.getSport_Id()%>"><%= sport.getSport_Name()%></a></li>
                                        <% } %>
                                </ul>
                            </li>
                            <li class="nav-item mx-5 dropdown py-3">
                                <a class="text-decoration-none text-black" role="button" data-bs-toggle="static" aria-expanded="false">THƯƠNG HIỆU</a>
                                <ul class="dropdown-menu transition-4 fs-5">
                                    <% for (Brand b : brands) {%>
                                    <li><a class="dropdown-item" href="/SWP/brand?id=<%=b.getId()%>"><%=b.getName()%></a></li>
                                        <% }%>
                                </ul>
                            </li>
                            <li class="nav-item mx-5 dropdown py-3">
                                <a class="text-decoration-none text-black" role="button" aria-expanded="false" data-bs-popper="static">PHỤ KIỆN</a>
                                <ul class="dropdown-menu transition-5 fs-5">
                                    <%
                                        for (Category cate : listCateAccessory) {%>
                                    <li><a class="dropdown-item" href="#"><%=cate.getCategory_Name()%></a></li>


                                    <%  }%>
                                </ul>
                            </li>
                        </ul>
                        <div class="col-2 input-group-text bg-white transition-search border border-black">
                            <span class="bg-white border-end-0 pe-0" id="search-icon"><i class="bi bi-search"></i></span>
                            <input type="text" class="form-control border-0 form-control" placeholder="Tìm Kiếm Sản Phẩm" aria-label="Search" aria-describedby="search-icon" />
                        </div>
                        <a href="<%=request.getContextPath()%>/CartPage" class="col-1 fs-2 text-danger">
                            <i class="bi bi-cart">
                                 <!--<span class="position-absolute mt-3 translate-middle badge rounded-pill bg-danger fs-10"><%=count%></span>-->
                                <span id="cart-size" class="position-absolute mt-3 translate-middle badge rounded-pill bg-danger fs-10">${sessionScope.cart.size()}</span>
                            </i>
                        </a>
                    </div>
                </div>
            </nav>
        </header>
    </body>
</html>