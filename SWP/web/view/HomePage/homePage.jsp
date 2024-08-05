<%-- 
    Document   : homePage
    Created on : May 18, 2024, 3:44:25 PM
    Author     : Hoàng Sơn
--%>

<%@page import="DBContext.AdminDAO"%>
<%@page import="data.SettingContext"%>
<%@page import="entity.product"%>
<%@page import="data.ProductContext"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
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

        </style>
        <%
            ProductContext productDB = new ProductContext();
            ArrayList<product> productsHotHomePage = productDB.getProductsonHomePage("hot");
            ArrayList<product> productsSaleHomePage = productDB.getProductsonHomePage("sale");
            SettingContext settingDB = new SettingContext();
            ArrayList<String> slide1 =  settingDB.getSilde("slide1");
            ArrayList<String> slide2 = settingDB.getSilde("slide2");
            ArrayList<String> slide3 =  settingDB.getSilde("slide3");
            ArrayList<String> slide4 =  settingDB.getSilde("slide4");
            
            // xoa  Discount het han
            AdminDAO dao = new AdminDAO();
            dao.deleteExpiredDiscounts();
        %>
    </head>

    <body>
        <jsp:include page="header.jsp"/>
        <div id="slide-fist" class="carousel slide  m-200" data-bs-ride="carousel">
            <div class="carousel-inner">
                <%
                               for (int idx = 0; idx < slide1.size(); idx++) {
                                   String slide = slide1.get(idx);
                %>
                <div class="carousel-item <%= (idx == 0) ? "active" : "" %>">
                    <img src="img/slide/<%= slide %>" class="d-block w-100" alt="...">
                </div>
                <%
                    }
                %>

            </div>
            <button
                class="carousel-control-prev"
                type="button"
                data-bs-target="#slide-fist"
                data-bs-slide="prev"
                >
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button
                class="carousel-control-next"
                type="button"
                data-bs-target="#slide-fist"
                data-bs-slide="next"
                >
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>


        <h1 class="text-center my-5">SẢN PHẨM HOT</h1>
        <div class="container  alert alert-light">

            <div id="hot_product" class="row  flex-wrap py-5 justify-content-center">
                <%   for (product pro : productsHotHomePage) {%>
                <div class="card text-center bg-white shadow m-2" style="width: 18rem">
                    <img
                        src="img/product/<%=pro.getImage().get(0).getUrl()%> "
                        class="card-img-top"
                        alt="..."
                        />
                    <div class="card-body">
                        <a href="" class="text-decoration-none">
                            <h5 class="card-title text-black" style="height: 3.5rem">
                                <%= pro.getProductName()%>
                            </h5></a
                        >
                        <p class="card-text fs-4 text-danger"><%=pro.getPrice()%>đ</p>
                        <div data-tooltip="Giá:<%=pro.getPrice()%>đ" class="button btn">
                            <a href="Product?productId=<%= pro.getProductID()%>">
                                <div class="button-wrapper ">
                                    <div class="text  ">MUA NGAY!</div>
                                    <span class="icon fs-6">
                                        <i class="bi bi-bag-plus"></i>
                                    </span>
                                </div>
                            </a>
                        </div>

                    </div>
                </div>
                <% }%>

            </div>
        </div>

        <div id="hotproduct" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <%
              
               for (int idx = 0; idx < slide2.size(); idx++) {
                   String slide = slide2.get(idx);
                %>
                <div class="carousel-item <%= (idx == 0) ? "active" : "" %>">
                    <img src="img/slide/<%= slide %>" class="d-block w-100" alt="...">
                </div>
                <%
                    }
                %>

            </div>
            <button
                class="carousel-control-prev"
                type="button"
                data-bs-target="#hotproduct"
                data-bs-slide="prev"
                >
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button
                class="carousel-control-next"
                type="button"
                data-bs-target="#hotproduct"
                data-bs-slide="next"
                >
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>


        <div id="quoc_gia">
            <h1 class="text-center my-5">ĐỘI TUYỂN QUỐC GIA</h1>
            <div class="border-warning border-3 border-top">
                <div class="d-flex mx-5 px-5">
                    <a href="#" class=""
                       ><img
                            src="img/quocgia/1.svg"
                            class="rounded img-fluid w-100"
                            alt="..."
                            /></a>
                    <a href="#" class=""
                       ><img
                            src="img/quocgia/2.svg"
                            class="rounded img-fluid w-100"
                            alt="..."
                            /></a>
                    <a href="#" class=""
                       ><img
                            src="img/quocgia/3.svg"
                            class="rounded img-fluid w-100"
                            alt="..."
                            /></a>
                    <a href="#" class=""
                       ><img
                            src="img/quocgia/4.svg"
                            class="rounded img-fluid w-100"
                            alt="..."
                            /></a>
                    <a href="#" class=""
                       ><img
                            src="img/quocgia/5.svg"
                            class="rounded img-fluid w-100"
                            alt="..."
                            /></a>
                    <a href="#" class=""
                       ><img
                            src="img/quocgia/12.svg"
                            class="rounded img-fluid w-100"
                            alt="..."
                            /></a>
                </div>

                <div class="d-flex mx-5 px-5">
                    <a href="#" class=""
                       ><img
                            src="img/quocgia/6.svg"
                            class="rounded img-fluid w-100"
                            alt="..."
                            /></a>
                    <a href="#" class=""
                       ><img
                            src="img/quocgia/7.svg"
                            class="rounded img-fluid w-100"
                            alt="..."
                            /></a>
                    <a href="#" class=""
                       ><img
                            src="img/quocgia/8.svg"
                            class="rounded img-fluid w-100"
                            alt="..."
                            /></a>
                    <a href="#" class=""
                       ><img
                            src="img/quocgia/9.svg"
                            class="rounded img-fluid w-100"
                            alt="..."
                            /></a>
                    <a href="#" class=""
                       ><img
                            src="img/quocgia/10.svg"
                            class="rounded img-fluid w-100"
                            alt="..."
                            /></a>
                    <a href="#" class=""
                       ><img
                            src="img/quocgia/11.svg"
                            class="rounded img-fluid w-100"
                            alt="..."
                            /></a>
                </div>
            </div>
        </div>

        <div id="quocgia" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <%
              
            for (int idx = 0; idx < slide3.size(); idx++) {
                String slide = slide3.get(idx);
                %>
                <div class="carousel-item <%= (idx == 0) ? "active" : "" %>">
                    <img src="img/slide/<%= slide %>" class="d-block w-100" alt="...">
                </div>
                <%
                    }
                %>


            </div>
            <button
                class="carousel-control-prev"
                type="button"
                data-bs-target="#quocgia"
                data-bs-slide="prev"
                >
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button
                class="carousel-control-next"
                type="button"
                data-bs-target="#quocgia"
                data-bs-slide="next"
                >
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <h1 class="text-center my-5">SALE</h1>
        <div class="container  alert alert-light">

            <div id="sale_product  "
                 class="row flex-wrap py-5 justify-content-center"
                 >
                <%
                    for (product p : productsSaleHomePage) {%>
                <div
                    class="card col-3 text-center bg-white shadow m-2"
                    style="width: 18rem"
                    >
                    <span class="  z-1 position-absolute p-2 m-2 rounded-5 text-white bg-danger top-0 end-0 ">-<%= p.getDiscount().getDiscount_Amount()%>%</span>
                    <img
                        src="img/product/<%= p.getImage().get(0).getUrl()%>"
                        class="card-img-top img-fluid"
                        alt="..."
                        />
                    <div class="card-body">
                        <h5 class="card-title fixed-height"><%= p.getProductName()%></h5>
                        <div class="d-flex justify-content-center align-items-center">
                            <p class="card-text fs-6 text-decoration-line-through mx-1 mb-0">
                                <%= p.getPrice()%>đ
                            </p>

                        </div>
                        <h4 class="text-danger my-2"><%= Math.round((p.getPrice() / 100) * (100 - p.getDiscount().getDiscount_Amount()))%> đ</h4>
                        <div data-tooltip="Giá:<%=p.getPrice()%>đ" class="button btn">
                            <a href="Product?productId=<%= p.getProductID()%>">
                                <div class="button-wrapper ">
                                    <div class="text  ">MUA NGAY!</div>
                                    <span class="icon fs-6">
                                        <i class="bi bi-bag-plus"></i>
                                    </span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>


                <%}%>



            </div>
        </div>

        <div id="clb" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <%
              
