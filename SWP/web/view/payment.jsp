           <!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .header {
            display: flex;
            align-items: center;
            padding-bottom: 10px;
            border-bottom: 1px solid #ddd;
        }
        .header img {
            height: 50px;
            margin-right: 20px;
        }
        .header h2 {
            margin: 0;
            color: #ff5722;
        }
        .address {
            margin-top: 20px;
            padding: 10px;
            background-color: #fff8e1;
            border: 1px solid #ff9800;
            border-radius: 4px;
        }
        .address h3 {
            margin-top: 0;
        }
        .address p {
            margin: 5px 0;
        }
        .change-link {
            color: #007bff;
            text-decoration: none;
            margin-left: 10px;
        }
        .product {
            margin-top: 20px;
        }
        .product h3 {
            margin-top: 0;
        }
        .product-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }
        .product-item img {
            width: 80px;
            height: 80px;
            margin-right: 10px;
        }
        .product-info {
            flex-grow: 1;
        }
        .product-info p {
            margin: 5px 0;
        }
        .shipping, .total {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }
        .shipping p, .total p {
            margin: 5px 0;
        }
        .voucher, .payment-method {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }
        .voucher button, .payment-method button {
            padding: 10px 20px;
            background-color: #ff5722;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }
        .voucher button:hover, .payment-method button:hover {
            background-color: #e64a19;
        }
        .payment {
            margin-top: 20px;
            padding: 10px;
            background-color: #fff8e1;
            border: 1px solid #ff9800;
            border-radius: 4px;
        }
        .payment h3 {
            margin-top: 0;
        }
        .payment-summary {
            margin-top: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #fff;
        }
        .payment-summary h3 {
            margin: 0 0 10px 0;
        }
        .payment-summary p {
            display: flex;
            justify-content: space-between;
            margin: 5px 0;
        }
        .order-button {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-top: 20px;
        }
        .order-button button {
            padding: 10px 20px;
            background-color: #ff5722;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }
        .order-button button:hover {
            background-color: #e64a19;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <img src="https://via.placeholder.com/100x50" alt="Shopee Logo">
        <h2>Thanh Toán</h2>
    </div>

    <div class="address">
        <h3>Địa chỉ nhận hàng</h3>
        <p>Đoàn Thế Anh (+84) 389530910</p>
        <p>cổng Phụ Trường Đại Học Fpt, Đườnng Vào Công, Xã Thạch Hòa, Huyện Thach Thất, Hà Nôi <a href="#" class="change-link">Thay đổi</a></p>
    </div>

    <div class="product">
        <h3>Sản Phẩm</h3>
        <div class="product-item">
            <img src="https://via.placeholder.com/80" alt="Product Image">
            <div class="product-info">
                <p>[Mã 6SPIKE3 gi?m 50K ??n 150K] Giày thể thao nam da P...</p>
                <p>Loại: 39</p>
            </div>
            <p>112.500 x 1</p>
            <p>112.500</p>
        </div>
        <div class="shipping">
            <p>Phương thức vận chuyển: Nhanh <a href="#" class="change-link">Thay đổi</a></p>
            <p>Phí vận chuyển: ?22.200</p>
        </div>
        <div class="total">
            <p>Tổng số tiền (1 sản phẩm):</p>
            <p>134.700đ</p>
        </div>
    </div>

    

    <div class="payment-method">
        <p>Phương thức thanh toán</p>
        <button>THAY ĐỔI</button>
    </div>

    <div class="payment-summary">
        <h3>Phương thức thanh toán</h3>
        <p>Thanh toán khi nhận hàng <a href="#" class="change-link">THAY ??I</a></p>
        <p><span>Tổng tiền hàng:</span> <span>?112.500</span></p>
        <p><span>Phí vận chuyển:</span> <span>?22.200</span></p>
        <p><strong><span>Tổng thanh toán:</span> <span style="color: red;">?134.700</span></strong></p>
    </div>

    <div class="order-button">
        <button>Đặt hàng</button>
    </div>

    <p>Nhận đặt hàng đồng nghĩa với việc bạn đồng ý tuân theo <a href="#">điều khoản AESport</a></p>
</div>

</body>
</html>