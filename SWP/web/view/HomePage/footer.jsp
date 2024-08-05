<%-- 
    Document   : footer
    Created on : May 30, 2024, 12:09:04 AM
    Author     : Hoàng Sơn
--%>


<%@page import="data.SettingContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            SettingContext settingDB = new SettingContext();
            String logo = settingDB.getLogo("logof");
        %>
    </head>
    <body>
        <footer class="row bg-black row justify-content-center">
            <div
                class="col-3 d-flex text-white align-items-start justify-content-center"
                >
                <div class="d-flex flex-column align-items-center">
                    <a href="HomePage">
                        <img
                            src="img/logo/<%=logo %>"
                            alt="Home"
                            width="300px"
                            height="294px"
                            />
                    </a>

                    <div class="d-flex flex-column">
                        <i class="bi bi-fast-forward pb-2"
                           ><a
                                href="introBrand"
                                class="ms-4 text-white text-decoration-none text-opacity-75"
                                >Giới Thiệu</a
                            ></i
                        >
                        <i class="bi bi-fast-forward py-2"
                           ><a
                                href="#"
                                class="ms-4 text-white text-decoration-none text-opacity-75"
                                >Liên Hệ</a
                            ></i
                        >
                        <i class="bi bi-fast-forward py-2"
                           ><a
                                href="BlogList?page=1"
                                class="ms-4 text-white text-decoration-none text-opacity-75"
                                >Tin Tức</a
                            ></i
                        >
                    </div>
                </div>
            </div>
            <div
                class="col-3 pb-5 d-flex d-flex flex-column text-white align-items-start justify-content-center"
                >
                <h4 class="mt-2">HỖ TRỢ KHÁCH HÀNG</h4>
                <div class="d-flex flex-column mt-3">
                    <i class="bi bi-fast-forward p-2"
                       ><a
                            href="/SWP/oderview"
                            class="ms-4 text-white text-decoration-none text-opacity-75"
                            >Hướng dẫn đặt hàng</a
                        ></i
                    >
                    <i class="bi bi-fast-forward p-2"
                       ><a
                            href="/SWP/choosesize"
                            class="ms-4 text-white text-decoration-none text-opacity-75"
                            >Hướng dẫn chọn size</a
                        ></i
                    >
                    <i class="bi bi-fast-forward p-2"
                       ><a
                            href="/SWP/help/support.jsp"
                            class="ms-4 text-white text-decoration-none text-opacity-75"
                            >Câu hỏi thường gặp</a
                        ></i
                    >
                    <i class="bi bi-fast-forward p-2"
                       ><a
                            href="/SWP/help/support.jsp"
                            class="ms-4 text-white text-decoration-none text-opacity-75"
                            >Chính sách đổi hàng</a
                        ></i
                    >
                    <i class="bi bi-fast-forward p-2"
                       ><a
                            href="/SWP/help/support.jsp"
                            class="ms-4 text-white text-decoration-none text-opacity-75"
                            >Thanh toán - Giao hàng</a
                        ></i
                    >
                    <i class="bi bi-fast-forward p-2"
                       ><a
                            href="/SWP/help/support.jsp"
                            class="ms-4 text-white text-decoration-none text-opacity-75"
                            >Chính sách đổi hàng</a
                        ></i
                    >
                </div>
            </div>

            <div class="col-4 d-flex justify-content-start">
                <div class="d-flex flex-column mt-5 py-5">
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d24575.923423228673!2d105.52827134127816!3d21.02251928565461!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abc60e7d3f19%3A0x2be9d7d0b5abcbf4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgSMOgIE7hu5lp!5e0!3m2!1svi!2s!4v1716280361503!5m2!1svi!2s"
                        width="500"
                        height="300px"
                        class="border border-danger rounded border border-5 border-opacity-50"
                        allowfullscreen=""
                        loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade"
                        ></iframe>
                    <div class="m-2">
                        <div id="list-icon " class="d-flex fs-3">
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
                </div>
            </div>
        </footer>
    </body>
</html>
