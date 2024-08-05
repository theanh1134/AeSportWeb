<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Danh Sách Đơn Hàng</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                min-width: 1000px;
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-wrapper .btn {
                float: right;
                color: #333;
                background-color: #fff;
                border-radius: 3px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-wrapper .btn:hover {
                color: #333;
                background: #f2f2f2;
            }
            .table-wrapper .btn.btn-primary {
                color: #fff;
                background: #03A9F4;
            }
            .table-wrapper .btn.btn-primary:hover {
                background: #03a3e7;
            }
            .table-title .btn {
                font-size: 13px;
                border: none;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            .table-title {
                color: #fff;
                background: #4b5366;
                padding: 16px 25px;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .show-entries select.form-control {
                width: 60px;
                margin: 0 5px;
            }
            .table-filter .filter-group {
                float: right;
                margin-left: 15px;
            }
            .table-filter input, .table-filter select {
                height: 34px;
                border-radius: 3px;
                border-color: #ddd;
                box-shadow: none;
            }
            .table-filter {
                padding: 5px 0 15px;
                border-bottom: 1px solid #e9e9e9;
                margin-bottom: 5px;
            }
            .table-filter .btn {
                height: 34px;
            }
            .table-filter label {
                font-weight: normal;
                margin-left: 10px;
            }
            .table-filter select, .table-filter input {
                display: inline-block;
                margin-left: 5px;
            }
            .table-filter input {
                width: 200px;
                display: inline-block;
            }
            .filter-group select.form-control {
                width: 110px;
            }
            .filter-icon {
                float: right;
                margin-top: 7px;
            }
            .filter-icon i {
                font-size: 18px;
                opacity: 0.7;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 80px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.view {
                width: 30px;
                height: 30px;
                color: #2196F3;
                border: 2px solid;
                border-radius: 30px;
                text-align: center;
            }
            table.table td a.view i {
                font-size: 22px;
                margin: 2px 0 0 1px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .status {
                display: inline-flex;
                align-items: center;
            }
            .status .status-dot {
                width: 10px;
                height: 10px;
                border-radius: 50%;
                display: inline-block;
                margin-right: 5px;
            }
            .status-delivered .status-dot {
                background-color: #10c469;
            }
            .status-shipped .status-dot {
                background-color: #62c9e8;
            }
            .status-pending .status-dot {
                background-color: #FFC107;
            }
            .status-cancelled .status-dot {
                background-color: #ff5b5b;
            }
            .status-other .status-dot {
                background-color: #bfbfbf;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }
            .logo {
                position: absolute;
                top: 20px;
                left: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container-xl">
            <div class="logo">
                <img src="img/logo/trang.png" alt="Logo" width="80" height="80">
            </div>
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-4">
                                <h2>Danh Sách <b>Đơn Hàng</b></h2>
                            </div>
                        </div>
                    </div>
                    <div class="table-filter">
                        <div class="row">
                            <div class="col-sm-3">
                            </div>
                            <div class="col-sm-9">
                                <button type="button" class="btn btn-primary"><i class="fa fa-search"></i></button>
                                <div class="filter-group">
                                    <label>Tên</label>
                                    <input type="text" class="form-control" name="name">
                                </div>
                                <div class="filter-group">
                                    <label>Vị trí</label>
                                    <select class="form-control" name="location">
                                        <option>Tất cả</option>
                                        <option>An Giang</option>
                                        <option>Bà Rịa - Vũng Tàu</option>
                                        <option>Bắc Giang</option>
                                        <option>Bắc Kạn</option>
                                        <option>Bạc Liêu</option>
                                        <option>Bắc Ninh</option>
                                        <option>Bến Tre</option>
                                        <option>Bình Định</option>
                                        <option>Bình Dương</option>
                                        <option>Bình Phước</option>
                                        <option>Bình Thuận</option>
                                        <option>Cà Mau</option>
                                        <option>Cần Thơ</option>
                                        <option>Cao Bằng</option>
                                        <option>Đà Nẵng</option>
                                        <option>Đắk Lắk</option>
                                        <option>Đắk Nông</option>
                                        <option>Điện Biên</option>
                                        <option>Đồng Nai</option>
                                        <option>Đồng Tháp</option>
                                        <option>Gia Lai</option>
                                        <option>Hà Giang</option>
                                        <option>Hà Nam</option>
                                        <option>Hà Nội</option>
                                        <option>Hà Tĩnh</option>
                                        <option>Hải Dương</option>
                                        <option>Hải Phòng</option>
                                        <option>Hậu Giang</option>
                                        <option>Hòa Bình</option>
                                        <option>Hưng Yên</option>
                                        <option>Khánh Hòa</option>
                                        <option>Kiên Giang</option>
                                        <option>Kon Tum</option>
                                        <option>Lai Châu</option>
                                        <option>Lâm Đồng</option>
                                        <option>Lạng Sơn</option>
                                        <option>Lào Cai</option>
                                        <option>Long An</option>
                                        <option>Nam Định</option>
                                        <option>Nghệ An</option>
                                        <option>Ninh Bình</option>
                                        <option>Ninh Thuận</option>
                                        <option>Phú Thọ</option>
                                        <option>Phú Yên</option>
                                        <option>Quảng Bình</option>
                                        <option>Quảng Nam</option>
                                        <option>Quảng Ngãi</option>
                                        <option>Quảng Ninh</option>
                                        <option>Quảng Trị</option>
                                        <option>Sóc Trăng</option>
                                        <option>Sơn La</option>
                                        <option>Tây Ninh</option>
                                        <option>Thái Bình</option>
                                        <option>Thái Nguyên</option>
                                        <option>Thanh Hóa</option>
                                        <option>Thừa Thiên Huế</option>
                                        <option>Tiền Giang</option>
                                        <option>TP Hồ Chí Minh</option>
                                        <option>Trà Vinh</option>
                                        <option>Tuyên Quang</option>
                                        <option>Vĩnh Long</option>
                                        <option>Vĩnh Phúc</option>
                                        <option>Yên Bái</option>
                                    </select>
                                </div>
                                <div class="filter-group">
                                    <label>Tình trạng</label>
                                    <select class="form-control" name="status">
                                        <option value="any">Tất cả</option>
                                        <option>Đã giao</option>
                                        <option>Đang vận chuyển</option>
                                        <option>Chờ xử lý</option>
                                        <option>Đã hủy</option>
                                    </select>
                                </div>
                                <span class="filter-icon"><i class="fa fa-filter"></i></span>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Khách hàng</th>
                                <th>Vị trí</th>
                                <th>Ngày đặt hàng</th>
                                <th>Tình trạng</th>
                                <th>Số tiền</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${listOrder}">
                                <tr>
                                    <td>${order.order_ID}</td>
                                    <td>${order.user.full_Name}</td>
                                    <td>${order.user.address}</td>
                                    <td>${order.order_date}</td>
                                    <td><span class="status text-success">&bull;</span>${order.order_status}</td>
                                    <td>${order.total_mount}</td>
                                    <td><a href="./Order?action=detail&idOrder=${order.order_ID}" class="view" title="Xem Chi Tiết" data-toggle="tooltip"><i class="material-icons">&#xE5C8;</i></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        $(document).ready(function() {
            function filterTable() {
                var name = $("input[name='name']").val().toLowerCase();
                var location = $("select[name='location']").val().toLowerCase();
                var status = $("select[name='status']").val().toLowerCase();

                $("table tbody tr").each(function() {
                    var row = $(this);
                    var rowName = row.find("td:eq(1)").text().toLowerCase();
                    var rowLocation = row.find("td:eq(2)").text().toLowerCase();
                    var rowStatus = row.find("td:eq(4)").text().toLowerCase();

                    if ((name === "" || rowName.includes(name)) &&
                        (location === "tất cả" || rowLocation.includes(location)) &&
                        (status === "any" || rowStatus.includes(status))) {
                        row.show();
                    } else {
                        row.hide();
                    }
                });
            }

            $("input[name='name'], select[name='location'], select[name='status']").on("input change", function() {
                filterTable();
            });
        });
    </script>
</html>
