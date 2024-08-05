<%@page import="entity.Brand"%>
<%@page import="entity.sport"%>
<%@page import="Model.Size"%>
<%@page import="Model.Color"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.SubCategory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/table.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/form.css">
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
        <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
        <style>
            .form-group {
                display: flex;
                align-items: center;
                margin-bottom: 13px;

            }
            .form-group label {
                width: 130px;
                margin-right: 10px;
                font-weight: bold;
            }
            .form-group input,
            .form-group select {
                flex: 1;
            }

            .error {
                margin-bottom: 10px;
                padding-left: 160px;
            }



        </style>
    </head>
    <body>
        <div class="row">
            <div class="col-2 border-4 border-black" style="padding-right: 0px;">
                <jsp:include page="AdministratorPage.jsp"/>
            </div>
            <%
                ArrayList<SubCategory> listCategory = (ArrayList<SubCategory>) request.getAttribute("listCategory");
                ArrayList<Color> listColor = (ArrayList<Color>) request.getAttribute("listColor");
                ArrayList<Size> listSize = (ArrayList<Size>) request.getAttribute("listSize");
                ArrayList<sport> listSport = (ArrayList<sport>) request.getAttribute("listSport");
                ArrayList<Brand> listBrand = (ArrayList<Brand>) request.getAttribute("listBrand");

                String selectedCategory = request.getParameter("category");
                if (selectedCategory == null) {
                    selectedCategory = "";
                }

                String selectedSport = request.getParameter("sport");
                if (selectedSport == null) {
                    selectedSport = "None";
                }

                String selectedBrand = request.getParameter("brand");
                if (selectedBrand == null) {
                    selectedBrand = "None";
                }
            %>
            <div class="col-10" style="background: #e2e7e8">
                <jsp:include page="HeaderAdmin.jsp"/>

                <div style="margin: 30px; background: white; padding: 20px; border-radius: 10px; display: flex; justify-content: center; align-items: center;">
                    <form action="addproduct" method="post" style="margin-top: 3%;color: black; width: 900px">
                        <input value="<%=request.getParameter("num")%>" hidden name="num"/>
                        <h1 style="text-align: center; font-family: initial">Thêm sản phẩm mới</h1>

                        <div class="row" style="background-color: #ffedd3">
                            <div class="col-6" >
                                <div class="form-group">
                                    <label for="uname">Tên sản phẩm:</label>
                                    <input type="text" id="uname" name="pname" value="${param.pname}" required/> 
                                </div>
                                <div class="error"><h5 style="color: red; font-size: 15px">${error1}</h5></div>

                                <div class="form-group" style="margin-top: 6%">
                                    <label for="images">Hình ảnh:</label>
                                    <input type="file" id="images" name="image" accept="image/*" />
                                </div>
                                <div class="form-group" style="margin-top: 5.5%">
                                    <label for="category">Thể loại:</label>
                                    <select name="category" id="category" required>
                                        <option value="" disabled <%= selectedCategory.isEmpty() ? "selected" : ""%>>Select an option</option>
                                        <%
                                            if (listCategory != null && !listCategory.isEmpty()) {
                                                for (SubCategory elem : listCategory) {
                                                    String categoryId = elem.getSubcategory_ID() + "";
                                                    String categoryName = elem.show();
                                        %>
                                        <option value="<%= categoryId%>" <%= categoryId.equals(selectedCategory) ? "selected" : ""%>><%= categoryName%></option>
                                        <%
                                            }
                                        } else {
                                        %>
                                        <option value="" disabled>No categories available</option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="sport">Môn thể thao:</label>
                                    <select name="sport" required>
                                        <option value="" disabled <%= selectedCategory.isEmpty() ? "selected" : ""%>>Select an option</option>
                                        <%
                                            for (sport elem : listSport) {
                                                String sportId = elem.getSport_Id() + "";
                                                String sportNameAndClb = elem.getNameAndClb();
                                        %>
                                        <option value="<%= sportId%>" <%= sportId.equals(selectedSport) ? "selected" : ""%>><%= sportNameAndClb%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="col-6" >
                                <div class="form-group">
                                    <label for="import_price" >Giá nhập/1 sản phẩm:</label>

                                    <input type="number" id="import_price" name="import_price" value="${param.price}" min="1" step="0.01" required /> 
                                    <span style="margin-left: 5px; font-weight: bold;transform: translateY(-20%); transform: translateX(-50px)">VNĐ</span>

                                </div>

                                <div class="form-group">
                                    <label for="price" >Giá bán/1 sản phẩm:</label>

                                    <input type="number" id="price" name="price" value="${param.price}" min="1" step="0.01" required /> 
                                    <span style="margin-left: 5px; font-weight: bold;transform: translateY(-20%); transform: translateX(-50px)">VNĐ</span>

                                </div>

                                <div class="form-group">
                                    <label for="brand">Thương hiệu:</label>
                                    <select name="brand" required>
                                        <option value="" disabled <%= selectedCategory.isEmpty() ? "selected" : ""%>>Select an option</option>                                                                                                                          " <%= "None".equals(selectedBrand) ? "selected" : ""%>>None</option>
                                        <%
                                            for (Brand elem : listBrand) {
                                                String brandId = elem.getId() + "";
                                                String brandName = elem.getName();
                                        %>
                                        <option value="<%= brandId%>" <%= brandId.equals(selectedBrand) ? "selected" : ""%>><%= brandName%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="status">Trạng thái:</label>
                                    <select id="status" name="status" >
                                        <option value="Normal" ${param.status == "Normal" ? "selected" : ""}>Normal</option>
                                        <option value="New" ${param.status == "New" ? "selected" : ""}>New</option>
                                        <option value="Hot" ${param.status == "Hot" ? "selected" : ""}>Hot</option>
                                        <option value="Sale" ${param.status == "Sale" ? "selected" : ""}>Sale</option>
                                        <option value="Hide" ${param.status == "Hide" ? "selected" : ""}>Hide</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <%
                            int num = Integer.parseInt(request.getParameter("num"));
                            for (int i = 1; i <= num; i++) {
                        %>
                        <div style="margin-top: 15px">
                            <div style="margin-bottom: 13px">
                                <label for="color" style="font-weight: bold; width: 136px">Màu sắc <%=i%>:</label>
                                <select name="color<%=i%>" id="color" style="width: 200px; height: auto;">
                                    <%for (Color elem : listColor) {
                                            String colorId = elem.getColor_ID() + "";
                                            String colorName = elem.getColor_Name();
                                            boolean isChecked = request.getParameterValues("color") != null && java.util.Arrays.asList(request.getParameterValues("color")).contains(colorId);
                                    %>
                                    <option value="<%= colorId%>"<%= isChecked ? "selected" : ""%>><%= colorName%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div style="margin-bottom: 13px">
                                <label for="size" style="font-weight: bold;" >Kích cỡ của màu <%=i%>:</label>
                                <div class="checkbox-grid">
                                    <%
                                        int idex = 1;
                                        for (Size elem : listSize) {
                                            String sizeId = elem.getSize_ID() + "";
                                            String sizeName = elem.getSize_Name();
                                            boolean isChecked = request.getParameterValues("size") != null && java.util.Arrays.asList(request.getParameterValues("size")).contains(sizeId);
                                    %>

                                    <span style="margin-right: 10px">
                                        <input type="checkbox" name="size<%=i%>" value="<%= elem.getSize_ID() %>" <%= isChecked ? "checked" : ""%>>
                                        <span style="width: 50px"><%=sizeName%></span>
                                        <input style="width: 50px;height: 20px" type="number" name="num<%=i%>" min="1">
                                    </span>
                                    <%
                                        idex++;
                                        if (idex == 7) {
                                    %><br/><%
                                                    }

                                                }
                                    %>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>

                        <div style="background-color: #ffedd3; padding-bottom: 10px">
                            <label style="font-weight: bold; margin-bottom: 5px; margin: 10px"for="description">Mô tả:</label><br>
                            <div class="form-group" style="display: flex;justify-content: center">
                                <textarea id="description" name="description" required>${param.description}</textarea>
                            </div>
                        </div>


                        <div style="display: flex;">
                            <input type="submit" value="Add"/><br/>
                            <a style="margin-left: 20px ; width: 400px; height: 44px; margin-top: 10px" href="${pageContext.request.contextPath}/managerproduct" class="btn btn-dark">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            // Khởi tạo CKEditor cho textarea có id="description"
            CKEDITOR.replace('description');
        </script>
    </body>
</html>
