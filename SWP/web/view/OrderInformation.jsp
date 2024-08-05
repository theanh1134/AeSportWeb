<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Đơn Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat&display=swap');
        body {
            background-color: whitesmoke;
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .logo {
            background-color: #f8f9fa;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .invoice {
            padding: 40px 30px;
        }
        .invoice h5 {
            margin-bottom: 20px;
        }
        .totals tr td {
            font-size: 14px;
        }
        .footer {
            background-color: #f8f9fa;
            padding: 15px 30px;
        }
        .footer span {
            font-size: 12px;
        }
        .product-qty span {
            font-size: 12px;
            color: #6c757d;
        }
        .menu-icon {
            cursor: pointer;
            color: #343a40;
        }
        .menu-icon:hover {
            color: #007bff;
        }
        .dropdown-menu {
            border-radius: 10px;
        }
    </style>
</head>

<body>    
    <div class="container mt-5 mb-5">
        <div class="row d-flex justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="logo">
                        <img src="img/logo/trang.png" width="80" alt="Logo">
                        <div class="dropdown">
                            <i class="fa fa-bars fa-2x menu-icon" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false"></i>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <li><a class="dropdown-item" href="#" onclick="CancelOrder(${order.order_ID})">Hủy Đơn Hàng</a></li>
                                <li><a class="dropdown-item" href="#">Tiếp Tục Mua Sắm</a></li>
                                <li><a class="dropdown-item" href="./submitFeedback">Xem Phản Hồi</a></li>
                                <li><a class="dropdown-item" href="./HomePage">Trang Chủ</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="invoice">
                        <h5>Đơn Hàng Của Bạn Đã Được Xác Nhận!</h5>
                        <span class="font-weight-bold d-block mt-4">Chào bạn, ${sessionScope.CRRAccount.full_Name}!</span>
                        <span>Đơn hàng của bạn đã được xác nhận và sẽ được giao trong hai ngày tới!</span>
                        <div class="payment border-top mt-3 mb-3 border-bottom table-responsive">
                            <table class="table table-borderless">
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="py-2"> <span class="d-block text-muted">Ngày Đặt Hàng</span> <span>${order.order_date}</span> </div>
                                        </td>
                                        <td>
                                            <div class="py-2"> <span class="d-block text-muted">Số Đơn Hàng</span> <span>${order.order_ID}</span> </div>
                                        </td>
                                        <td>
                                            <div class="py-2"> <span class="d-block text-muted">Phương Thức Thanh Toán</span><span><img src="https://img.icons8.com/color/48/000000/mastercard.png" width="20" />${order.payment.payName}</span> </div>
                                        </td>
                                        <td>
                                            <div class="py-2"> <span class="d-block text-muted">Địa Chỉ Giao Hàng</span> <span>${order.ship.ship_method}</span> </div>
                                        </td>
                                         <td>
                                            <div class="py-2"> <span class="d-block text-muted">Trạng Thái Đơn Hàng</span> <span>${order.order_status}</span> </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="product border-bottom table-responsive">
                            <table class="table table-borderless">
                                <tbody>
                                    <c:forEach var="item" items="${items}">
                                        <tr>
                                            <td width="20%"> <img src="img/product/${item.product.img.imgUrl}" width="90" alt="${item.product.productName}"> </td>
                                            <td width="60%">
                                                <span class="font-weight-bold">${item.product.productName}</span>
                                                <div class="product-qty"> 
                                                    <span class="d-block">Số Lượng: ${item.quantity}</span> 
                                                </div>
                                            </td>
                                            <td width="20%">
                                                <div class="text-right"> <span class="font-weight-bold">${item.price_unit}VND</span> </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="row d-flex justify-content-end">
                            <div class="col-md-5">
                                <table class="table table-borderless">
                                    <tbody class="totals">
                                        <tr>
                                            <td>
                                                <div class="text-left"> <span class="text-muted">Tổng Tiền</span> </div>
                                            </td>
                                            <td>
                                                <div class="text-right"> <span>${order.total_mount}VND</span> </div>
                                            </td>
                                        </tr>
                                                                              
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <p class="font-weight-bold mb-0">Cảm ơn bạn đã mua sắm cùng chúng tôi!</p>
                        <span>Nhóm AE Sport</span>
                    </div>
                    <div class="d-flex justify-content-between footer">
                        <span>Cần Hỗ Trợ? Truy cập <a href="#">trung tâm trợ giúp</a></span>
                        <span>${order.order_date}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script>
function CancelOrder(orderId) {
    if (confirm('Bạn chắc chắn muốn hủy đơn hàng này?')) {
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "Order?action=cancel", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send("orderId=" + orderId);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                if (xhr.responseText === "Order is already cancelled.") {
                    alert("Đơn hàng đã được hủy và không thể cập nhật.");
                } else if (xhr.responseText === "Order has already been delivered and cannot be cancelled.") {
                    alert("Đơn hàng đã được giao và không thể hủy.");
                } else if (xhr.responseText === "Order cancelled successfully.") {
                    window.location.href = 'Order?action=myOrder';
                }
            }
        };
    }
}
</script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
