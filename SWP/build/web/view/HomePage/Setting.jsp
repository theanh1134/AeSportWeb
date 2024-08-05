<%-- 
    Document   : Setting

    Created on : Jul 15, 2024, 4:14:24 PM
    Author     : Hoàng Sơn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Setting</title>
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
    </head>


</head>
<body class="bg-dark  text-dark bg-opacity-25">

    <div class="row">
        <div class="col-2">
            <jsp:include page="../../admin/AdministratorPage.jsp"/>
        </div>
        <div class="col-10">
            <div class="container   mt-5  bg-body-tertiary">

                <h2>Logo Header:</h2>
                <img src="img/logo/${requestScope.logoh}" class="img-thumbnail  " alt=""   width="180"
                     height="150" >

                <button  type="submit" class="btn btn-outline-success   " data-bs-toggle="modal" data-bs-target="#addImg0">Sửa</button>
                <form method="post" action="Setting">
                    <div class="modal fade" id="addImg0" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Sửa Logo</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <input type="hidden" name="logo" value="logoh"/>
                                    <input type="file" name="img"/>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Dóng</button>
                                    <button type="submit" class="btn btn-primary">Sửa</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>



                <h2>Logo Footer</h2>
                <img src="img/logo/${requestScope.logof}" class="img-thumbnail  " alt=""   width="180"
                     height="150" >

                <button  type="submit" class="btn btn-outline-success   " data-bs-toggle="modal" data-bs-target="#addImg">Sửa</button>

                <form method="post" action="Setting">
                    <div class="modal fade" id="addImg" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Sửa Logo</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <input type="hidden" name="logo" value="logof"/>
                                    <input type="file" name="img"/>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Dóng</button>
                                    <button type="submit" class="btn btn-primary">Sửa</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>



                <div >

                    <div class="my-5 ">
                        <button  type="submit" class="btn btn-outline-success float-end  " data-bs-toggle="modal" data-bs-target="#addImg1">Thêm</button>

                        <form method="post" action="Setting">
                            <div class="modal fade" id="addImg1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Thêm ảnh</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <input type="hidden" name="type" value="add">
                                            <input type="hidden" name="slide1" value="slide1"/>
                                            <input type="file" name="img"/>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Dóng</button>
                                            <button type="submit" class="btn btn-primary">Thêm</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <h2>Slide 1:</h2>
                        <c:forEach items="${requestScope.slide1}" var="slide">
                            <form method="post" >
                                <img src="img/slide/${slide}" class="img-thumbnail w-75 " alt="">
                                <input type="hidden" name="type" value="delete"/>
                                <input type="hidden" name="slide1" value="${slide}"/>

                                <button  type="submit" class="btn btn-outline-danger  ">Xóa</button>
                            </form>
                        </c:forEach>

                    </div>


                    <div class="my-5 ">
                        <button  type="submit" class="btn btn-outline-success float-end  " data-bs-toggle="modal" data-bs-target="#addImg2">Thêm</button>

                        <form method="post" action="Setting">
                            <div class="modal fade" id="addImg2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Thêm ảnh</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <input type="hidden" name="type" value="add">
                                            <input type="hidden" name="slide2" value="slide2"/>
                                            <input type="file" name="img"/>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Dóng</button>
                                            <button type="submit" class="btn btn-primary">Thêm</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <h2>Slide 2:</h2>
                        <c:forEach items="${requestScope.slide2}" var="slide">
                            <form method="post" >
                                <img src="img/slide/${slide}" class="img-thumbnail w-75 " alt="">
                                <input type="hidden" name="type" value="delete"/>
                                <input type="hidden" name="slide2" value="${slide}"/>

                                <button  type="submit" class="btn btn-outline-danger  ">Xóa</button>
                            </form>
                        </c:forEach>

                    </div>



                    <div class="my-5 ">
                        <button  type="submit" class="btn btn-outline-success float-end  " data-bs-toggle="modal" data-bs-target="#addImg3">Thêm</button>

                        <form method="post" action="Setting">
                            <div class="modal fade" id="addImg3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Thêm ảnh</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <input type="hidden" name="type" value="add">
                                            <input type="hidden" name="slide3" value="slide3"/>
                                            <input type="file" name="img"/>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Dóng</button>
                                            <button type="submit" class="btn btn-primary">Thêm</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <h2>Slide 3:</h2>
                        <c:forEach items="${requestScope.slide3}" var="slide">
                            <form method="post" >
                                <img src="img/slide/${slide}" class="img-thumbnail w-75 " alt="">
                                <input type="hidden" name="type" value="delete"/>
                                <input type="hidden" name="slide3" value="${slide}"/>

                                <button  type="submit" class="btn btn-outline-danger  ">Xóa</button>
                            </form>
                        </c:forEach>

                    </div>


                    <div class="my-5 ">
                        <button  type="submit" class="btn btn-outline-success float-end  " data-bs-toggle="modal" data-bs-target="#addImg4">Thêm</button>

                        <form method="post" action="Setting">
                            <div class="modal fade" id="addImg4" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Thêm ảnh 4</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <input type="hidden" name="type" value="add">
                                            <input type="hidden" name="slide4" value="slide4"/>
                                            <input type="file" name="img"/>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Dóng</button>
                                            <button type="submit" class="btn btn-primary">Thêm</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <h2>Slide 4:</h2>
                        <c:forEach items="${requestScope.slide4}" var="slide">
                            <form method="post" >
                                <img src="img/slide/${slide}" class="img-thumbnail w-75 " alt="">
                                <input type="hidden" name="type" value="delete"/>
                                <input type="hidden" name="slide4" value="${slide}"/>

                                <button  type="submit" class="btn btn-outline-danger  ">Xóa</button>
                            </form>
                        </c:forEach>

                    </div>

                </div>

            </div>
        </div>
    </div>



</body>
</html>