for (int idx = 0; idx < slide4.size(); idx++) {
    String slide = slide4.get(idx);
                %>
                <div class="carousel-item <%= (idx == 0) ? "active" : "" %>">
                    <img src="img/slide/<%= slide %>" class="d-block w-100" alt="...">
                </div>
                <%
                    }
                %>
            </div>
            <button
                class="carousel-control-prev"
                type="button"
                data-bs-target="#clb"
                data-bs-slide="prev"
                >
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button
                class="carousel-control-next"
                type="button"
                data-bs-target="#clb"
                data-bs-slide="next"
                >
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <div id="clb">
            <h1 class="text-center my-5">CÂU LẠC BỘ ĐÁ BÓNG</h1>
            <div class="border border-warning border-3">
                <div class="d-flex mx-5 px-5">
                    <a href="#" class=""
                       ><img
                            src="img/clb/3.svg"
                            class="rounded img-fluid w-100"
                            alt="..."
                            /></a>
                    <a href="#" class=""
                       ><img
                            src="img/clb/4.svg"
                            class="rounded img-fluid w-100"
                            alt="..."
                            /></a>
                    <a href="#" class=""
                       ><img
                            src="img/clb/5.svg"
                            class="rounded img-fluid w-100"
                            alt="..."
                            /></a>
                    <a href="#" class=""
                       ><img
                            src="img/clb/6.svg"
                            class="rounded img-fluid w-100"
                            alt="..."
                            /></a>
                    <a href="#" class=""
                       ><img
                            src="img/clb/7.svg"
                            class="rounded img-fluid w-100"
                            alt="..."
                            /></a>
                </div>

                <div class="d-flex mx-5 px-5">
                    <a href="#" class=""
                       ><img
                            src="img/clb/8.svg"
                            class="rounded img-fluid w-100"
                            alt="..."
                            /></a>
                    <a href="#" class=""
                       ><img
                            src="img/clb/9.svg"
                            class="rounded img-fluid w-100"
                            alt="..."
                            /></a>
                    <a href="#" class=""
                       ><img
                            src="img/clb/10.svg"
                            class="rounded img-fluid w-100"
                            alt="..."
                            /></a>
                    <a href="#" class=""
                       ><img
                            src="img/clb/11.svg"
                            class="rounded img-fluid w-100"
                            alt="..."
                            /></a>
                    <a href="#" class=""
                       ><img
                            src="img/clb/Untitled design.png"
                            class="rounded img-fluid w-100"
                            alt="..."
                            /></a>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>

    </body>
</html>

