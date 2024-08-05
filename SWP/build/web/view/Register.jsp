<%-- 
    Document   : Register
    Created on : Jul 19, 2024, 4:00:50 PM
    Author     : Hoàng Sơn
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký</title>
    </head>
    <style>
        html, body {
            overflow-y: hidden;
        }

        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Poppins", sans-serif;
            font-size: 14px;
            color: #181818;
            background: #181818;
        }
        section {
            width: 100%;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-modal {
            position: absolute;
            width: 100vw;
            height: 100vh;
            background: #f8f8f8;
            display: flex;
        }

        .login-form {
            height: 100%;
            width: 50%;
            display: flex;
            justify-content: center;
            align-items: center;

        }

        .login-content {
            margin-top: 150px;
            width: 400px;
            height: 100vh;
        }

        .title {
            font-weight: 500;
            font-size: 44px;
            line-height: 51px;
            text-align: center;
            letter-spacing: 0.03em;
            text-transform: uppercase;
            color: #030303;
            margin-bottom: 1rem;
        }

        .subtitle {
            font-weight: 400;
            font-size: 14px;
            line-height: 21px;
            text-align: center;
            letter-spacing: 0.03em;
            color: #636364;
        }

        .username-input {
            display: flex;
            flex-direction: column;
            margin-bottom: 5px;
        }
        .password-input {
            display: flex;
            flex-direction: column;
            margin-bottom: 21px;
        }
        .input-title {
            font-weight: 500;
            font-size: 14px;
            line-height: 21px;
            letter-spacing: 0.03em;
            color: #181818;
            margin-bottom: 6px;
        }

        .input {
            width: 100%;
            max-width: 400px;
            height: 50px;
            border: 1px solid rgba(0, 0, 0, 0.25);
            filter: drop-shadow(0px 4px 10px rgba(0, 0, 0, 0.25));
            border-radius: 12px;
            background-color: transparent;
            outline: none;
            padding: 0px 20px;
        }


        .input:focus {
            border: 1px solid black;
        }
        .input::placeholder {
            font-weight: 300;
            font-size: 14px;
            line-height: 21px;
            letter-spacing: 0.03em;
            color: #636364;
        }

        /* Castomizing the checkbox */
        .recovery {
            display: flex;
            justify-content: space-between;
            margin-bottom: 11px;
        }
        .remember {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        [type="checkbox"] {
            opacity: 0;
        }
        [type="checkbox"] + label {
            position: relative;
            padding-left: 6px;
            display: inline-block;
            font-weight: 500;
            font-size: 12px;
            line-height: 18px;
            letter-spacing: 0.03em;
            color: #181818;
            cursor: pointer;
        }

        [type="checkbox"] + label::before {
            content: "";
            position: absolute;
            top: 2px;
            left: -11px;
            width: 14px;
            height: 14px;
            outline: 1px solid rgba(0, 0, 0, 0.25);
            border-radius: 4px;
            background: #f8f8f8;
            cursor: pointer;
        }

        [type="checkbox"]:checked + label::before {
            content: "";
            position: absolute;
            top: 2px;
            left: -11px;
            width: 14px;
            height: 14px;
            outline: 1px solid #000;
            border-radius: 4px;
            background: #f8f8f8;
            cursor: pointer;
        }

        [type="checkbox"]:checked + label::after {
            content: "";
            position: absolute;
            top: 2px;
            left: -11px;
            width: 14px;
            height: 14px;
            background-image: url(img/logo/icons8-check-96.png);
            background-size: cover;
            border-radius: 4px;
            cursor: pointer;
            transform: scale(1);
            opacity: 1;
            transition: all 0.3s ease;

        }

        [type="checkbox"]:not(:checked) + label::after {
            content: "";
            position: absolute;
            top: 2px;
            left: -11px;
            width: 14px;
            height: 14px;
            background-image: url(img/logo/icons8-check-96.png);
            background-size: cover;
            border-radius: 4px;
            cursor: pointer;
            transform: scale(0);
            opacity: 0;
        }
        /* castom checkbox */

        .forgot a {
            font-weight: 500;
            font-size: 12px;
            line-height: 18px;
            letter-spacing: 0.03em;
            color: #181818;
            text-decoration: none;
        }
        .login-image {
            height: 100%;
            width: 50%;
        }

        .btn {
            font-family: "Poppins", sans-serif;
            width: 100%;
            height: 46px;
            border-radius: 12px;
            margin-bottom: 11px;
            border: none;
            cursor: pointer;
        }
        .btn-primary {
            font-weight: 500;
            font-size: 14px;
            line-height: 21px;
            text-align: center;
            letter-spacing: 0.03em;
            color: #ffffff;
            background: #ea454c;
            box-shadow: 0px 4px 10px rgba(233, 68, 75, 0.25);
            transition: all 0.3s ease;
            margin-top: 10px;
        }

        .btn-primary:hover {
            box-shadow: 0px 5px 12px rgba(233, 68, 75, 0.5);
            color: #181818;
        }

        .btn-secondary {
            background-color: #f8f8f8;
            border: 1px solid rgba(0, 0, 0, 0.25);
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.25);
            border-radius: 12px;
            font-weight: 500;
            font-size: 14px;
            line-height: 21px;
            text-align: center;
            letter-spacing: 0.03em;
            color: #000000;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: all 0.8s ease;
            margin-top: 10px;
        }

        .btn-secondary:hover {
            border: 1px solid rgba(233, 68, 75, 0.5);
            color: #ea454c;
        }

        .btn-secondary:hover img {
            display: none;
        }

        .btn-secondary img {
            padding: 0px 10px;
        }

        .login-footer {
            margin-top: 26px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 500;
            font-size: 10px;
            line-height: 15px;
            letter-spacing: 0.03em;
            color: #595959;
        }

        .login-footer a {
            text-decoration: none;
            color: #ea454c;
            padding-left: 3px;
        }


        .button {
            display: block;
            position: relative;
            width: 56px;
            height: 56px;
            margin: 0;
            overflow: hidden;
            outline: none;
            background-color: black;
            cursor: pointer;
            border: 0;
            margin-right: 100px;
            position: absolute;
            right:  680px;
            top: 80px;
        }

        .button:before,
        .button:after {
            content: "";
            position: absolute;
            border-radius: 50%;
            inset: 7px;
        }

        .button:before {
            border: 4px solid #f0eeef;
            transition: opacity 0.4s cubic-bezier(0.77, 0, 0.175, 1) 80ms,
                transform 0.5s cubic-bezier(0.455, 0.03, 0.515, 0.955) 80ms;
        }

        .button:after {
            border: 4px solid #96daf0;
            transform: scale(1.3);
            transition: opacity 0.4s cubic-bezier(0.165, 0.84, 0.44, 1),
                transform 0.5s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            opacity: 0;
        }

        .button:hover:before,
        .button:focus:before {
            opacity: 0;
            transform: scale(0.7);
            transition: opacity 0.4s cubic-bezier(0.165, 0.84, 0.44, 1),
                transform 0.5s cubic-bezier(0.25, 0.46, 0.45, 0.94);
        }

        .button:hover:after,
        .button:focus:after {
            opacity: 1;
            transform: scale(1);
            transition: opacity 0.4s cubic-bezier(0.77, 0, 0.175, 1) 80ms,
                transform 0.5s cubic-bezier(0.455, 0.03, 0.515, 0.955) 80ms;
        }

        .button-box {
            display: flex;
            position: absolute;
            top: 0;
            left: 0;
        }

        .button-elem {
            display: block;
            width: 20px;
            height: 20px;
            margin: 17px 18px 0 18px;
            transform: rotate(180deg);
            fill: #f0eeef;
        }

        .button:hover .button-box,
        .button:focus .button-box {
            transition: 0.4s;
            transform: translateX(-56px);
        }


        .password-input {
            position: relative;
            margin-bottom: 1rem;
        }
        .password-input input {
            width: 100%;
            padding-right: 40px; /* Để chừa chỗ cho nút */
        }
        .toggle-password {
            position: absolute;
            right: 10px;
            top: 65%;
            transform: translateY(-50%);
            cursor: pointer;
        }

    </style>

    <body>
        <div class="login-modal">
            <div class="login-image">
                <img
                    src="img/logo/nike.jpg"
                    alt="Nike Shoes"
                    height="100%"
                    width="100%"
                    />
            </div>
            <div class="login-form">

                <a  href="/SWP/Login" class="button">
                    <div class="button-box">
                        <span class="button-elem">
                            <svg viewBox="0 0 46 40" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M46 20.038c0-.7-.3-1.5-.8-2.1l-16-17c-1.1-1-3.2-1.4-4.4-.3-1.2 1.1-1.2 3.3 0 4.4l11.3 11.9H3c-1.7 0-3 1.3-3 3s1.3 3 3 3h33.1l-11.3 11.9c-1 1-1.2 3.3 0 4.4 1.2 1.1 3.3.8 4.4-.3l16-17c.5-.5.8-1.1.8-1.9z"
                                ></path>
                            </svg>
                        </span>
                        <span class="button-elem">
                            <svg viewBox="0 0 46 40">
                            <path
                                d="M46 20.038c0-.7-.3-1.5-.8-2.1l-16-17c-1.1-1-3.2-1.4-4.4-.3-1.2 1.1-1.2 3.3 0 4.4l11.3 11.9H3c-1.7 0-3 1.3-3 3s1.3 3 3 3h33.1l-11.3 11.9c-1 1-1.2 3.3 0 4.4 1.2 1.1 3.3.8 4.4-.3l16-17c.5-.5.8-1.1.8-1.9z"
                                ></path>
                            </svg>
                        </span>
                    </div>
                </a>

                <div class="login-content">
                    <form action="Login" method="post"">
                        <h1 class="title">ĐĂNG KÝ</h1>
                        <div class="username-input">
                            <span class="input-title">Tài khoản</span>
                            <input class="input" type="text" placeholder="Tài khoản" required  name="username"/>
                        </div>
                        <div class="username-input">
                            <span class="input-title">Họ và Tên</span>
                            <input class="input" type="text" placeholder="Nguyễn Văn A" required  name="fullname"/>
                        </div>

                        <div class="password-input">
                            <span class="input-title">Mật Khẩu</span>
                            <input class="input" id="password" type="password" name="password" placeholder="********"            pattern="^(?=.*[A-Z]).{8,}$" 
                                   title="Password must be at least 8 characters long and contain at least one uppercase letter." 
                                   required />
                            <span class="toggle-password" id="togglePassword1">👁️</span>
                        </div>

                        <div class="password-input">
                            <span class="input-title">Nhập lại mật khẩu</span>
                            <input class="input" id="confirm-password" type="password" name="confirm-password" placeholder="********" required />
                            <span class="toggle-password" id="togglePassword2">👁️</span>
                        </div>

                        <div class="username-input">
                            <span class="input-title">Số điện thoại</span>
                            <input class="input" type="text" required  name="numberphone"  required/>
                        </div>

                        <div class="username-input">
                            <span class="input-title">Email</span>
                            <input class="input" type="email" required  name="email" required/>
                        </div>

                        <div class="username-input">
                            <span class="input-title">Đại chỉ</span>
                            <input class="input" type="text" required  name="address"/>
                        </div>
                        <button class="btn btn-primary" type="submit" name="action" value="register">Đăng ký</button>
                    </form>
                </div>
            </div>

        </div>




        <script>
            document.getElementById('togglePassword1').addEventListener('click', function () {
                var passwordField = document.getElementById('password');
                var type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordField.setAttribute('type', type);
                this.textContent = type === 'password' ? '👁️' : '🙈'; // Thay đổi biểu tượng
            });
            document.getElementById('togglePassword2').addEventListener('click', function () {
                var confirmPasswordField = document.getElementById('confirm-password');
                var type = confirmPasswordField.getAttribute('type') === 'password' ? 'text' : 'password';
                confirmPasswordField.setAttribute('type', type);
                this.textContent = type === 'password' ? '👁️' : '🙈'; // Thay đổi biểu tượng
            });

        </script>
        <c:if test="${not empty requestScope.message}">
            <script>
                // Thiết lập biến JavaScript từ giá trị JSTL
                var message = "${requestScope.message}";
                // Hàm hiển thị thông báo
                function showAlert() {
                    alert(message);
                }
                window.onload = function () {
                    showAlert()
                    event.preventDefault();
                };
            </script>
        </c:if>





    </body>
</html>
