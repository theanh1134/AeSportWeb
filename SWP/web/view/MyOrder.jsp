<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Đơn Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }
        .container {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        .header {
            display: flex;
            align-items: center;
            padding: 10px 20px;
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .header img {
            height: 50px;
            width: auto;
            margin-right: 20px;
        }
        .table {
            margin-top: 20px;
        }
        .table thead th {
            background-color: #e3f2fd;
            color: #212529;
            text-align: center;
        }
        .table tbody td {
            text-align: center;
            vertical-align: middle;
        }
        .status-label {
            padding: 0.25em 0.6em;
            font-size: 75%;
            font-weight: 700;
            border-radius: 0.35em;
        }
        .Delivered { background-color: #28a745; color: white; }
        .Cancelled { background-color: #dc3545; color: white; }
        .Shipping { background-color: #ffc107; color: black; }
        .filter-bar {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        .page-navigation {
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>
    <div class="header">
        <img src="img/logo/trang.png" alt="Logo Công Ty">
        <h1>Danh Sách Đơn Hàng</h1>
    </div>
    <div class="container">
        <div class="filter-bar">
            <input type="text" class="form-control" placeholder="Tìm kiếm theo ID Đơn Hàng..." onkeyup="searchOrders(this.value)">
            <select class="custom-select" id="statusFilter" onchange="filterStatus()">
                <option value="">Tất Cả Trạng Thái</option>
                <option value="Delivered">Đã Giao</option>
                <option value="Cancelled">Đã Hủy</option>
                <option value="Shipping">Đang Giao</option>
            </select>
        </div>
        <table class="table table-hover" id="ordersTable">
            <thead>
                <tr>
                    <th>ID Đơn Hàng</th>
                    <th>Số Tiền</th>
                    <th>Ngày</th>
                    <th>Trạng Thái</th>
                    <th>Chi Tiết</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr class="${order.order_status}">
                        <td><i class="fas fa-box"></i> ${order.order_ID}</td>
                        <td>${order.total_mount}VND</td>
                        <td>${order.order_date}</td>
                        <td><span class="status-label ${order.order_status}">${order.order_status}</span></td>
                        <td><a href="./Order?action=information&idOrder=${order.order_ID}" class="btn btn-info">Xem Chi Tiết</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>      
    </div>

    <script>
        function searchOrders(value) {
            let filter = value.toUpperCase();
            let table = document.getElementById("ordersTable");
            let tr = table.getElementsByTagName("tr");

            for (let i = 1; i < tr.length; i++) {
                let td = tr[i].getElementsByTagName("td")[0]; // Get the Order ID cell
                if (td) {
                    let txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }

        function filterStatus() {
            let selectedStatus = document.getElementById("statusFilter").value;
            let table = document.getElementById("ordersTable");
            let tr = table.getElementsByTagName("tr");

            for (let i = 1; i < tr.length; i++) {
                let td = tr[i].getElementsByTagName("td")[3]; // Status is the 4th column
                if (td) {
                    let status = td.textContent.trim() || td.innerText.trim();
                    if (status === selectedStatus || selectedStatus === "") {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
