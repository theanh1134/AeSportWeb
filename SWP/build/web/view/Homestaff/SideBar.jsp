<%-- 
    Document   : HomeStaff
    Created on : Jun 10, 2024, 2:16:59 PM
    Author     : Hoàng Sơn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="data.BlogContext"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="author" content="CodeHim">


        <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css'>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css'>
        <style>
            .fs-7{
                font-size: 14px;
            }
            .sidebar-wrap {
                width: 330px;
                height: 100vh;
                background-color: #000;
                color: #fff;
                padding: 10px;
                transition: 1s;
            }
            .sidebar-wrap .logo-wrap {
                color: #fff;
                font-size: 35px;
                display: flex;
                align-items: center;
                gap: 10px;
                min-width: 80px;
            }
            .sidebar-wrap .logo-wrap span {
                font-size: 18px;
            }
            .sidebar-wrap .logo-wrap .icon-wrap {
                display: flex;
                align-items: center;
                justify-content: center;
                min-width: 80px;
            }
            .sidebar-wrap .nav {
                height: 100%;
                overflow-x: hidden;
                overflow-y: auto;
                flex-wrap: nowrap;
            }
            .sidebar-wrap .nav::-webkit-scrollbar-track {
                -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
                border-radius: 5px;
                background-color: #f5f5f5;
            }
            .sidebar-wrap .nav::-webkit-scrollbar {
                width: 5px;
                background-color: #f5f5f5;
                border-radius: 5px;
            }
            .sidebar-wrap .nav::-webkit-scrollbar-thumb {
                border-radius: 5px;
                -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
                background-color: #9b9b9b;
            }
            .sidebar-wrap .nav li {
                margin-top: 5px;
            }
            .sidebar-wrap .nav li .nav-link {
                color: #fff;
                padding: 0;
                font-size: 20px;
                display: flex;
                align-items: center;
                gap: 5px;
                height: 50px;
            }
            .sidebar-wrap .nav li .nav-link .icon-wrap {
                display: flex;
                align-items: center;
                justify-content: center;
                height: 40px;
                min-width: 80px;
            }
            .sidebar-wrap .nav li .nav-link span {
                font-size: 16px;
            }
            .sidebar-wrap .nav li .nav-link.active {
                background-color: #ffa200;
            }
            .sidebar-wrap .nav li .nav-link:hover {
                background-color: #ffa200;
            }
            .sidebar-wrap .dropdown-wrap {
                display: flex;
                align-items: center;
                color: #fff;
                gap: 15px;
                font-size: 16px;
            }
            .sidebar-wrap .dropdown-wrap .icon-wrap {
                min-width: 80px;
                height: 40px;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .offcanvas{
                --bs-offcanvas-width: 200x;
            }


            .btna {
                width: 150px;
                height: 50px;
                border-radius: 5px;
                border: none;
                transition: all 0.5s ease-in-out;
                font-size: 20px;
                font-family: Verdana, Geneva, Tahoma, sans-serif;
                font-weight: 600;
                display: flex;
                align-items: center;
                background: #040f16;
                color: #f5f5f5;
            }

            .btna:hover {
                box-shadow: 0 0 20px 0px #2e2e2e3a;
            }

            .btna .icon {
                position: absolute;
                height: 40px;
                width: 70px;
                display: flex;
                justify-content: center;
                align-items: center;
                transition: all 0.5s;
            }

            .btna .text {
                transform: translateX(55px);
            }

            .btna:hover .icon {
                width: 175px;
            }

            .btna:hover .text {
                transition: all 0.5s;
                opacity: 0;
            }

            .btna:focus {
                outline: none;
            }

            .btna:active .icon {
                transform: scale(0.85);
            }
            .dropdown-item:hover{
                background-color: #ffa200;
            }
            .activee{
                background-color: #ffa200;
            }
        </style>


        <%
            BlogContext blogDB = new BlogContext();
            int numberRequestAdd = blogDB.getNumberRequest("add");
            int numberRequestDelete = blogDB.getNumberRequest("delete");
        %>
    </head>
    <body>

        <div class="m-4 text-light" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling" >
            <button class="btna">
                <span class="icon ">
                    <svg viewBox="0 0 175 80" width="40" height="40" >
                    <rect width="80" height="15" fill="#f0f0f0" rx="10"></rect>
                    <rect y="30" width="80" height="15" fill="#f0f0f0" rx="10"></rect>
                    <rect y="60" width="80" height="15" fill="#f0f0f0" rx="10"></rect>
                    </svg>
                </span>
                <span class="text">MENU</span>
            </button>
        </div> 

        <div class="offcanvas offcanvas-start border-end  border-light " data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
            <div class="">
                <div class="d-flex flex-column flex-shrink-0 sidebar-wrap">
                    <div class="d-flex justify-content-between" >
                        <a href="#" class=" logo-wrap">
                            <div class="icon-wrap "> 
                                <img
                                    src="img/logo/2.png"
                                    alt="Home"
                                    width="180"
                                    height="150" 
                                    class=" ms-5"
                                    /></div>
                        </a>
                        <div data-bs-theme="dark" >
                            <button type="button" data-bs-dismiss="offcanvas" class="btn-close m-2 fs-5 btn-close-white" aria-label="Close"></button>
                        </div>

                    </div>

                    <hr >
                    <ul class="nav nav-pills flex-column mb-auto">
                        <li class="nav-item " >
                            <a id="home" href="HomePage" class="nav-link" aria-current="page">
                                <div class="icon-wrap">
                                    <i class="fas fa-home"></i>
                                </div>
                                <span> Trang Chủ</span>
                            </a>
                        </li>
                        <li  class="nav-item dropdown">
                            <a id="productonHome" class="nav-link dropdown-toggle"  role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <div class="icon-wrap">
                                    <i class="fab fa-first-order"></i>
                                </div>
                                <span>Sản Phẩm Trang Chủ</span>
                            </a>

                        </li>

                        <ul id="drop-down1" class="bg-black d-none  list-unstyled w-100 text-center ">
                            <li><a id="hotProductonHome" class="dropdown-item py-2" href="ManageHotProductHomePage">Sản Phẩm Hot</a></li>
                            <li><a id="saleProductonHome" class="dropdown-item py-2" href="ManageSaleProductHomePage">Sản Phẩm Sale</a></li>
                        </ul>
                        <li class="nav-item">
                            <a  id="managerProduct" class="nav-link dropdown-toggle" role="button">
                                <div class="icon-wrap">
                                    <i class="fas fa-tachometer-alt"></i>
                                </div>
                                <span>Quản Lí Sản Phẩm</span>
                            </a>

                        </li>
                        <ul id="drop-down2" class="bg-black list-unstyled d-none w-100 text-center">
                            <li><a id="hotProductManage" class="dropdown-item py-2" href="ManageHotProducts">Sản Phẩm Hot</a></li>
                            <li><a id="saleProductManage" class="dropdown-item py-2" href="ManageSaleProducts">Sản Phẩm Sale</a></li>
                        </ul>

                        <li class="nav-item">
                            <a href="managerBlog" class="nav-link" id="blog">
                                <div class="icon-wrap">
                                    <i class="fas fa-tachometer-alt"></i>
                                </div>
                                <span> Tin Tức</span>
                            </a>
                        </li>
                    </ul>
                    <hr>
                    <div class="dropdown mb-5 text-center">
                        <a href="view/ViewProfile.jsp" class="text-decoration-none  dropdown-wrap"  >
                            <strong>Nhân Viên </strong>
                            <c:if test="${sessionScope.CRRAccount != null}">
                                <span  class="font-monospace text-decoration-none text-white">${sessionScope.CRRAccount.getFull_Name()}</span>
                            </c:if>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var myOffcanvas = new bootstrap.Offcanvas(document.getElementById('offcanvasScrolling'));
                myOffcanvas.show();
            });
            var currentUrl = window.location.pathname;
            if (currentUrl.includes("managerBlog")) {
                document.querySelector("#blog").classList.add("active")
            }


            if (currentUrl.includes("ManageHotProductHomePage")) {
                document.getElementById('drop-down1').classList.remove('d-none');
                document.querySelector("#hotProductonHome").classList.add("activee")
            }
            if (currentUrl.includes("ManageSaleProductHomePage")) {
                document.getElementById('drop-down1').classList.remove('d-none');
                document.querySelector("#saleProductonHome").classList.add("activee")
            }

            if (currentUrl.includes("ManageHotProducts")) {
                document.getElementById('drop-down2').classList.remove('d-none');
                document.querySelector("#hotProductManage").classList.add("activee")
            }
            if (currentUrl.includes("ManageSaleProducts")) {
                document.getElementById('drop-down2').classList.remove('d-none');
                document.querySelector("#saleProductManage").classList.add("activee")
            }

            document.getElementById('productonHome').addEventListener('click', function () {
                if (document.getElementById('drop-down1').classList.contains('d-none')) {
                    document.getElementById('drop-down1').classList.remove('d-none');
                } else {
                    document.getElementById('drop-down1').classList.add('d-none');
                }
            })

            document.getElementById('managerProduct').addEventListener('click', function () {
                var dropdown = document.getElementById('drop-down2');
                if (dropdown.classList.contains("d-none")) {
                    dropdown.classList.remove("d-none")
                } else {
                    dropdown.classList.add("d-none")
                }
            });




        </script>
        <script src='https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/js/bootstrap.min.js'></script>

    </body>
</html>