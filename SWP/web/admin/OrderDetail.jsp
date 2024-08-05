<%-- 
    Document   : OrderDetail
    Created on : Jul 27, 2024, 12:51:54 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Chi Tiết Đơn Hàng</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
                font-family: 'Roboto', sans-serif;
                background-color: #f8f9fa;
                color: #343a40;
            }
            .progress-bar {
                width: 0;
            }
            .order-status {
                display: flex;
                justify-content: space-between;
                margin-bottom: 20px;
                font-weight: bold;
            }
            .order-summary, .payment-details {
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                margin-top: 20px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .card {
                margin-top: 20px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .table thead th {
                background-color: #e9ecef;
            }
            .table img {
                margin-right: 10px;
                border-radius: 5px;
            }
            .logo {
                text-align: left;
                margin: 20px 0;
            }
            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }
            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #004085;
            }
            .badge-success {
                background-color: #28a745;
            }
            .dropdown-menu {
                display: none;
                position: absolute;
                background-color: white;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                border-radius: 5px;
                right: 0;
                top: 100%;
                z-index: 1000;
            }
            .dropdown-menu a {
                display: block;
                padding: 10px 20px;
                text-decoration: none;
                color: #343a40;
            }
            .dropdown-menu a:hover {
                background-color: #f8f9fa;
            }
            .dropdown:hover .dropdown-menu {
                display: block;
            }
        </style>
    </head>
    <body>
        <div class="row">
            <div class="col-2 border-4 border-black" style="padding-right: 0px;" >
                <jsp:include page="AdministratorPage.jsp"/>
            </div>

            <div class="col-10" style="background: #e2e7e8">
                <jsp:include page="HeaderAdmin.jsp"/>
                <div style="margin: 30px; background: white;padding: 20px;border-radius: 10px">
                    <div class="container">
                        
                        <h2 class="mt-3 text-center">Chi Tiết Đơn Hàng</h2>
                        <div class="progress mb-4">
                            <div class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar"></div>
                        </div>
                        <div class="order-status">
                            <span>Đơn Hàng Đã Đặt</span>
                            <span>Đã Đóng Gói</span>
                            <span>Đang Vận Chuyển</span>
                            <span>Đã Giao</span>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Mã Đơn Hàng: <c:out value="${order.order_ID}"/></h5>
                                <p class="card-text">Ngày Đặt Hàng: <c:out value="${order.order_date}"/> <span class="badge badge-success">Đã Thanh Toán</span></p>
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Sản Phẩm</th>
                                            <th>Số Lượng</th>
                                            <th>Tình Trạng</th>
                                            <th>Giá</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="item" items="${items}">
                                            <tr>
                                                <td>
                                                    <img src="img/product/${item.product.img.imgUrl}" alt="${item.product.productName}" width="50">
                                                    <c:out value="${item.product.productName}"/>
                                                </td>
                                                <td><c:out value="${item.quantity}"/></td>
                                                <td><span id="currentStatus"><c:out value="${order.order_status}"/></span></td>
                                                <td><c:out value="${item.price_unit}"/>VND</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <form id="updateStatusForm" class="mt-4">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" name="orderId" value="<c:out value='${order.order_ID}'/>">
                                    <div class="form-group">
                                        <label for="status">Cập Nhật Tình Trạng Đơn Hàng:</label>
                                        <select class="form-control" id="status" name="status">
                                            <option value="Đơn Hàng Đã Đặt">Đơn Hàng Đã Đặt</option>
                                            <option value="Đã Đóng Gói">Đã Đóng Gói</option>
                                            <option value="Đang Vận Chuyển">Đang Vận Chuyển</option>
                                            <option value="Đã Giao">Đã Giao</option>
                                        </select>
                                    </div>
                                    <button type="button" class="btn btn-primary" onclick="updateStatus()">Cập Nhật Tình Trạng</button>
                                </form>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="order-summary">
                                    <h5>Tóm Tắt Đơn Hàng</h5>
                                    <p>Thành Tiền: <span class="float-right"><c:out value="${order.total_mount}"/>VND</span></p>
                                    <p>Phí Vận Chuyển: <span class="float-right"><c:out value="${order.ship.ship_cost}"/>VND</span></p>
                                    <p><strong>Tổng Số Tiền:</strong> <span class="float-right"><c:out value="${order.total_mount}"/>VND</span></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="payment-details">
                                    <h5>Thông Tin Thanh Toán</h5>
                                    <p>Phương Thức Thanh Toán: <span class="float-right">Thẻ Tín Dụng</span></p>
                                    <p><strong>Tổng Số Tiền:</strong> <span class="float-right"><c:out value="${order.total_mount}"/>VND</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    // Update progress bar based on order status
                    var orderStatus = document.getElementById("currentStatus").innerText.trim();
                    updateProgressBar(orderStatus);

                    // Dropdown menu toggle
                    document.getElementById("dropdownMenuButton").addEventListener("click", function () {
                        var dropdownMenu = this.nextElementSibling;
                        dropdownMenu.style.display = dropdownMenu.style.display === "block" ? "none" : "block";
                    });

                    window.addEventListener("click", function (event) {
                        var dropdown = document.querySelector(".dropdown");
                        if (!dropdown.contains(event.target)) {
                            var dropdownMenu = dropdown.querySelector(".dropdown-menu");
                            dropdownMenu.style.display = "none";
                        }
                    });
                });

                function updateStatus() {
                    var form = document.getElementById("updateStatusForm");
                    var formData = new FormData(form);

                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "./Order?action=update", true);
                    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                    xhr.onload = function () {
                        if (xhr.status === 200) {
                            var selectedStatus = document.getElementById("status").value;
                            document.getElementById("currentStatus").innerText = selectedStatus;
                            updateProgressBar(selectedStatus);
                        }
                    };

                    xhr.onerror = function () {
                        alert("Không thể cập nhật tình trạng đơn hàng.");
                    };

                    xhr.send(new URLSearchParams(formData));
                }

                function updateProgressBar(status) {
                    var progressBar = document.querySelector(".progress-bar");
                    var statusWidth = {
                        "Đơn Hàng Đã Đặt": "25%",
                        "Đã Đóng Gói": "50%",
                        "Đang Vận Chuyển": "75%",
                        "Đã Giao": "100%"
                    };

                    progressBar.style.width = statusWidth[status] || "0%";
                }
            </script>
    </body>
</html>
