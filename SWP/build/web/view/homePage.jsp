<%-- 
    Document   : homePage
    Created on : May 18, 2024, 3:44:25 PM
    Author     : Hoàng Sơn
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<%@page import="entity.product"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Home</title>

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
            .fs-7 {
                font-size: 14px;
            }
            .transition {
                transform: translate(-40px, 10px);
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
        </style>
        <% 
            
           ArrayList<product> p= (ArrayList<product>)request.getAttribute("listProductHot");
        
        %>
    </head>
    <body>
        <header class="text-center fixed-top">
            <div class="row bg-black p-4">
                <div class="col px-0">
                    <ul class="d-flex justify-content-end text-light list-unstyled mb-0">
                        <li class="mx-4">
                            <a href="introBrand" class="font-monospace text-decoration-none text-white"
                               >Giới Thiệu</a
                            >
                        </li>
                        <span>&#124;</span>
                        <li class="mx-4">
                            <a href="choosesize" class="font-monospace text-decoration-none text-white"
                               >Cách Chọn Size</a
                            >
                        </li>
                        <span>&#124;</span>
                        <c:if test="${sessionScope.CRRAccount == null}">
                            <li class="mx-4">
                                <a href="./view/Login.jsp" class="font-monospace text-decoration-none text-white"
                                   >Đăng Nhập</a
                                >
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.CRRAccount != null}">
                            <li class="mx-4">
                                ${sessionScope.CRRAccount.full_Name}
                                <a href="view/ViewProfile.jsp"><img src="https://files.oaiusercontent.com/file-7L0r0fWlU3yq0YtWSjaOWio9?se=2024-05-28T02%3A03%3A44Z&sp=r&sv=2023-11-03&sr=b&rscc=max-age%3D31536000%2C%20immutable&rscd=attachment%3B%20filename%3D9041ca23-847a-4de1-bc6e-86abc465f2be.webp&sig=iguZmvmYODytEr67xphb3fl8EPbT7fZbHp4pmS9n%2BdY%3D" width="50" alt="alt"/></a>
                            </li>
                        </c:if>

                    </ul>
                </div>
            </div>

            <nav
                class="navbar navbar-expand-lg bg-body-tertiary text-center p-0 border-bottom border-black"
                >
                <div class="container-fluid row">
                    <div class="col-3">
                        <a class="navbar-brand" href="#">
                            <img
                                src="img/trang(1)(1).png"
                                alt="Home"
                                width="180"
                                height="150"
                                />
                        </a>
                    </div>

                    <button
                        class="navbar-toggler"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#navbarNav"
                        aria-controls="navbarNav"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                        >
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div
                        class="collapse navbar-collapse col-9 position-relative row"
                        id="navbarNav"
                        >
                        <ul
                            class="navbar-nav nav fs-5 text-center align-items-center d-flex col-7 justify-content-center "
                            >
                            <li class="nav-item mx-5 dropdown my-3">
                                <a
                                    class="text-decoration-none text-black active"
                                    role="button"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"
                                    href="#"
                                    >MAN</a
                                >
                                <ul class="dropdown-menu transition fs-5 py-3">
                                    <li><a class="dropdown-item" href="#">Áo</a></li>
                                    <li><a class="dropdown-item" href="#">Quần</a></li>
                                    <li><a class="dropdown-item" href="#">Giày</a></li>
                                </ul>
                            </li>

                            <li class="nav-item mx-5 dropdown my-3">
                                <a
                                    class="text-decoration-none text-black"
                                    role="button"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"
                                    href="#"
                                    >WOMAN</a
                                >
                                <ul class="dropdown-menu transition fs-5">
                                    <li><a class="dropdown-item" href="#">Áo</a></li>
                                    <li><a class="dropdown-item" href="#">Quần</a></li>
                                    <li><a class="dropdown-item" href="#">Giày</a></li>
                                </ul>
                            </li>
                            <li class="nav-item mx-5 dropdown my-3">
                                <a
                                    class="text-decoration-none text-black"
                                    role="button"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"
                                    >SPORTS</a
                                >
                                <ul class="dropdown-menu transition fs-5">
                                    <li><a class="dropdown-item" href="#">Bóng đá</a></li>
                                    <li><a class="dropdown-item" href="#">Bóng rổ </a></li>
                                    <li><a class="dropdown-item" href="#">Chạy bộ</a></li>
                                    <li><a class="dropdown-item" href="#">Tennis</a></li>
                                    <li><a class="dropdown-item" href="#">Bơi lội</a></li>
                                    <li><a class="dropdown-item" href="#">Bóng chuyền</a></li>
                                    <li><a class="dropdown-item" href="#">Cầu Lông</a></li>
                                </ul>
                            </li>

                            <li class="nav-item mx-5 dropdown my-3">
                                <a
                                    class="text-decoration-none text-black"
                                    role="button"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"
                                    >THƯƠNG HIỆU</a
                                >

                                <ul class="dropdown-menu transition fs-5">
                                    <li><a class="dropdown-item" href="#">Nike</a></li>
                                    <li><a class="dropdown-item" href="#">Adidas </a></li>
                                    <li><a class="dropdown-item" href="#">Puma </a></li>
                                    <li><a class="dropdown-item" href="#">Under Armour</a></li>
                                    <li><a class="dropdown-item" href="#">Biti's Hunter </a></li>
                                    <li><a class="dropdown-item" href="#">Li-Ning</a></li>
                                    <li><a class="dropdown-item" href="#">Yonex</a></li>
                                </ul>
                            </li>
                        </ul>

                        <div
                            class="input-group input-group-text bg-white transition-search hide-on-small border border-black col-3"
                            >
                            <span class="bg-white border-end-0 pe-0" id="search-icon "
                                  ><i class="bi bi-search"></i
                                ></span>
                            <input
                                type="text"
                                class="form-control border-0 form-control"
                                placeholder="Tìm Kiếm Sản Phẩm"
                                aria-label="Search"
                                aria-describedby="search-icon"
                                />
                        </div>
                        <a
                            href="#"
                            class="z-1 position-absolute top-50 end-0 translate-middle-y me-5 pe-5 fs-2 text-danger col-2"
                            ><i class="bi bi-cart"
                            ><span
                                    class="position-absolute mt-3 translate-middle badge rounded-pill bg-danger fs-10"
                                    >
                                    99
                                </span></i
                            ></a
                        >
                    </div>
                </div>
            </nav>
        </header>

        <div class="slider mb-5 m-223">
            <div id="carouselExampleIndicators" class="carousel slide">
                <div class="carousel-indicators">
                    <button
                        type="button"
                        data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="0"
                        class="active"
                        aria-current="true"
                        aria-label="Slide 1"
                        ></button>
                    <button
                        type="button"
                        data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="1"
                        aria-label="Slide 2"
                        ></button>
                    <button
                        type="button"
                        data-bs-target="#carouselExampleIndicators"
                        data-bs-slide-to="2"
                        aria-label="Slide 3"
                        ></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img
                            src="img/slideshow_1.jpg"
                            class="d-block w-100"
                            alt="..."
                            />
                    </div>
                    <div class="carousel-item">
                        <img
                            src="img/slideshow_2.jpg"
                            class="d-block w-100"
                            alt="..."
                            />
                    </div>
                    <div class="carousel-item">
                        <img
                            src="img/slider_4.webp"
                            class="d-block w-100"
                            alt="..."
                            />
                    </div>
                </div>
                <button
                    class="carousel-control-prev"
                    type="button"
                    data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="prev"
                    >
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button
                    class="carousel-control-next"
                    type="button"
                    data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="next"
                    >
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <div class="container hot-product">
            <h1 class="text-center my-5">SẢN PHẨM MỚI</h1>
            <div class="position-relative">
                <button
                    type="button"
                    class="btn btn-outline-danger position-absolute top-100 end-0 icon-link icon-link-hover"
                    >
                    Tất cả sản phẩm <i class="bi bi-arrow-right"></i>
                </button>
            </div>
            <div id="hot_Product" class="row justify-content-evenly flex-wrap py-5">

                <div class="card text-center bg-light shadow my-5" style="width: 18rem">
                    <img
                        src="img/1.webp"
                        class="card-img-top"
                        alt="..."
                        />
                    <div class="card-body">
                        <h5 class="card-title">Áo Tập Luyện Đội Tuyển Việt Nam 2023</h5>
                        <p class="card-text fs-4 color-danger">600.000đ</p>
                        <a href="#" class="btn btn-primary">MUA NGAY!</a>
                    </div>
                </div>

                <div class="card text-center bg-light shadow my-5" style="width: 18rem">
                    <img
                        src="img/1.webp"
                        class="card-img-top"
                        alt="..."
                        />
                    <div class="card-body">
                        <h5 class="card-title">Áo Tập Luyện Đội Tuyển Việt Nam 2023</h5>
                        <p class="card-text fs-4 color-danger">600.000đ</p>
                        <a href="#" class="btn btn-primary">MUA NGAY!</a>
                    </div>
                </div>

                <div class="card text-center bg-light shadow my-5" style="width: 18rem">
                    <img
                        src="img/1.webp"
                        class="card-img-top"
                        alt="..."
                        />
                    <div class="card-body">
                        <h5 class="card-title">Áo Tập Luyện Đội Tuyển Việt Nam 2023</h5>
                        <p class="card-text fs-4 color-danger">600.000đ</p>
                        <a href="#" class="btn btn-primary">MUA NGAY!</a>
                    </div>
                </div>

                <div
                    class="card col-3 text-center bg-light shadow my-5"
                    style="width: 18rem"
                    >
                    <img
                        src="img/1.webp"
                        class="card-img-top"
                        alt="..."
                        />
                    <div class="card-body">
                        <h5 class="card-title">Áo Tập Luyện Đội Tuyển Việt Nam 2023</h5>
                        <p class="card-text fs-4 color-danger">600.000đ</p>
                        <a href="#" class="btn btn-primary">MUA NGAY!</a>
                    </div>
                </div>

                <div class="card text-center bg-light shadow my-5" style="width: 18rem">
                    <img
                        src="img/1.webp"
                        class="card-img-top"
                        alt="..."
                        />
                    <div class="card-body">
                        <h5 class="card-title">Áo Tập Luyện Đội Tuyển Việt Nam 2023</h5>
                        <p class="card-text fs-4 color-danger">600.000đ</p>
                        <a href="#" class="btn btn-primary">MUA NGAY!</a>
                    </div>
                </div>

                <div class="card text-center bg-light shadow my-5" style="width: 18rem">
                    <img
                        src="img/1.webp"
                        class="card-img-top"
                        alt="..."
                        />
                    <div class="card-body">
                        <h5 class="card-title">Áo Tập Luyện Đội Tuyển Việt Nam 2023</h5>
                        <p class="card-text fs-4 color-danger">600.000đ</p>
                        <a href="#" class="btn btn-primary">MUA NGAY!</a>
                    </div>
                </div>
                <div class="card text-center bg-light shadow my-5" style="width: 18rem">
                    <img
                        src="img/1.webp"
                        class="card-img-top"
                        alt="..."
                        />
                    <div class="card-body">
                        <h5 class="card-title">Áo Tập Luyện Đội Tuyển Việt Nam 2023</h5>
                        <p class="card-text fs-4 color-danger">600.000đ</p>
                        <a href="#" class="btn btn-primary">MUA NGAY!</a>
                    </div>
                </div>

                <div class="card text-center bg-light shadow my-5" style="width: 18rem">
                    <img
                        src="img/1.webp"
                        class="card-img-top"
                        alt="..."
                        />
                    <div class="card-body">
                        <h5 class="card-title">Áo Tập Luyện Đội Tuyển Việt Nam 2023</h5>
                        <p class="card-text fs-4 color-danger">600.000đ</p>
                        <a href="#" class="btn btn-primary">MUA NGAY!</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="slider my-5">
            <div id="sale" class="carousel slide">
                <div class="carousel-indicators">
                    <button
                        type="button"
                        data-bs-target="#sale"
                        data-bs-slide-to="0"
                        class="active"
                        aria-current="true"
                        aria-label="Slide 1"
                        ></button>
                    <button
                        type="button"
                        data-bs-target="#sale"
                        data-bs-slide-to="1"
                        aria-label="Slide 2"
                        ></button>
                    <button
                        type="button"
                        data-bs-target="#sale"
                        data-bs-slide-to="2"
                        aria-label="Slide 3"
                        ></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img
                            src="img/slideshow_1.jpg"
                            class="d-block w-100"
                            alt="..."
                            />
                    </div>
                    <div class="carousel-item">
                        <img
                            src="img/slideshow_2.jpg"
                            class="d-block w-100"
                            alt="..."
                            />
                    </div>
                    <div class="carousel-item">
                        <img
                            src="img/slider_4.webp"
                            class="d-block w-100"
                            alt="..."
                            />
                    </div>
                </div>
                <button
                    class="carousel-control-prev"
                    type="button"
                    data-bs-target="#sale"
                    data-bs-slide="prev"
                    >
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button
                    class="carousel-control-next"
                    type="button"
                    data-bs-target="#sale"
                    data-bs-slide="next"
                    >
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <div class="container hot-product">
            <h1 class="text-center my-5">SALE</h1>
            <div class="position-relative">
                <button
                    type="button"
                    class="btn btn-outline-danger position-absolute top-100 end-0 icon-link icon-link-hover"
                    >
                    Tất cả sản phẩm <i class="bi bi-arrow-right"></i>
                </button>
            </div>
            <div
                id="sale_Product  "
                class="row justify-content-evenly flex-wrap py-5"
                >
                <div
                    class="card col-3 text-center bg-light shadow my-5"
                    style="width: 18rem"
                    >
                    <img
                        src="img/1.webp"
                        class="card-img-top"
                        alt="..."
                        />
                    <div class="card-body">
                        <h5 class="card-title">Áo Tập Luyện Đội Tuyển Việt Nam 2023</h5>
                        <p class="card-text fs-6 text-decoration-line-through mb-0">
                            600.000đ
                        </p>
                        <h4 class="text-danger my-3">540.000đ</h4>
                        <a href="#" class="btn btn-primary">MUA NGAY!</a>
                    </div>
                </div>

                <div
                    class="card col-3 text-center bg-light shadow my-5"
                    style="width: 18rem"
                    >
                    <img
                        src="img/1.webp"
                        class="card-img-top"
                        alt="..."
                        />
                    <div class="card-body">
                        <h5 class="card-title">Áo Tập Luyện Đội Tuyển Việt Nam 2023</h5>
                        <p class="card-text fs-6 text-decoration-line-through mb-0">
                            600.000đ
                        </p>
                        <h4 class="text-danger my-3">540.000đ</h4>
                        <a href="#" class="btn btn-primary">MUA NGAY!</a>
                    </div>
                </div>
                <div
                    class="card col-3 text-center bg-light shadow my-5"
                    style="width: 18rem"
                    >
                    <img
                        src="img/1.webp"
                        class="card-img-top"
                        alt="..."
                        />
                    <div class="card-body">
                        <h5 class="card-title">Áo Tập Luyện Đội Tuyển Việt Nam 2023</h5>
                        <p class="card-text fs-6 text-decoration-line-through mb-0">
                            600.000đ
                        </p>
                        <h4 class="text-danger my-3">540.000đ</h4>
                        <a href="#" class="btn btn-primary">MUA NGAY!</a>
                    </div>
                </div>
                <div
                    class="card col-3 text-center bg-light shadow my-5"
                    style="width: 18rem"
                    >
                    <img
                        src="img/1.webp"
                        class="card-img-top"
                        alt="..."
                        />
                    <div class="card-body">
                        <h5 class="card-title">Áo Tập Luyện Đội Tuyển Việt Nam 2023</h5>
                        <p class="card-text fs-6 text-decoration-line-through mb-0">
                            600.000đ
                        </p>
                        <h4 class="text-danger my-3">540.000đ</h4>
                        <a href="#" class="btn btn-primary">MUA NGAY!</a>
                    </div>
                </div>
                <div
                    class="card col-3 text-center bg-light shadow my-5"
                    style="width: 18rem"
                    >
                    <img
                        src="img/1.webp"
                        class="card-img-top"
                        alt="..."
                        />
                    <div class="card-body">
                        <h5 class="card-title">Áo Tập Luyện Đội Tuyển Việt Nam 2023</h5>
                        <p class="card-text fs-6 text-decoration-line-through mb-0">
                            600.000đ
                        </p>
                        <h4 class="text-danger my-3">540.000đ</h4>
                        <a href="#" class="btn btn-primary">MUA NGAY!</a>
                    </div>
                </div>
                <div
                    class="card col-3 text-center bg-light shadow my-5"
                    style="width: 18rem"
                    >
                    <img
                        src="img/1.webp"
                        class="card-img-top"
                        alt="..."
                        />
                    <div class="card-body">
                        <h5 class="card-title">Áo Tập Luyện Đội Tuyển Việt Nam 2023</h5>
                        <p class="card-text fs-6 text-decoration-line-through mb-0">
                            600.000đ
                        </p>
                        <h4 class="text-danger my-3">540.000đ</h4>
                        <a href="#" class="btn btn-primary">MUA NGAY!</a>
                    </div>
                </div>
                <div
                    class="card col-3 text-center bg-light shadow my-5"
                    style="width: 18rem"
                    >
                    <img
                        src="img/1.webp"
                        class="card-img-top"
                        alt="..."
                        />
                    <div class="card-body">
                        <h5 class="card-title">Áo Tập Luyện Đội Tuyển Việt Nam 2023</h5>
                        <p class="card-text fs-6 text-decoration-line-through mb-0">
                            600.000đ
                        </p>
                        <h4 class="text-danger my-3">540.000đ</h4>
                        <a href="#" class="btn btn-primary">MUA NGAY!</a>
                    </div>
                </div>
                <div
                    class="card col-3 text-center bg-light shadow my-5"
                    style="width: 18rem"
                    >
                    <img
                        src="img/1.webp"
                        class="card-img-top"
                        alt="..."
                        />
                    <div class="card-body">
                        <h5 class="card-title">Áo Tập Luyện Đội Tuyển Việt Nam 2023</h5>
                        <p class="card-text fs-6 text-decoration-line-through mb-0">
                            600.000đ
                        </p>
                        <h4 class="text-danger my-3">540.000đ</h4>
                        <a href="#" class="btn btn-primary">MUA NGAY!</a>
                    </div>
                </div>
            </div>
        </div>

        <footer class="row bg-black row justify-content-center">
            <div
                class="col-4 mt-5 pb-5 d-flex d-flex flex-column text-white align-items-end"
                >
                <h4 class="mt-2">HỖ TRỢ KHÁCH HÀNG</h4>
                <div class="d-flex flex-column mt-3">
                    <i class="bi bi-fast-forward p-2"
                       ><a
                            href=""
                            class="ms-4 text-white text-decoration-none text-opacity-75"
                            >Hướng dẫn đặt hàng</a
                        ></i
                    >
                    <i class="bi bi-fast-forward p-2"
                       ><a
                            href=""
                            class="ms-4 text-white text-decoration-none text-opacity-75"
                            >Hướng dẫn chọn size</a
                        ></i
                    >
                    <i class="bi bi-fast-forward p-2"
                       ><a
                            href=""
                            class="ms-4 text-white text-decoration-none text-opacity-75"
                            >Câu hỏi thường gặp</a
                        ></i
                    >
                    <i class="bi bi-fast-forward p-2"
                       ><a
                            href=""
                            class="ms-4 text-white text-decoration-none text-opacity-75"
                            >Chính sách đổi hàng</a
                        ></i
                    >
                    <i class="bi bi-fast-forward p-2"
                       ><a
                            href=""
                            class="ms-4 text-white text-decoration-none text-opacity-75"
                            >Thanh toán - Giao hàng</a
                        ></i
                    >
                    <i class="bi bi-fast-forward p-2"
                       ><a
                            href=""
                            class="ms-4 text-white text-decoration-none text-opacity-75"
                            >Chính sách đổi hàng</a
                        ></i
                    >
                </div>
            </div>

            <div
                class="col-3 d-flex text-white align-items-center justify-content-center"
                >
                <div class="d-flex flex-column align-items-center">
                    <img
                        src="img/den.png"
                        alt="Home"
                        width="300px"
                        height="250px"
                        />
                    <div class="d-flex flex-column mb-5">
                        <i class="bi bi-fast-forward pb-2"
                           ><a
                                href=""
                                class="ms-4 text-white text-decoration-none text-opacity-75"
                                >Giới Thiệu</a
                            ></i
                        >
                        <i class="bi bi-fast-forward py-2"
                           ><a
                                href=""
                                class="ms-4 text-white text-decoration-none text-opacity-75"
                                >Liên Hệ</a
                            ></i
                        >
                        <i class="bi bi-fast-forward py-2"
                           ><a
                                href=""
                                class="ms-4 text-white text-decoration-none text-opacity-75"
                                >Tin Tức</a
                            ></i
                        >
                    </div>
                </div>
            </div>
            <div class="col-4 d-flex flex-column mt-5 align-items-start">
                <div class="d-flex justify-content-center">
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d24575.923423228673!2d105.52827134127816!3d21.02251928565461!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abc60e7d3f19%3A0x2be9d7d0b5abcbf4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgSMOgIE7hu5lp!5e0!3m2!1svi!2s!4v1716280361503!5m2!1svi!2s"
                        width="500"
                        height="300px"
                        class="border border-danger rounded border border-5 border-opacity-50"
                        allowfullscreen=""
                        loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade"
                        ></iframe>
                </div>
                <div id="list-icon " class="d-flex my-5 fs-3">
                    <a href="" class="text-light text-opacity-75 mx-3"
                       ><i class="bi bi-facebook"></i
                        ></a>
                    <a href="" class="text-light text-opacity-75 mx-3"
                       ><i class="bi bi-instagram"></i
                        ></a>
                    <a href="" class="text-light text-opacity-75 mx-3"
                       ><i class="bi bi-tiktok"></i
                        ></a>
                    <a href="" class="text-light text-opacity-75 mx-3"
                       ><i class="bi bi-youtube"></i
                        ></a>
                </div>
            </div>
        </footer>
    </body>
</html>

