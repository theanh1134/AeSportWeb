<%-- 
    Document   : chooseSize
    Created on : May 21, 2024, 5:16:07 PM
    Author     : Hoàng Sơn
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Hướng Dẫn Chọn Size</title>
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
            body {
                overflow-x: hidden;
            }
            .m-223{
                margin-top: 223px;
            }

        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class=" m-223 pt-5 container mb-5">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><span><i class="bi bi-house-door mx-3"></i></span><a href="HomePage" class="text-decoration-none text-black">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Cách Chọn Size</li>
                </ol>
            </nav>

            <h2 class="my-5">Hướng dẫn chọn size</h2>
            <p class="fw-light fs-5">
                Nếu bạn băn khoăn không biết chọn size nào cho phù hợp với cân nặng và
                chiều cao của mình, đừng lo lắng! Hãy xem bảng hướng dẫn chọn size bên
                dưới mà 4MEN tư vấn riêng dành cho bạn.
            </p>
            <img src="img/size/áo.png" alt="" class="my-3" />
            <img src="img/size/quan.png" alt="" class="my-3" />
            <img src="img/size/giày.jpg" alt="" class="my-3" />

            <p class="fs-5 fw-light">
                Bảng hướng dẫn chọn size trên là bảng hướng dẫn dựa trên kinh nghiệm
                nhiều năm của 4MEN theo khảo sát nhu cầu sở thích của khách hàng, tất
                nhiên sẽ không tuyệt đối, sẽ có những trường hợp ngoại lệ phụ thuộc theo
                vóc dáng, sở thích của từng người. Ví dụ có người thích mặc ôm, có người
                thích mặc rộng...
            </p>
            <p class="fs-5">
                Nếu bạn vẫn còn có những mắc thắc và băn khoăn cần được giải đáp? Hãy
                liên hệ ngay với Bộ phận Chăm sóc khách hàng của AESport qua Hotline
                <span class="fw-bold">0332454556</span> để được hỗ trợ thêm.
            </p>
        </div>

        <jsp:include page="footer.jsp"/>


    </body>
</html>
