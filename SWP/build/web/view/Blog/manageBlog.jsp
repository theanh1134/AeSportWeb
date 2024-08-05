<%-- 
    Document   : addBlog
    Created on : Jun 2, 2024, 6:24:29 PM
    Author     : Hoàng Sơn
--%>

<%@page import="entity.CategoryBlog"%>
<%@page import="entity.Blog"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.BlogContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lí Tin Tức</title>
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
        <script src="https://cdn.ckeditor.com/ckeditor5/41.4.2/super-build/ckeditor.js"></script>


        <%
            BlogContext blogDB = new BlogContext();
            ArrayList<entity.Blog> listBlog = blogDB.getBlogs();
                            System.out.println(listBlog);
            Blog mainBlog = blogDB.getMainBlog();
            ArrayList<CategoryBlog> listCate = blogDB.getCategorysBlog();
        %>
        <style>
            .ck-editor__editable[role="textbox"] {
                min-height: 300px;
            }
            .ck-content .image {

                max-width: 80%;
                margin: 20px auto;
            }

            .rounded-table {
                border-radius: 15px;
                overflow: hidden;
            }
            .fs-0{
                font-size: 6rem !important;
            }
        </style>
    </head>

    <body class="bg-black">
        <div class="row">
            <div class="col-1">
                <jsp:include page="../Homestaff/SideBar.jsp"/>
            </div>
            <div class="col-11">
                <div class="container   mt-5 ">
                    <h1 class="text-light my-4">Quản lí Tin Tức</h1>
                    <table class="table  table-hover table-dark  rounded-table ">
                        <thead class="table-dark align-middle">
                            <tr>
                                <th class="p-4 text-center" >#</th>
                                <th class="p-4 text-center" >Tiêu Đề</th>
                                <th class="p-4 text-center">Ảnh</th>
                                <th class="p-4 text-center">Doanh Mục</th>
                                <th class="p-4 text-center" >Tác Giả</th>
                                <th class="p-4 text-center" >Ngày Đăng</th>
                                <th class="p-4 text-center" >Lượt Xem</th>
                                <th class="p-4 text-center" >Chi Tiết</th>
                                <th class="p-4 text-center" ></th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider table-divider-color">
                            <%  int idx = 0;
                                for (Blog elem : listBlog) {
                                    idx++;
                            %>
                            <tr class="p-3 text-center ">
                                <th class="p-2"><%=idx%></th>
                                <td class="text-start"><%= elem.getTitle()%></td>
                                <td> 
                                    <span  type="button"  data-bs-toggle="modal" data-bs-target="#firstModal<%= elem.getBlog_ID()%>">
                                        <%= elem.getImg()%>
                                    </span>

                                </td>
                                <td> 
                                    <span><%= elem.getCa().getName()%></span>

                                </td>


                                <td> 
                                    <span><%= elem.getAuthorString()%></span>

                                </td>

                                <td> 
                                    <span><%= elem.getDate()%></span>
                                </td>

                                <td> 
                                    <span><%= elem.getNumber_of_views()%></span>
                                </td>
                                <td style="width:8rem">
                                    <a   target="_blank" href="BlogList?blogID=<%= elem.getBlog_ID()%>"><i class="bi bi-arrow-right-circle-fill fs-3"></i></a>
                                </td>
                                <td class="text-start"  style="width: 4rem"> 
                                    <div class="btn-group" role="group" >
                                        <a data-bs-toggle="modal" data-bs-target="#thirdModal<%= elem.getBlog_ID()%>"  class="btn btn-outline-success">Sửa</a>
                                        <a data-bs-toggle="modal" data-bs-target="#staticBackdrop<%= elem.getBlog_ID()%>" class="btn btn-outline-danger">Xóa</a>
                                        <% if (elem.getBlog_ID() != mainBlog.getBlog_ID()) {%>
                                        <a   href="managerBlog?mode=3&bID=<%= elem.getBlog_ID()%>" class="btn btn-outline-warning  border-start-0"  ><i class="bi bi-layer-forward"></i></a>
                                            <%}%>

                                    </div>
                                </td>

                            </tr>
                        <div class="update modal fade " id="thirdModal<%= elem.getBlog_ID()%>" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered fixed-width " >
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel1">Update Blog</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form  action="managerBlog" method="post" >
                                            <input type="hidden" name="mode" value="1">
                                            <input type="hidden" name="Blog_ID" value="<%=elem.getBlog_ID()%>">

                                            <div class="form-group">
                                                <label for="title">Tiêu Đề</label>
                                                <input type="text" value="<%= elem.getTitle()%>" class="form-control" id="title" name="title" placeholder="Enter title" required>
                                            </div>

                                            <div class="form-group my-3">
                                                <div>
                                                    <img src="img/blog/<%=elem.getImg()%>" class="img-thumbnail w-25" alt="<%= elem.getBlog_ID()%>">
                                                </div>
                                                <label for="formFile" class="form-label">Ảnh:</label>
                                                <input class="form-control" type="file" name="image" value="<%=elem.getImg()%>" id="formFile">
                                                <input type="hidden" name="img_temp" value="<%=elem.getImg()%>">

                                            </div>
                                            <div class="form-group my-4">
                                                <label for="categoryBlogupdate" class="form-label me-2">Thể Loại:</label>
                                                <select  class="selectpicker p-1 rounded" id="categoryBlogupdate" name="cate" required>
                                                    <option value="" disabled selected>Chọn danh mục</option>
                                                    <% for (CategoryBlog i : listCate) {%>
                                                    <option value="<%=i.getId()%>"  <%= i.getId() == elem.getCa().getId() ? "selected" : "" %>><%=i.getName()%></option>
                                                    <%}%>


                                                </select>

                                            </div>

                                            <div class="form-group my-3">
                                                <label class="my-2" for="editor<%=elem.getBlog_ID()%>">Nội Dung:</label>
                                                <textarea id="editor<%=elem.getBlog_ID()%>" name="content" cols="30" rows="10" > <%= elem.getDetail()%></textarea>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                <button   type="submit" class="btn btn-primary">Lưu</button>

                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div> 

                        <div class="delete modal fade" id="staticBackdrop<%=elem.getBlog_ID()%>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Xóa Tin Tức </h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Bạn có muốn xóa tin tức <span class="text-danger"><%= elem.getTitle()%></span> không!</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                                        <a type="button" class="btn btn-primary"  href="managerBlog?mode=2&bID=<%= elem.getBlog_ID()%>">Có!</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="img modal fade" id="firstModal<%= elem.getBlog_ID()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-body">
                                        <img src="img/blog/<%=elem.getImg()%>" class="img-fluid" alt="<%= elem.getBlog_ID()%>">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}
                        %>
                        </tbody>
                    </table>


                    <a type="button"  class="float-end text-light fs-0"  data-bs-toggle="modal" data-bs-target="#secondModal">
                        <span class=""><i class="bi bi-plus-circle-fill"></i></span>
                    </a>

                    <div class="modal fade  " id="secondModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered fixed-width modal-xl " >
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Thêm Bài Báo</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form  action="managerBlog" method="post"   >
                                        <input type="hidden" name="mode" value="2">
                                        <div class="form-group">
                                            <label for="title">Tiêu Đề</label>
                                            <input type="text" class="form-control" id="title" name="title" placeholder="Enter title" required>
                                        </div>
                                        <div class="form-group my-3">
                                            <label for="formFile1" class="form-label">Ảnh:</label>
                                            <input class="form-control" type="file" name="image" id="formFile1" required multiple>
                                        </div>
                                        <div class="form-group my-4">
                                            <label for="categoryBlog" class="form-label me-2">Thể Loại:</label>
                                            <select class="selectpicker p-1 rounded" id="categoryBlog" name="cate" required>
                                                <option value="" disabled selected>Chọn danh mục</option>
                                                <% for (CategoryBlog i : listCate) {%>
                                                <option value="<%=i.getId()%>"><%=i.getName()%></option>
                                                <%}%>

                                            </select>
                                        </div>
                                        <div class="form-group my-3">
                                            <label class="my-2" for="editor">Nội Dung:</label>
                                            <textarea id="editor" name="content" cols="30" rows="10"  ></textarea>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                            <button   type="submit" class="btn btn-primary">Thêm</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            <%
                for (Blog e : listBlog) {%>
            CKEDITOR.ClassicEditor.create(document.querySelector('#editor<%=e.getBlog_ID()%>'), {
                toolbar: {
                    items: [
                        'exportPDF', 'exportWord', '|',
                        'findAndReplace', 'selectAll', '|',
                        'heading', '|',
                        'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
                        'bulletedList', 'numberedList', 'todoList', '|',
                        'outdent', 'indent', '|',
                        'undo', 'redo',
                        '-',
                        'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
                        'alignment', '|',
                        'link', 'uploadImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
                        'specialCharacters', 'horizontalLine', 'pageBreak', '|',
                        'textPartLanguage', '|',
                        'sourceEditing'
                    ],
                    shouldNotGroupWhenFull: true
                },
                placeholder: 'Nội dung....',
                fontFamily: {
                    options: [
                        'default',
                        'Arial, Helvetica, sans-serif',
                        'Courier New, Courier, monospace',
                        'Georgia, serif',
                        'Lucida Sans Unicode, Lucida Grande, sans-serif',
                        'Tahoma, Geneva, sans-serif',
                        'Times New Roman, Times, serif',
                        'Trebuchet MS, Helvetica, sans-serif',
                        'Verdana, Geneva, sans-serif'
                    ],
                    supportAllValues: true
                },
                fontSize: {
                    options: [10, 12, 14, 'default', 18, 20, 22],
                    supportAllValues: true
                },
                htmlSupport: {
                    allow: [
                        {
                            name: /.*/,
                            attributes: true,
                            classes: true,
                            styles: true
                        }
                    ]
                },
                htmlEmbed: {
                    showPreviews: true
                },
                link: {
                    decorators: {
                        addTargetToExternalLinks: true,
                        defaultProtocol: 'https://',
                        toggleDownloadable: {
                            mode: 'manual',
                            label: 'Downloadable',
                            attributes: {
                                download: 'file'
                            }
                        }
                    }
                },
                mention: {
                    feeds: [
                        {
                            marker: '@',
                            feed: [
                                '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
                                '@cupcake', '@danish', '@donut', '@dragée', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
                                '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@soufflé',
                                '@sugar', '@sweet', '@topping', '@wafer'
                            ],
                            minimumCharacters: 1
                        }
                    ]
                },
                removePlugins: [
                    'AIAssistant',
                    'CKBox',
                    'CKFinder',
                    'EasyImage',
                    'Base64UploadAdapter',
                    'MultiLevelList',
                    'RealTimeCollaborativeComments',
                    'RealTimeCollaborativeTrackChanges',
                    'RealTimeCollaborativeRevisionHistory',
                    'PresenceList',
                    'Comments',
                    'TrackChanges',
                    'TrackChangesData',
                    'RevisionHistory',
                    'Pagination',
                    'WProofreader',
                    'MathType',
                    'SlashCommand',
                    'Template',
                    'DocumentOutline',
                    'FormatPainter',
                    'TableOfContents',
                    'PasteFromOfficeEnhanced',
                    'CaseChange'
                ]
            });
            <%}
            %>
            CKEDITOR.ClassicEditor.create(document.querySelector('#editor'), {
                toolbar: {
                    items: [
                        'exportPDF', 'exportWord', '|',
                        'findAndReplace', 'selectAll', '|',
                        'heading', '|',
                        'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
                        'bulletedList', 'numberedList', 'todoList', '|',
                        'outdent', 'indent', '|',
                        'undo', 'redo',
                        '-',
                        'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
                        'alignment', '|',
                        'link', 'uploadImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
                        'specialCharacters', 'horizontalLine', 'pageBreak', '|',
                        'textPartLanguage', '|',
                        'sourceEditing'
                    ],
                    shouldNotGroupWhenFull: true
                },
                placeholder: 'Nội dung....',
                fontFamily: {
                    options: [
                        'default',
                        'Arial, Helvetica, sans-serif',
                        'Courier New, Courier, monospace',
                        'Georgia, serif',
                        'Lucida Sans Unicode, Lucida Grande, sans-serif',
                        'Tahoma, Geneva, sans-serif',
                        'Times New Roman, Times, serif',
                        'Trebuchet MS, Helvetica, sans-serif',
                        'Verdana, Geneva, sans-serif'
                    ],
                    supportAllValues: true
                },
                fontSize: {
                    options: [10, 12, 14, 'default', 18, 20, 22],
                    supportAllValues: true
                },
                htmlSupport: {
                    allow: [
                        {
                            name: /.*/,
                            attributes: true,
                            classes: true,
                            styles: true
                        }
                    ]
                },
                htmlEmbed: {
                    showPreviews: true
                },
                link: {
                    decorators: {
                        addTargetToExternalLinks: true,
                        defaultProtocol: 'https://',
                        toggleDownloadable: {
                            mode: 'manual',
                            label: 'Downloadable',
                            attributes: {
                                download: 'file'
                            }
                        }
                    }
                },
                mention: {
                    feeds: [
                        {
                            marker: '@',
                            feed: [
                                '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
                                '@cupcake', '@danish', '@donut', '@dragée', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
                                '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@soufflé',
                                '@sugar', '@sweet', '@topping', '@wafer'
                            ],
                            minimumCharacters: 1
                        }
                    ]
                },
                removePlugins: [
                    'AIAssistant',
                    'CKBox',
                    'CKFinder',
                    'EasyImage',
                    'Base64UploadAdapter',
                    'MultiLevelList',
                    'RealTimeCollaborativeComments',
                    'RealTimeCollaborativeTrackChanges',
                    'RealTimeCollaborativeRevisionHistory',
                    'PresenceList',
                    'Comments',
                    'TrackChanges',
                    'TrackChangesData',
                    'RevisionHistory',
                    'Pagination',
                    'WProofreader',
                    'MathType',
                    'SlashCommand',
                    'Template',
                    'DocumentOutline',
                    'FormatPainter',
                    'TableOfContents',
                    'PasteFromOfficeEnhanced',
                    'CaseChange'
                ]


            });
        </script>


    </body>
</html>
