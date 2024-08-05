<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Báo cáo người dùng</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
            display: flex;
        }
        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #2c3e50;
            color: #ecf0f1;
            display: flex;
            flex-direction: column;
            align-items: start;
            padding: 20px;
            position: fixed;
        }
        .sidebar h2 {
            margin-bottom: 30px;
            font-size: 1.5em;
        }
        .nav {
            list-style-type: none;
            padding: 0;
            width: 100%;
        }
        .nav-item {
            margin-bottom: 15px;
        }
        .nav-link {
            text-decoration: none;
            color: #ecf0f1;
            font-weight: bold;
            display: block;
            padding: 10px 20px;
            border-radius: 4px;
            transition: background 0.3s ease;
        }
        .nav-link:hover {
            background-color: #34495e;
        }
        .main-content {
            margin-left: 270px;
            padding: 20px;
            width: calc(100% - 270px);
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-size: 2.5em;
        }
        .card-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 30px;
        }
        .card {
            border-radius: 12px;
            padding: 20px;
            width: 220px;
            text-align: center;
            color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card.pink {
            background-color: #ff6b6b;
        }
        .card.blue {
            background-color: #4dabf7;
        }
        .card.purple {
            background-color: #c58cfa;
        }
        .card.violet {
            background-color: #b084cc;
        }
        .card h2 {
            margin: 0;
            font-size: 2em;
        }
        .card p {
            margin: 5px 0 0;
            font-size: 1.2em;
        }
        .card i {
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        .filter-form {
            text-align: center;
            margin-bottom: 30px;
        }
        canvas {
            display: block;
            margin: 0 auto;
        }
        .change-icon {
            font-size: 1.5em;
            margin-left: 10px;
        }
        .positive {
            color: green;
        }
        .negative {
            color: red;
        }
    </style>
</head>
<body>
    <div class="sidebar">
    <h2>Menu</h2>
    <ul class="nav">
        <li class="nav-item">
            <a class="nav-link" href="./HomePage">
                <i class="fa fa-home"></i> Trang chủ
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="report?action=registrationReport">
                <i class="fa fa-clipboard-list"></i> Báo cáo đăng kí
            </a>
        </li>
       
        <li class="nav-item">
              <a class="nav-link" href="reportProduct">
                <i class="fa fa-box"></i> Báo cáo sản phẩm
            </a>
        </li>
         
        <li class="nav-item">
              <a class="nav-link" href="salesReport">
                <i class="fa fa-box"></i> Báo cáo doanh thu và đơn hàng
            </a>
        </li>
    </ul>
</div>

    <div class="main-content">
        <h1>Báo cáo số người dùng đăng kí trong hệ thống</h1>
        <div class="card-container">
            <div class="card pink">
                <i class="fas fa-calendar-day"></i>
                
                <p>Đăng kí hôm nay</p>
                <h2>${requestScope.registrationsToday}</h2>
            </div>
            <div class="card blue">
                <i class="fas fa-calendar-week"></i>
                
                <p>Đăng kí tuần này</p>
                <h2>${requestScope.registrationsThisWeek}</h2>
            </div>
            <div class="card purple">
                <i class="fas fa-calendar-alt"></i>
                
                <p>Đăng kí tháng này</p>
                <h2>${requestScope.registrationsThisMonth}</h2>
            </div>
        </div>

        <canvas id="userRegistrationChart" width="600" height="400"></canvas>
    </div>

    <script>
        // Lấy dữ liệu từ JSTL và định dạng cho Chart.js
        const labels = [
            <c:forEach items="${registrationReport}" var="entry" varStatus="status">
                '${entry.key}'<c:if test="${!status.last}">,</c:if>
            </c:forEach>
        ];

        const data = {
            labels: labels,
            datasets: [{
                label: 'Đăng ký người dùng',
                data: [
                    <c:forEach items="${registrationReport}" var="entry" varStatus="status">
                        ${entry.value}<c:if test="${!status.last}">,</c:if>
                    </c:forEach>
                ],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 205, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(201, 203, 207, 0.2)'
                ],
                borderColor: [
                    'rgb(255, 99, 132)',
                    'rgb(255, 159, 64)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(54, 162, 235)',
                    'rgb(153, 102, 255)',
                    'rgb(201, 203, 207)'
                ],
                borderWidth: 1
            }]
        };

        const config = {
            type: 'bar',
            data: data,
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        };

        const ctx = document.getElementById('userRegistrationChart').getContext('2d');
        new Chart(ctx, config);
    </script>
</body>
</html>
