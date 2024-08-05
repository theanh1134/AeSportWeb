<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            display: flex;
            flex-direction: column;
        }
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
        <div class="col-2 border-4 border-black" style="padding-right: 0px;">
            <jsp:include page="AdministratorPage.jsp"/>
        </div>

        <div class="col-10" style="background: #e2e7e8">
            <jsp:include page="HeaderAdmin.jsp"/>
            <div style="margin: 30px; background: white; padding: 20px; border-radius: 10px">

                <div class="main-content">
                    <div class="info-boxes">
                        <div class="info-box red">
                            <i class="fa fa-calendar-day"></i>
                            <p>Tổng doanh thu trong tháng này</p>
                            <h2>${requestScope.SumRevenueThisMonth}</h2>
                        </div>
                        <div class="info-box blue">
                            <i class="fa fa-calendar-week"></i>
                            <p>Tổng số đơn hàng trong tháng này</p>
                            <h2>${requestScope.SumOrderThisMonth}</h2>
                        </div>
                    </div>
                    <div class="main-content">
                        <h1>Báo cáo doanh thu và đơn hàng</h1>
                        <h2>Doanh thu theo ngày trong tháng này</h2>
                        <div class="container">
                            <div class="table-container">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Ngày</th>
                                            <th>Doanh thu</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="entry" items="${revenueByDayThisMonth}">
                                            <tr>
                                                <td><c:out value="${entry.key}" /></td>
                                                <td><c:out value="${entry.value}" /></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="chart-container">
                                <canvas id="revenueByDayChart"></canvas>
                            </div>
                        </div>

                        <h2>Số lượng đơn hàng theo ngày trong tháng này</h2>
                        <div class="container">
                            <div class="table-container">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Ngày</th>
                                            <th>Số lượng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="order" items="${ordersByDay}">
                                            <tr>
                                                <td><c:out value="${order.order_date}"/></td>
                                                <td><c:out value="${order.orderCount}"/></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="chart-container">
                                <canvas id="orderCountChart"></canvas>
                            </div>
                        </div>

                        <h2>Trạng thái đơn hàng trong tháng này</h2>
                        <div class="container">
                            <div class="table-container">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Trạng thái</th>
                                            <th>Số lượng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="entry" items="${ordersCountByStatus}">
                                            <tr>
                                                <td><c:out value="${entry.key}"/></td>
                                                <td><c:out value="${entry.value}"/></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="chart-container">
                                <canvas id="orderStatusChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        // Dữ liệu cho biểu đồ doanh thu theo ngày
        var revenueXValues = [];
        var revenueYValues = [];
        <c:forEach var="entry" items="${revenueByDayThisMonth}">
        revenueXValues.push("${entry.key}"); // Ngày
        revenueYValues.push(${entry.value}); // Doanh thu
        </c:forEach>

        new Chart(document.getElementById("revenueByDayChart"), {
            type: "line",
            data: {
                labels: revenueXValues,
                datasets: [{
                        label: "Doanh thu",
                        backgroundColor: "rgba(0,0,255,0.1)",
                        borderColor: "rgba(0,0,255,1)",
                        data: revenueYValues
                    }]
            },
            options: {
                title: {
                    display: true,
                    text: "Doanh thu theo ngày"
                },
                scales: {
                    x: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Dữ liệu cho biểu đồ số lượng đơn hàng theo ngày
        var orderXValues = [];
        var orderYValues = [];
        <c:forEach var="order" items="${ordersByDay}">
        orderXValues.push("${order.order_date}"); // Ngày
        orderYValues.push(${order.orderCount}); // Số lượng đơn hàng
        </c:forEach>

        new Chart(document.getElementById("orderCountChart"), {
            type: "pie",
            data: {
                labels: orderXValues,
                datasets: [{
                        label: "Số lượng đơn hàng",
                        backgroundColor: ["#ff6384", "#36a2eb", "#cc65fe", "#ffce56", "#4bc0c0"],

                        data: orderYValues
                    }]
            },
            options: {
                title: {
                    display: true,
                    text: "Số lượng đơn hàng theo ngày"
                },
                scales: {
                    x: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Dữ liệu cho biểu đồ trạng thái đơn hàng
        var statusLabels = [];
        var statusData = [];
        <c:forEach var="entry" items="${ordersCountByStatus}">
        statusLabels.push("${entry.key}"); // Trạng thái
        statusData.push(${entry.value}); // Số lượng
        </c:forEach>

        new Chart(document.getElementById("orderStatusChart"), {
            type: "pie",
            data: {
                labels: statusLabels,
                datasets: [{
                        backgroundColor: ["#ff6384", "#36a2eb", "#cc65fe", "#ffce56", "#4bc0c0"],
                        data: statusData
                    }]
            },
            options: {
                title: {
                    display: true,
                    text: "Trạng thái đơn hàng"
                }
            }
        });
    </script>                      
</body>
</html>
