<%-- 
    Document   : BlogDetail
    Created on : Jul 20, 2024, 10:20:49 AM
    Author     : Hoàng Sơn
--%>
<%@page import="entity.Blog"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
           Blog blog = (Blog) request.getAttribute("blog");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=blog.getTitle()%></title>
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
    <body>

        <jsp:include page="../HomePage/header.jsp"/>
        <header class=" m-200 py-5 bg-light border-bottom mb-4">

            <div class="text-center my-3">
                <h1 class="fw-bolder">Tin Tức</h1>
            </div>

        </header>
        <div class="container mb-4">
            <div class="row">
                <nav aria-label="breadcrumb " >
                    <ol class="breadcrumb ms-5  mt-5">
                        <li class="breadcrumb-item"><span><i class="bi bi-house-door mx-3"></i></span><a href="HomePage" class="text-decoration-none text-black">Home</a></li>
                        <li class="breadcrumb-item"><a href="BlogList?page=1" class="text-decoration-none text-black">Tin Tức</a></li>
                        <li class="breadcrumb-item active" aria-current="page"><%=blog.getTitle()%></li>
                    </ol>
                </nav>
                <div class="row">
                    <div class="col-lg-8 my-5">
                        <h2 class=" "><%=blog.getTitle()%></h2>
                        <div class="d-flex  my-5 flex-column">
                            <h6 class=" fst-italic text-body-secondary">Ngày đăng: <%=blog.getDate()%></h6>
                            <h6 class="  fst-italic text-body-secondary">Tác giả: <%=blog.getAuthorString()%></h6>
                        </div>


                        <img
                            src="img/blog/<%=blog.getImg()%>"
                            class="rounded mx-auto d-block my-5 img-fluid"
                            alt="..."
                            />
                        <div class="ms-5"><%= blog.getDetail()%></div>
                    </div>
                    <div class="col-lg-4  px-5">
                        <div class="card mb-4 ">
                            <div class="card-header">Doanh Mục</div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <ul class="list-unstyled mb-0">
                                            <li><a href="BlogList?categoryBlog=1" class="text-decoration-none">Thể Thao</a></li>
                                            <li><a href="BlogList?categoryBlog=3" class="text-decoration-none">Sức Khỏe</a></li>
                                            <li><a href="BlogList?categoryBlog=2" class="text-decoration-none">Thời Trang</a></li>
                                        </ul>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>



            </div></div>


    </body>
</html>
