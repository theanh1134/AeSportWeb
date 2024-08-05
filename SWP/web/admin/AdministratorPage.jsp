<!DOCTYPE html>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="data.BlogContext"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/tab.css">
        <style>
            .submenu {
                display: none;
                list-style-type: none;
                padding-left: 20px;
            }

            .menu-item.active .submenu {
                display: block;
            }

            .submenu-item {
                padding: 5px 0;
                width: 200px

            }

            ul{
                width: 100%

            }

            li{
                width: 150%
            }

            .menu-item {
                cursor: pointer;
            }
        </style>
        <%
     BlogContext blogDB = new BlogContext();
     int numberRequestAdd = blogDB.getNumberRequest("add");
     int numberRequestDelete = blogDB.getNumberRequest("delete");
        %>
    </head>
    <body>
        <div class="sidebar">
            <div id="logo">
                <a href="${pageContext.request.contextPath}/HomePage">
                    <i class="bi bi-house-fill" style="padding-right: 7px"></i>Home
                </a>
            </div>
            <div class="menu-item flex-column" onclick="toggleSubmenu(this)">
                <a><i class="bi bi-clipboard2-data-fill" style="padding-right: 7px"></i> Báo cáo</a>

                <ul style="" class="submenu">
                    <li class="submenu-item"><a style="width: 120%" href="${pageContext.request.contextPath}/report?action=registrationReport"><i class="bi bi-clipboard-pulse" style="padding-right: 7px"></i>Báo cáo đăng kí</a></li>
                    <li class="submenu-item"><a style="width: 120%" href="${pageContext.request.contextPath}/reportProduct"><i class="bi bi-archive-fill" style="padding-right: 7px" ></i>Báo cáo sản phẩm</a></li>
                    <li class="submenu-item"><a style="width: 120%" href="${pageContext.request.contextPath}/salesReport"><i class="bi bi-box-seam-fill" style="padding-right: 7px"></i>Doanh thu và đơn hàng</a></li>                
                </ul>
            </div>
            <div class="menu-item">
                <a href="${pageContext.request.contextPath}/manageruseraccount">
                    <i class="bi bi-person" style="padding-right: 7px"></i> Quản Lý Người Dùng
                </a>
            </div>
            <div class="menu-item">
                <a href="${pageContext.request.contextPath}/manageremployeeaccount">
                    <i class="bi bi-person-gear" style="padding-right: 7px"></i> Quản Lý Nhân Viên
                </a>
            </div>
            <div class="menu-item">
                <a href="${pageContext.request.contextPath}/managerrole">
                    <i class="bi bi-microsoft-teams" style="padding-right: 7px"></i> Quản Lý Role
                </a>
            </div>
            <div class="menu-item">
                <a href="${pageContext.request.contextPath}/managerfeature">
                    <i class="bi bi-arrow-left-right" style="padding-right: 7px"></i> Quản Lý Chức Năng
                </a>
            </div>
            <div class="menu-item flex-column" onclick="toggleSubmenu(this)">
                <a><i class="bi bi-envelope" style="padding-right: 7px"></i> Yêu Cầu Tin Tức</a>

                <ul style="" class="submenu">
                    <li class="submenu-item position-relative">
                        <a style="width: 120%" href="${pageContext.request.contextPath}/RequestsBlog?mode=1"><i class="bi bi-file-earmark-diff" style="padding-right: 7px"></i>Thêm</a>
                        <span
                            class=" position-absolute badge top-0 start-50  rounded bg-danger me-4  fs-7"
                            >
                            <%=numberRequestAdd %>
                        </span>

                    </li>
                    <li class="submenu-item position-relative"><a style="width: 120%" href="${pageContext.request.contextPath}/RequestsBlog?mode=2"><i class="bi bi-file-earmark-diff" style="padding-right: 7px" ></i>XÓa</a>
                        <span
                            class=" position-absolute  badge top-0 start-50 rounded bg-danger me-4  fs-7"
                            >
                            <%=numberRequestDelete %>
                        </span>

                    </li>
                </ul>
            </div>

            <div class="menu-item flex-column" onclick="toggleSubmenu(this)">
                <a><i class="bi bi-border-width" style="padding-right: 7px"></i> Sản Phẩm</a>

                <ul style="" class="submenu">
                    <li class="submenu-item"><a style="width: 120%" href="${pageContext.request.contextPath}/managerproduct"><i class="bi bi-bag-dash-fill" style="padding-right: 7px"></i>Danh Sách Sản Phẩm</a></li>
                    <li class="submenu-item"><a style="width: 120%" href="${pageContext.request.contextPath}/managerdiscount"><i class="bi bi-calendar2-event" style="padding-right: 7px" ></i>Danh Sách Sự Kiện</a></li>
                    <li class="submenu-item"><a style="width: 120%" href="${pageContext.request.contextPath}/managerbrand"><i class="bi bi-buildings" style="padding-right: 7px"></i>Danh Sách Thương Hiệu</a></li>
                    <li class="submenu-item"><a style="width: 120%" href="${pageContext.request.contextPath}/managersport"><i class="bi bi-cookie" style="padding-right: 7px" ></i>Môn Thể Thao</a></li>
                    <li class="submenu-item"><a style="width: 120%" href="${pageContext.request.contextPath}/managersize"><i class="bi bi-box2" style="padding-right: 7px" ></i>Kích Cỡ</a></li>
                    <li class="submenu-item"><a style="width: 120%" href="${pageContext.request.contextPath}/managercolor"><i class="bi bi-palette" style="padding-right: 7px" ></i>Màu Sắc</a></li>
                    <li class="submenu-item"><a style="width: 120%" href="${pageContext.request.contextPath}/managercategory"><i class="bi bi-journals" style="padding-right: 7px" ></i>Danh Sách Danh Mục</a></li>
                    <li class="submenu-item"><a style="width: 120%" href="${pageContext.request.contextPath}/managersubcategory"><i class="bi bi-journal" style="padding-right: 7px" ></i>Danh Sách Thể Loại</a></li>                 
                </ul>
            </div>

            <div class="menu-item">
                <a href="${pageContext.request.contextPath}/Setting">
                    <i class="bi bi-person-gear" style="padding-right: 7px"></i> Cài Đặt TRang chủ
                </a>    
            </div>

            <div class="menu-item">
                <a href="${pageContext.request.contextPath}/Order?action=list">
                    <i class="bi bi-boxes" style="padding-right: 7px"></i> Quản Lý Đơn Hàng
                </a>
            </div>
        </div>

        <script>
            function toggleSubmenu(element) {
                element.classList.toggle('active');
            }
        </script>

    </body>
</html>
