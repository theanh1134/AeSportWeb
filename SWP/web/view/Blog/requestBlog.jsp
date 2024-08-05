<%-- 
    Document   : requestBlog
    Created on : Jun 21, 2024, 11:18:19 AM
    Author     : Hoàng Sơn
--%>


<%@page import="entity.Blog"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.BlogContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Yêu Cầu</title>
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

            .rounded-table {
                border: 2px solid #000; /* Tạo viền ngoài cho bảng */
                border-radius: 15px;
                overflow: hidden;
            }
            .custom-alert {
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                padding: 30px;
                background-color: #f8d7da;
                color: #721c24;
                border-color: #f5c6cb;
                border-radius: 12px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
                max-width: 500px;
                width: 90%;
                text-align: center;
                margin-top: 100px;
            }

            .custom-alert .alert-icon {
                font-size: 3rem;
                margin-bottom: 20px;
            }



            .download-button {
                position: relative;
                border-width: 0;
                color: white;
                font-size: 15px;
                font-weight: 600;
                border-radius: 4px;
                z-index: 1;
            }

            .download-button{
                display: flex;
                align-items: center;
                gap: 10px;
                min-height: 40px;
                padding: 0 10px;
                border-radius: 4px;
                z-index: 1;
                background-color: #242a35;
                border: solid 1px #e8e8e82d;
                transition: all .5s cubic-bezier(0.77, 0, 0.175, 1);
            }

            .download-button:hover {
                box-shadow:  rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
            }





        </style>
        <script>
            function submit() {
                document.getElementsByClassName("form").submit();
            }
        </script>
    </head>

    <body class="bg-dark  text-dark bg-opacity-25">
        <div class="row">
            <div class="col-2">
                <jsp:include page="../../admin/AdministratorPage.jsp"/>
            </div>
            <div class="col-10">
                <div class="container mt-5 ">
                    <c:if test="${param.mode == '1'}">
                        <button class="download-button float-end mb-4" data-bs-toggle="modal" data-bs-target="#history" >
                            <div class="docs "><svg class="css-i6dzq1" stroke-linejoin="round" stroke-linecap="round" fill="none" stroke-width="2" stroke="currentColor" height="20" width="20" viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line y2="13" x2="8" y1="13" x1="16"></line><line y2="17" x2="8" y1="17" x1="16"></line><polyline points="10 9 9 9 8 9"></polyline></svg> Lịch Sử</div>
                        </button>
                        <div class="modal fade" id="history" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Yêu cầu Thêm</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <table class="table align-middle mb-0 bg-white">
                                            <thead class="bg-light">
                                                <tr>
                                                    <th>STT</th>
                                                    <th>Tiêu đề</th>
                                                    <th>Doanh Mục</th>
                                                    <th>Tác GIả</th>
                                                    <th>Ngày Đăng</th>
                                                    <th>Trạng Thái</th>
                                                    <th>Thời Gian</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <c:forEach items="${requestScope.requestHistoryAdd}" var="re" varStatus="status">
                                                    <tr>
                                                        <td>
                                                            ${status.index+1}
                                                        </td>
                                                        <td>
                                                            ${re.title}
                                                        </td>
                                                        <td>
                                                            ${re.ca.name}
                                                        </td>
                                                        <td>
                                                            ${re.authorString}
                                                        </td>
                                                        <td>
                                                            ${re.date}
                                                        </td>
                                                        <td>
                                                            ${re.statusBlog.status}
                                                        </td>
                                                        <td>
                                                            ${re.statusBlog.time}
                                                        </td>
                                                    </tr>

                                                </c:forEach>

                                            </tbody>
                                        </table>



                                    </div>
                                    <div class="modal-footer">

                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Đóng</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>



                    <c:if test="${ not empty requestScope.requestAdd}"  >

                        <h1 class=" my-5 ">Yêu cầu thêm tin tức</h1> 


                        <table class="table  table-hover table-dark  rounded-table shadow  ">
                            <thead class="table-dark align-middle">
                                <tr>
                                    <th class="p-4 text-center" >#</th>
                                    <th class="p-4 text-center" >Tiêu Đề</th>
                                    <th class="p-4 text-center">Ảnh</th>
                                    <th class="p-4 text-center">Doanh Mục</th>
                                    <th class="p-4 text-center" >Tác Giả</th>
                                    <th class="p-4 text-center" >Ngày Đăng</th>
                                    <th class="p-4 text-center" ></th>
                                </tr>
                            </thead>
                            <tbody class="table-group-divider table-divider-color">
                                <c:forEach items="${requestScope.requestAdd}" var="elem"  varStatus="status">
                                    <tr class="p-3 text-center ">
                                        <th class="p-2">${status.index +1}</th>

                                        <td class="text-start">${ elem.getTitle()}</td>
                                        <td> 
                                            <span  type="button"  data-bs-toggle="modal" data-bs-target="#firstModal${ elem.getBlog_ID()}">
                                                ${ elem.getImg()}
                                            </span>

                                        </td>
                                        <td> 
                                            <span>${ elem.getCa().getName()   }</span>
                                        </td>
                                        <td> 
                                            <span>${ elem.getAuthorString()}</span>

                                        </td>
                                        <td> 
                                            <span>${ elem.getDate()}</span>

                                        </td>


                                        <td class="text-start"  style="width: 4rem"> 
                                            <div class="btn-group" role="group" >

                                                <form  method="post" action="RequestsBlog">
                                                    <input type="hidden" name="accept"  value="${ elem.getBlog_ID()}">
                                                    <input type="hidden" name="type"  value="add">
                                                    <input type="hidden" name="mode"  value="1">


                                                    <button onclick="submit()"   class="btn btn-outline-primary">Duyệt</button>
                                                </form>
                                                <form   method="post" action="RequestsBlog">
                                                    <input type="hidden" name="type"  value="add">
                                                    <input type="hidden" name="reject" value="${ elem.getBlog_ID()}">
                                                    <input type="hidden" name="mode"  value="2">

                                                    <button onclick="submit()" class="btn btn-outline-danger">Xóa</button>
                                                </form>

                                            </div>
                                        </td>

                                    </tr>
                                <div class="img modal fade" id="firstModal${ elem.getBlog_ID()}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                <img src="img/blog/${ elem.getImg()}" class="img-fluid" alt="${ elem.getBlog_ID()}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            </tbody>
                        </table>



                    </c:if>






                    <c:if test="${param.mode == '2'}">
                        <button class="download-button float-end mb-4" data-bs-toggle="modal" data-bs-target="#history" >
                            <div class="docs "><svg class="css-i6dzq1" stroke-linejoin="round" stroke-linecap="round" fill="none" stroke-width="2" stroke="currentColor" height="20" width="20" viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line y2="13" x2="8" y1="13" x1="16"></line><line y2="17" x2="8" y1="17" x1="16"></line><polyline points="10 9 9 9 8 9"></polyline></svg> Lịch Sử</div>
                        </button>
                        <div class="modal fade" id="history" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Yêu cầu Xóa</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <table class="table align-middle mb-0 bg-white">
                                            <thead class="bg-light">
                                                <tr>
                                                    <th>STT</th>
                                                    <th>Tiêu đề</th>
                                                    <th>Doanh Mục</th>
                                                    <th>Tác GIả</th>
                                                    <th>Ngày Đăng</th>
                                                    <th>Trạng Thái</th>
                                                    <th>Thời Gian</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <c:forEach items="${requestScope.requestHistoryDelete}" var="re" varStatus="status">
                                                    <tr>
                                                        <td>
                                                            ${status.index+1}
                                                        </td>
                                                        <td>
                                                            ${re.title}
                                                        </td>
                                                        <td>
                                                            ${re.ca.name}
                                                        </td>
                                                        <td>
                                                            ${re.authorString}
                                                        </td>
                                                        <td>
                                                            ${re.date}
                                                        </td>
                                                        <td>
                                                            ${re.statusBlog.status}
                                                        </td>
                                                        <td>
                                                            ${re.statusBlog.time}
                                                        </td>
                                                    </tr>

                                                </c:forEach>

                                            </tbody>
                                        </table>



                                    </div>
                                    <div class="modal-footer">

                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Đóng</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>


                    <c:if test="${ not empty requestScope.requestDelete}"  >
                        <div class="modal fade" id="history" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-xl">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Yêu cầu Xóa</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <table class="table align-middle mb-0 bg-white">
                                            <thead class="bg-light">
                                                <tr>
                                                    <th>STT</th>
                                                    <th>Tiêu đề</th>
                                                    <th>Doanh Mục</th>
                                                    <th>Tác GIả</th>
                                                    <th>Ngày Đăng</th>
                                                    <th>Trạng Thái</th>
                                                    <th>Thời Gian</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <c:forEach items="${requestScope.requestHistoryDelete}" var="re" varStatus="status">
                                                    <tr>
                                                        <td>
                                                            ${status.index+1}
                                                        </td>
                                                        <td>
                                                            ${re.title}
                                                        </td>
                                                        <td>
                                                            ${re.ca.name}
                                                        </td>
                                                        <td>
                                                            ${re.authorString}
                                                        </td>
                                                        <td>
                                                            ${re.date}
                                                        </td>
                                                        <td>
                                                            ${re.statusBlog.status}
                                                        </td>
                                                        <td>
                                                            ${re.statusBlog.time}
                                                        </td>
                                                    </tr>

                                                </c:forEach>

                                            </tbody>
                                        </table>



                                    </div>
                                    <div class="modal-footer">

                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Đóng</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h1 class=" my-5 ">Yêu cầu xóa tin tức</h1> 

                        <table class="table  table-hover table-dark  rounded-table shadow ">
                            <thead class="table-dark align-middle">
                                <tr>
                                    <th class="p-4 text-center" >#</th>
                                    <th class="p-4 text-center" >Tiêu Đề</th>
                                    <th class="p-4 text-center">Ảnh</th>
                                    <th class="p-4 text-center">Doanh Mục</th>
                                    <th class="p-4 text-center" >Tác Giả</th>
                                    <th class="p-4 text-center" >Ngày Đăng</th>
                                    <th class="p-4 text-center" ></th>
                                </tr>
                            </thead>
                            <tbody class="table-group-divider table-divider-color">
                                <c:forEach items="${requestScope.requestDelete}" var="elem"  varStatus="status">
                                    <tr class="p-3 text-center ">
                                        <th class="p-2">${status.index +1}</th>

                                        <td class="text-start">${ elem.getTitle()}</td>
                                        <td> 
                                            <span  type="button"  data-bs-toggle="modal" data-bs-target="#firstModal${ elem.getBlog_ID()}">
                                                ${ elem.getImg()}
                                            </span>

                                        </td>
                                        <td> 
                                            <span>${ elem.getCa().getName()   }</span>
                                        </td>
                                        <td> 
                                            <span>${ elem.getAuthorString()}</span>

                                        </td>
                                        <td> 
                                            <span>${ elem.getDate()}</span>

                                        </td>


                                        <td class="text-start"  style="width: 4rem"> 
                                            <div class="btn-group" role="group" >
                                                <form  method="post" action="RequestsBlog">
                                                    <input type="hidden" name="type"  value="delete">
                                                    <input type="hidden" name="mode"  value="2">
                                                    <input type="hidden" name="accept"  value="${ elem.getBlog_ID()}">
                                                    <button onclick="submit()"   class="btn btn-outline-primary">Duyệt</button>
                                                </form>
                                                <form   method="post" action="RequestsBlog">
                                                    <input type="hidden" name="type"  value="delete">
                                                    <input type="hidden" name="mode"  value="2">

                                                    <input type="hidden" name="reject" value="${ elem.getBlog_ID()}">
                                                    <button onclick="submit()" class="btn btn-outline-danger">Xóa</button>
                                                </form>

                                            </div>
                                        </td>

                                    </tr>
                                <div class="img modal fade" id="firstModal${ elem.getBlog_ID()}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                <img src="img/blog/${ elem.getImg()}" class="img-fluid" alt="${ elem.getBlog_ID()}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>




                            </tbody>
                        </table>



                    </c:if>
                    <c:if test="${ empty requestScope.requestAdd &&   empty requestScope.requestDelete}"  >
                        <div class="custom-alert alert alert-danger" role="alert">
                            <div class="alert-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-exclamation-triangle" viewBox="0 0 16 16">
                                <path d="M8.854 1.303a1.145 1.145 0 0 1 1.292 0l5.579 3.719A1.145 1.145 0 0 1 16 6.822v6.356a1.145 1.145 0 0 1-.275.8l-5.579 3.72a1.145 1.145 0 0 1-1.292 0L2.275 14.978a1.145 1.145 0 0 1-.275-.8V6.822a1.145 1.145 0 0 1 .275-.8l5.579-3.719zM8.5 12a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1zm-1-4a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM8 2.196L4.854 5.303a.145.145 0 0 0-.042.103v6.356c0 .037.014.072.04.099l3.146 3.303a.145.145 0 0 0 .204 0l3.146-3.303a.145.145 0 0 0 .04-.099V5.406a.145.145 0 0 0-.042-.103L8 2.196z"/>
                                </svg>
                            </div>
                            <div>
                                <strong>Thông báo:</strong> Không có yêu cầu nào !
                            </div>
                        </div>
                    </c:if>

                </div>
            </div>
        </div>


        <script>


        </script>

    </body>
</html>
