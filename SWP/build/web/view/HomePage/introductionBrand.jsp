<%-- 
    Document   : introductionBrand
    Created on : May 20, 2024, 10:41:03 PM
    Author     : Hoàng Sơn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Giới Thiệu</title>
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

        <div class="m-223 pt-5 container">

            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><span><i class="bi bi-house-door mx-3"></i></span><a href="HomePage" class="text-decoration-none text-black">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Giới Thiệu</li>
                </ol>
            </nav>

            <h2 class="my-5">Giới Thiệu</h2>
            <p class="fw-light fs-5">
                Thương hiệu thời trang nam 4MEN được thành lập từ tháng 3 năm 2010, là
                thương hiệu thời trang uy tín đến từ Châu Á hàng đầu Châu Âu .
            </p>
            <h5 class="my-4">SỨ MỆNH</h5>
            <p class="fw-light fs-5">
                Với sứ mệnh làm cho mọi người trở nên tự tin và sẵn sàng chinh phục mọi
                thách thức, [Tên Thương Hiệu] cung cấp một loạt các sản phẩm chất lượng
                cao từ quần áo thể thao đến dụng cụ và phụ kiện. Bất kể bạn là một vận
                động viên chuyên nghiệp hay đang tìm kiếm sự thoải mái trong các hoạt
                động ngoại ô, chúng tôi cam kết mang đến cho bạn những sản phẩm đáng tin
                cậy nhất.
            </p>
            <p class="fw-light fs-5">
                Sứ mệnh của chúng tôi không chỉ dừng lại ở việc cung cấp sản phẩm, mà
                còn là tạo ra cộng đồng đam mê và khích lệ nhau phát triển. [Tên Thương
                Hiệu] luôn khuyến khích việc thể hiện bản thân thông qua phong cách
                riêng và đồng thời hỗ trợ cộng đồng thông qua các hoạt động xã hội và từ
                thiện.
            </p>
            <h5 class="my-4">THÔNG ĐIỆP GỬI ĐẾN BẠN</h5>
            <p class="fw-light fs-5">
                AE Sport muốn truyền cảm hứng tích cực đến các chàng trai: Việc mặc đẹp
                rất quan trọng, nó thể hiện được cá tính, sự tự tin và cả một phần lối
                sống, cách suy nghĩ của bản thân. Mặc thanh lịch, sống thanh lịch.
            </p>
            <h6 class="fw-bolder my-4">
                Hãy cùng chúng tôi chinh phục mọi thử thách, với AESport, cuộc sống thể
                thao của bạn sẽ không bao giờ là nhàm chán!
            </h6>
            <h6 class="text-center my-5 fs-4 text-danger fst-italic">
                Chọn 4MEN, bạn đang lựa chọn sự hoàn hảo cho điểm nhấn thời trang của
                chính mình!
            </h6>
        </div>

        <jsp:include page="footer.jsp"/>

    </body>
</html>
