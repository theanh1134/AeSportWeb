<%-- 
    Document   : orderingguide
    Created on : Jul 17, 2024, 7:58:48 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Hướng dẫn đặt hàng</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
        <style>
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                margin: 0;
                padding: 0;
                overflow-x: hidden;
            }
            h1, h2, h3 {
                color: #333;
            }
            p, ul {
                margin-bottom: 20px;
            }
            ul {
                list-style: none;
                padding: 0;
            }
            ul li {
                margin-bottom: 10px;
            }
            .store-info {
                margin-bottom: 20px;
                margin-top: 30px;
            }
            .store-info h3 {
                margin-bottom: 10px;
            }
            .store-info ul {
                padding-left: 20px;
            }
            .breadcrumb-item .bi {
                vertical-align: -0.125em;
            }
            .content {
                margin-top:  300px;
            }
            .se {
                margin-top:  30px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="HomePage/header.jsp"/>

        <div class="container content">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <span><i class="bi bi-house-door mx-3"></i></span>
                        <a href="HomePage" class="text-decoration-none text-black">Home</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Hướng Dẫn Đặt Hàng</li>
                </ol>
            </nav>

            <h1>Hướng Dẫn Đặt Hàng</h1>

            <section class="se">