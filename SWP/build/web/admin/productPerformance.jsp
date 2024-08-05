<%-- 
    Document   : productPerformance
    Created on : Jul 27, 2024, 12:30:29 AM
    Author     : admin
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.OrderItem" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Báo Cáo Hiệu Suất Sản Phẩm</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
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
            .nav {
                list-style-type: none;
                padding: 0;
            }
            .nav-item {
                margin-bottom: 15px;
            }
            .nav-link {
                color: #ecf0f1;
                text-decoration: none;
                display: flex;
                align-items: center;
                padding: 10px;
                transition: background-color 0.3s;
                border-radius: 5px;
            }
            .nav-link i {
                margin-right: 10px;
            }
            .nav-link:hover {
                background-color: #34495e;
            }
            .main-content {
                margin-left: 100px;
                padding: 20px;
                width: calc(100% - 220px);
            }
            .info-boxes {
                display: flex;
                justify-content: space-around;
                margin-bottom: 20px;
            }
            .info-box {
                background-color: #3498db;
                color: #fff;
                text-align: center;
                padding: 20px;
                border-radius: 8px;
                flex: 1;
                margin: 0 10px;
            }
            .info-box.red {
                background-color: #e74c3c;
            }
            .info-box.blue {
                background-color: #2980b9;
            }
            .info-box.purple {
                background-color: #8e44ad;
            }
            .info-box i {
                font-size: 2em;
                margin-bottom: 10px;
            }
            h1, h2 {
                text-align: center;
                color: #333;
            }
            form {
                text-align: center;
                margin-bottom: 20px;
            }
            .container {
                display: flex;
                justify-content: space-between;
                margin-top: 40px;
                margin-bottom: 40px;
            }
            .table-container, .chart-container {
                width: 48%;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            canvas {
                width: 100%;
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
                    <div class="main-content">
                        <div class="info-boxes">

                            <div class="info-box purple">
                                <i class="fa fa-calendar-alt"></i>

                                <p>Sản phẩm bán chạy nhất tháng này</p>
                                <p>${topProductsTotal.productName}</p>
                            </div>
                            <div class="info-box">
                                <i class="fa fa-chart-line"></i>

                                <p>Sản phẩm doanh thu cao nhất tháng này</p>
                                <p>${requestScope.topRevenueProduct}</p>
                            </div>
                        </div>

                        <h1>Báo Cáo Hiệu Suất Sản Phẩm </h1>

                        <c:if test="${not empty topProductsByRevenue || not empty topProductsByQuantity}">
                            <!-- Container cho số lượng sản phẩm -->
                            <div class="container">
                                <div class="table-container">
                                    <h2>Sản Phẩm Theo Số Lượng</h2>
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Tên Sản Phẩm</th>
                                                <th>Số Lượng</th>
                                                <th>Ngày</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${topProductsByQuantity}">
                                                <tr>
                                                    <td><c:out value="${item.product.productName}" /></td>
                                                    <td><c:out value="${item.quantity}" /></td>
                                                    <td><fmt:formatDate value="${item.order.order_date}" pattern="dd/MM/yyyy" /></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="chart-container">
                                    <canvas id="quantityChart"></canvas>
                                </div>
                            </div>

                            <!-- Container cho doanh thu sản phẩm -->
                            <div class="container">
                                <div class="table-container">
                                    <h2>Sản Phẩm Theo Doanh Thu</h2>
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Tên Sản Phẩm</th>
                                                <th>Doanh Thu</th>
                                                <th>Ngày</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${topProductsByRevenue}">
                                                <tr>
                                                    <td><c:out value="${item.product.productName}" /></td>
                                                    <td><c:out value="${item.product.revenue}" /></td>
                                                    <td><fmt:formatDate value="${item.order.order_date}" pattern="dd/MM/yyyy" /></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="chart-container">
                                    <canvas id="revenueChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                // Dữ liệu cho biểu đồ số lượng
                var quantityData = [];
                var quantityLabels = [];
                var quantityColors = [];
                <c:forEach var="item" items="${topProductsByQuantity}">
                quantityLabels.push('<fmt:formatDate value="${item.order.order_date}" pattern="dd/MM/yyyy" />');
                quantityData.push(${item.quantity});
                quantityColors.push('rgba(' + (Math.floor(Math.random() * 255)) + ',' + (Math.floor(Math.random() * 255)) + ',' + (Math.floor(Math.random() * 255)) + ', 0.6)');
                </c:forEach>

                new Chart("quantityChart", {
                    type: "bar",
                    data: {
                        labels: quantityLabels,
                        datasets: [{
                                backgroundColor: quantityColors,
                                data: quantityData
                            }]
                    },
                    options: {
                        legend: {display: false},
                        title: {
                            display: true,
                            text: "Số Lượng Sản Phẩm",
                            fontSize: 16
                        },
                        scales: {
                            xAxes: [{
                                    ticks: {
                                        autoSkip: false
                                    }
                                }],
                            yAxes: [{
                                    ticks: {
                                        beginAtZero: true,
                                        stepSize: 1
                                    }
                                }]
                        }
                    }
                });

                // Dữ liệu cho biểu đồ doanh thu
                var revenueData = [];
                var revenueLabels = [];
                <c:forEach var="item" items="${topProductsByRevenue}">
                revenueLabels.push('<fmt:formatDate value="${item.order.order_date}" pattern="dd/MM/yyyy" />');
                revenueData.push(${item.product.revenue});
                </c:forEach>

                new Chart("revenueChart", {
                    type: "line",
                    data: {
                        labels: revenueLabels,
                        datasets: [{
                                fill: false,
                                lineTension: 0,
                                backgroundColor: "rgba(0,0,255,1.0)",
                                borderColor: "rgba(0,0,255,0.1)",
                                data: revenueData
                            }]
                    },
                    options: {
                        legend: {display: false},
                        title: {
                            display: true,
                            text: "Doanh Thu Sản Phẩm",
                            fontSize: 16
                        },
                        scales: {
                            yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                        }
                    }
                });
            </script>
        </c:if>
    </body>
</html>
