<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>AeSport Help Center</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }
            .header {
                background-color: #ffffff;
                color: #333;
                padding: 20px;
                text-align: center;
                position: relative;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .header img {
                height: 40px;
                vertical-align: middle;
                margin-right: 10px;
            }
            .header h1 {
                display: inline;
                font-size: 24px;
                margin: 0;
                vertical-align: middle;
            }
            .header form {
                margin-top: 10px;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .header input[type="text"] {
                width: 50%;
                padding: 10px;
                border-radius: 5px 0 0 5px;
                border: 1px solid #ccc;
                font-size: 16px;
            }
            .header button {
                padding: 10px 20px;
                border: none;
                border-radius: 0 5px 5px 0;
                background-color: #333;
                color: white;
                cursor: pointer;
                font-size: 16px;
            }
            .notice {
                background-color: #ffffff;
                padding: 15px;
                text-align: center;
                border-bottom: 1px solid #ccc;
                font-size: 14px;
            }
            .notice a {
                color: #333;
                text-decoration: none;
            }
            .content {
                display: flex;
                flex-direction: column;
                background-color: white;
                padding: 20px;
                border-bottom: 1px solid #ddd;
                flex: 1;
            }
            .categories {
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
            }
            .category {
                background-color: #fff;
                padding: 15px;
                margin: 10px;
                border-radius: 5px;
                text-align: center;
                width: 150px;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
                border: 1px solid #ddd;
                transition: transform 0.2s, box-shadow 0.2s;
                cursor: pointer;
            }
            .category:hover {
                transform: scale(1.05);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }
            .category i {
                font-size: 24px;
                margin-bottom: 10px;
                color: #333;
            }
            .faq-container {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }
            .faq {
                width: 45%;
            }
            .faq h3 {
                margin-bottom: 20px;
                color: #333;
                text-align: center;
            }
            .faq a {
                text-decoration: none;
                color: #333;
                display: block;
                margin-bottom: 10px;
                border-bottom: 1px solid #ddd;
                padding-bottom: 5px;
                transition: color 0.2s;
                cursor: pointer;
            }
            .faq a:hover {
                color: #007BFF;
                text-decoration: underline;
            }
            .answer-container {
                width: 50%;
                padding-left: 20px;
                border-left: 2px solid #ddd;
            }
            .answer {
                display: none;
                padding: 20px;
                margin-bottom: 10px;
                border: 1px solid #ddd;
                background-color: #f9f9f9;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .footer {
                background-color: #ffffff;
                text-align: center;
                padding: 10px;
                border-top: 1px solid #ddd;
                font-size: 14px;
            }
        </style>
    </head>
    <body>

        <div class="header">
            <a class="nav-link" href="http://localhost:9999/SWP/HomePage">
                <i class="fa fa-home"></i> Trang chủ
            </a>
            <h1>Trung tâm trợ giúp AESport</h1>    
            <form id="searchForm">
                <input type="text" id="searchInput" placeholder="Nhập từ khóa hoặc nội dung cần tìm">
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </div> 
        <div class="content">
            <div class="categories">
                <div class="category" data-category="shopping">
                    <i class="fa fa-shopping-cart"></i>
                    <div>Mua Sắm Cùng AeSport</div>
                </div>
                <div class="category" data-category="returns">
                    <i class="fa fa-undo"></i>
                    <div>Trả Hàng & Hoàn Tiền</div>
                </div>
                <div class="category" data-category="promotions">
                    <i class="fa fa-tags"></i>
                    <div>Khuyến Mãi & Ưu Đãi</div>
                </div>
                <div class="category" data-category="payment">
                    <i class="fa fa-credit-card"></i>
                    <div>Thanh Toán</div>
                </div>
                <div class="category" data-category="shipping">
                    <i class="fa fa-truck"></i>
                    <div>Đơn Hàng & Vận Chuyển</div>
                </div>
                <div class="category" data-category="general">
                    <i class="fa fa-info-circle"></i>
                    <div>Thông Tin Chung</div>
                </div>
            </div>
            <div class="faq-container">
                <div class="faq">
                    <h3>Câu hỏi thường gặp</h3>
                    <a href="#" data-answer="answer1" data-category="shopping">[Cảnh báo lừa đảo] Mua sắm an toàn cùng AeSport</a>
                    <a href="#" data-answer="answer2" data-category="general">Điều khoản AeSport</a>
                    <a href="#" data-answer="answer3" data-category="general">[Bảo mật tài khoản] Làm gì khi nhận được thông báo là thông tin tài khoản AeSport đã được thay đổi?</a>
                    <a href="#" data-answer="answer4" data-category="general">[Lỗi] Cách xử lý khi hệ thống không thể xác minh tài khoản AeSport của tôi để đăng nhập? Tại sao hệ thống không thể xác minh được yêu cầu đăng nhập của tôi?</a>
                    <a href="#" data-answer="answer5" data-category="promotions">[Khuyến mãi] Tại sao sản phẩm trong đơn hàng AeSport của tôi không được áp dụng khuyến mãi / giảm giá?</a>
                    <a href="#" data-answer="answer7" data-category="payment">[Lỗi] Tại sao tôi không thể thanh toán đơn hàng trên AeSport?</a>
                    <a href="#" data-answer="answer8" data-category="returns">Làm thế nào để yêu cầu hoàn tiền cho sản phẩm đã mua?</a>
                    <a href="#" data-answer="answer9" data-category="returns">Điều kiện để được hoàn tiền là gì?</a>
                    <a href="#" data-answer="answer10" data-category="returns">Thời gian xử lý hoàn tiền là bao lâu?</a>
                    <a href="#" data-answer="answer11" data-category="shipping">Làm thế nào để theo dõi đơn hàng của tôi?</a>
                    <a href="#" data-answer="answer12" data-category="shipping">Phí vận chuyển được tính như thế nào?</a>
                    <a href="#" data-answer="answer13" data-category="shipping">Điều gì sẽ xảy ra nếu tôi không có mặt để nhận hàng?</a>

                </div>
                <div class="answer-container">
                    <div id="answer1" class="answer">
                        <h4>[Cảnh báo lừa đảo] Mua sắm an toàn cùng AeSport</h4>
                        <p><strong>Cách nhận diện các chiêu trò lừa đảo:</strong></p>
                        <ul>
                            <li><strong>Trang web giả mạo:</strong> Các trang web này thường có tên miền gần giống với các trang web uy tín để gây nhầm lẫn cho người mua hàng. Giao diện có thể sao chép gần giống với trang web chính thức nhưng thiếu thông tin liên hệ chi tiết hoặc thông tin bảo mật.</li>
                            <li><strong>Giá cả quá hấp dẫn:</strong> Sản phẩm được bán với giá cực rẻ, thấp hơn nhiều so với thị trường. Đây là một dấu hiệu cảnh báo, vì những sản phẩm chất lượng thường không có giá quá thấp.</li>
                            <li><strong>Yêu cầu thanh toán trước:</strong> Trang web yêu cầu người mua thanh toán toàn bộ hoặc một phần tiền hàng trước khi giao hàng, không chấp nhận thanh toán khi nhận hàng (COD).</li>
                            <li><strong>Thông tin sản phẩm không rõ ràng:</strong> Mô tả sản phẩm thiếu chi tiết, không có thông số kỹ thuật rõ ràng, hoặc sử dụng hình ảnh kém chất lượng.</li>
                        </ul>
                        <p><strong>Biện pháp phòng tránh lừa đảo:</strong></p>
                        <ul>
                            <li><strong>Kiểm tra kỹ thông tin trang web:</strong> Trước khi mua hàng, hãy kiểm tra kỹ lưỡng thông tin của trang web, bao gồm địa chỉ liên hệ, chính sách bảo mật, và phản hồi của khách hàng khác. Sử dụng các công cụ kiểm tra độ tin cậy của trang web như WOT (Web of Trust) hoặc các trang đánh giá uy tín.</li>
                            <li><strong>So sánh giá cả:</strong> Nên so sánh giá cả của sản phẩm trên nhiều trang web khác nhau để đảm bảo không bị lừa bởi giá rẻ bất thường.</li>
                            <li><strong>Chỉ thanh toán khi nhận hàng:</strong> Chọn phương thức thanh toán khi nhận hàng (COD) để tránh rủi ro mất tiền mà không nhận được hàng.</li>
                        </ul>
                    </div>
                    <div id="answer2" class="answer">
                        <h4>Điều khoản AeSport</h4>
                        <p><strong>1. Giới thiệu:</strong> Điều khoản sử dụng này ("Điều khoản") quy định các điều kiện và điều khoản giữa người dùng ("Bạn") và công ty AeSport ("Chúng tôi") khi sử dụng các dịch vụ của AeSport.</p>
                        <p><strong>2. Chấp nhận điều khoản:</strong> Bằng cách sử dụng dịch vụ của AeSport, bạn đồng ý tuân thủ và bị ràng buộc bởi các điều khoản này.</p>
                        <p><strong>3. Đăng ký tài khoản:</strong> Bạn phải tạo một tài khoản để sử dụng một số dịch vụ nhất định. Bạn chịu trách nhiệm bảo mật thông tin tài khoản của mình.</p>
                        <p><strong>4. Sử dụng dịch vụ:</strong> Bạn đồng ý sử dụng dịch vụ của chúng tôi một cách hợp pháp và tuân thủ mọi quy định pháp luật hiện hành.</p>
                        <p><strong>5. Chính sách mua hàng và thanh toán:</strong></p>
                        <ul>
                            <li><strong>Giá cả và thanh toán:</strong> Tất cả giá sản phẩm và dịch vụ được niêm yết trên trang web của chúng tôi có thể thay đổi mà không cần thông báo trước. Bạn đồng ý thanh toán đầy đủ cho các sản phẩm và dịch vụ mà bạn mua.</li>
                            <li><strong>Phương thức thanh toán:</strong> Chúng tôi chấp nhận các phương thức thanh toán như thẻ tín dụng, thẻ ghi nợ, và các hình thức thanh toán điện tử khác.</li>
                        </ul>
                        <p><strong>6. Chính sách giao hàng:</strong></p>
                        <ul>
                            <li><strong>Thời gian giao hàng:</strong> Thời gian giao hàng dự kiến sẽ được thông báo khi bạn đặt hàng. Tuy nhiên, có thể có sự chậm trễ do các yếu tố ngoài tầm kiểm soát của chúng tôi.</li>
                            <li><strong>Phí giao hàng:</strong> Phí giao hàng sẽ được tính dựa trên địa chỉ giao hàng và sẽ được thông báo rõ ràng trước khi bạn xác nhận đặt hàng.</li>
                        </ul>
                        <p><strong>7. Bảo hành và trả hàng:</strong></p>
                        <ul>
                            <li><strong>Chính sách bảo hành:</strong> Các sản phẩm sẽ được bảo hành theo chính sách của nhà sản xuất.</li>
                            <li><strong>Chính sách trả hàng:</strong> Bạn có thể trả lại sản phẩm trong thời gian quy định nếu không hài lòng.</li>
                        </ul>
                        <p><strong>8. Quyền sở hữu trí tuệ:</strong> Tất cả các nội dung trên trang web và ứng dụng của AeSport đều thuộc sở hữu của AeSport hoặc các bên cấp phép cho AeSport.</p>
                        <p><strong>9. Giới hạn trách nhiệm:</strong> AeSport sẽ không chịu trách nhiệm cho bất kỳ thiệt hại nào phát sinh từ việc sử dụng dịch vụ của chúng tôi.</p>
                        <p><strong>10. Điều khoản sửa đổi:</strong> Chúng tôi có quyền sửa đổi các điều khoản này vào bất kỳ thời điểm nào.</p>
                        <p><strong>11. Liên hệ:</strong> Nếu bạn có bất kỳ câu hỏi nào về các điều khoản này, vui lòng liên hệ với chúng tôi qua thông tin sau: Email: support@aesport.com, Số điện thoại: 123-456-789, Địa chỉ: 123 Thạch Thất, Thành phố Hà Nội.</p>
                    </div>
                    <div id="answer3" class="answer">
                        <h4>[Bảo mật tài khoản] Làm gì khi nhận được thông báo là thông tin tài khoản AeSport đã được thay đổi?</h4>
                        <p><strong>Kiểm tra và cập nhật thông tin tài khoản:</strong></p>
                        <ul>
                            <li><strong>Kiểm tra thông tin cá nhân:</strong> Đảm bảo rằng tất cả thông tin cá nhân trên tài khoản của bạn đều chính xác và chưa bị thay đổi.</li>
                            <li><strong>Cập nhật thông tin:</strong> Nếu phát hiện bất kỳ thông tin nào bị thay đổi mà không phải do bạn thực hiện, hãy cập nhật lại thông tin chính xác và bảo mật.</li>
                        </ul>
                        <p><strong>Theo dõi tài khoản:</strong></p>
                        <ul>
                            <li><strong>Theo dõi thường xuyên:</strong> Theo dõi tài khoản của bạn thường xuyên để phát hiện kịp thời bất kỳ hoạt động bất thường nào.</li>
                        </ul>
                        <p><strong>Phòng tránh lừa đảo:</strong></p>
                        <ul>
                            <li><strong>Cảnh giác với lừa đảo:</strong> Luôn cảnh giác với các email hoặc tin nhắn lừa đảo yêu cầu thông tin cá nhân hoặc tài khoản của bạn.</li>
                        </ul>
                    </div>
                    <div id="answer4" class="answer">
                        <h4>[Lỗi] Cách xử lý khi hệ thống không thể xác minh tài khoản AeSport của tôi để đăng nhập?</h4>
                        <p><strong>Nguyên nhân hệ thống không thể xác minh yêu cầu đăng nhập:</strong></p>
                        <ul>
                            <li><strong>Thông tin đăng nhập sai:</strong> Bạn có thể đã nhập sai tên đăng nhập hoặc mật khẩu.</li>
                            <li><strong>Tài khoản bị khóa:</strong> Tài khoản của bạn có thể đã bị khóa do nhiều lần đăng nhập thất bại hoặc do vi phạm chính sách của AeSport.</li>
                            <li><strong>Lỗi hệ thống:</strong> Có thể hệ thống của AeSport đang gặp sự cố hoặc đang bảo trì.</li>
                            <li><strong>Tài khoản chưa kích hoạt:</strong> Nếu bạn chưa kích hoạt tài khoản qua email xác nhận, bạn sẽ không thể đăng nhập.</li>
                        </ul>
                        <p><strong>Cách xử lý khi hệ thống không thể xác minh tài khoản của bạn:</strong></p>
                        <ol>
                            <li><strong>Kiểm tra lại thông tin đăng nhập:</strong> Đảm bảo rằng bạn đã nhập đúng tên đăng nhập và mật khẩu. Hãy thử nhập lại cẩn thận, đặc biệt chú ý đến chữ hoa, chữ thường và các ký tự đặc biệt. Sử dụng tùy chọn "Quên mật khẩu" nếu bạn không chắc chắn về mật khẩu.</li>
                            <li><strong>Kiểm tra email kích hoạt tài khoản:</strong> Kiểm tra hộp thư đến và thư rác để tìm email kích hoạt từ AeSport. Nếu bạn tìm thấy email kích hoạt, hãy làm theo hướng dẫn để kích hoạt tài khoản của bạn.</li>
                        </ol>
                    </div>
                    <div id="answer5" class="answer">
                        <h4>[Khuyến mãi] Tại sao sản phẩm trong đơn hàng AeSport của tôi không được áp dụng khuyến mãi / giảm giá?</h4>
                        <p><strong>Nguyên nhân sản phẩm không được áp dụng khuyến mãi / giảm giá:</strong></p>
                        <ul>
                            <li><strong>Điều kiện khuyến mãi không đáp ứng:</strong> Sản phẩm không nằm trong danh sách khuyến mãi. Chỉ những sản phẩm cụ thể mới được áp dụng khuyến mãi. Kiểm tra lại điều kiện và danh sách sản phẩm được áp dụng khuyến mãi.</li>
                            <li><strong>Giá trị đơn hàng tối thiểu:</strong> Một số chương trình khuyến mãi yêu cầu giá trị đơn hàng tối thiểu. Kiểm tra xem đơn hàng của bạn đã đạt yêu cầu này chưa.</li>
                            <li><strong>Số lượng sản phẩm:</strong> Một số khuyến mãi yêu cầu mua số lượng sản phẩm nhất định để được giảm giá.</li>
                        </ul>
                        <p><strong>Hạn chế về thời gian:</strong></p>
                        <ul>
                            <li><strong>Thời gian khuyến mãi đã kết thúc:</strong> Kiểm tra ngày và giờ áp dụng của chương trình khuyến mãi. Có thể chương trình đã hết hạn.</li>
                            <li><strong>Thời gian bắt đầu chưa tới:</strong> Đôi khi chương trình khuyến mãi chỉ bắt đầu vào một thời điểm cụ thể trong ngày hoặc tuần.</li>
                        </ul>
                        <p><strong>Hạn chế về tài khoản hoặc khách hàng:</strong></p>
                        <ul>
                            <li><strong>Khuyến mãi chỉ dành cho khách hàng mới:</strong> Một số khuyến mãi chỉ áp dụng cho khách hàng mới hoặc lần đầu mua sắm.</li>
                            <li><strong>Giới hạn sử dụng một lần:</strong> Một số mã khuyến mãi chỉ sử dụng được một lần cho mỗi khách hàng.</li>
                        </ul>
                        <p><strong>Hạn chế về khu vực:</strong> Kiểm tra xem chương trình khuyến mãi có giới hạn về khu vực áp dụng không.</p>
                    </div>
                    <div id="answer7" class="answer">
                        <h4>[Lỗi] Tại sao tôi không thể thanh toán đơn hàng trên AeSport?</h4>
                        <p><strong>Nguyên nhân khiến bạn không thể thanh toán đơn hàng trên AeSport:</strong></p>
                        <ul>
                            <li><strong>Lỗi kết nối Internet:</strong> Đảm bảo bạn có kết nối Internet ổn định khi thực hiện thanh toán.</li>
                            <li><strong>Lỗi hệ thống của AeSport hoặc ngân hàng:</strong></li>
                            <ul>
                                <li><strong>Bảo trì hệ thống:</strong> Hệ thống thanh toán của AeSport hoặc ngân hàng có thể đang trong quá trình bảo trì.</li>
                                <li><strong>Lỗi kỹ thuật:</strong> Có thể có lỗi kỹ thuật từ phía AeSport hoặc cổng thanh toán.</li>
                            </ul>
                            <li><strong>Hình thức thanh toán không được hỗ trợ:</strong></li>
                            <ul>
                                <li><strong>Phương thức thanh toán:</strong> Đảm bảo phương thức thanh toán bạn chọn được AeSport hỗ trợ.</li>
                                <li><strong>Khu vực áp dụng:</strong> Một số phương thức thanh toán chỉ áp dụng cho một số khu vực nhất định.</li>
                            </ul>
                        </ul>
                    </div>
                    <div id="answer8" class="answer">
                        <h4>Làm thế nào để yêu cầu hoàn tiền cho sản phẩm đã mua?</h4>
                        <p>Để yêu cầu hoàn tiền cho sản phẩm đã mua, bạn cần đăng nhập vào tài khoản của mình, đi tới phần "Lịch sử mua hàng" và chọn đơn hàng bạn muốn hoàn tiền. Sau đó, nhấp vào "Yêu cầu hoàn tiền" và điền đầy đủ thông tin cần thiết. Nhân viên chăm sóc khách hàng của chúng tôi sẽ xử lý yêu cầu của bạn trong vòng 3-5 ngày làm việc.</p>
                    </div>
                    <div id="answer9" class="answer">
                        <h4>Điều kiện để được hoàn tiền là gì?</h4>
                        <p>Sản phẩm cần được trả lại trong tình trạng nguyên vẹn, không có dấu hiệu sử dụng, và còn đầy đủ phụ kiện kèm theo. Ngoài ra, bạn cần gửi kèm hóa đơn mua hàng và đơn yêu cầu hoàn tiền. Chỉ những sản phẩm đáp ứng đầy đủ các điều kiện này mới được hoàn tiền.</p>
                    </div>
                    <div id="answer10" class="answer">
                        <h4>Thời gian xử lý hoàn tiền là bao lâu?</h4>
                        <p>Thời gian xử lý hoàn tiền thường là từ 7-10 ngày làm việc kể từ khi chúng tôi nhận được sản phẩm trả lại. Bạn sẽ nhận được email thông báo khi quá trình hoàn tiền hoàn tất. Thời gian để tiền hoàn lại xuất hiện trong tài khoản của bạn phụ thuộc vào ngân hàng hoặc phương thức thanh toán bạn sử dụng.</p>
                    </div>
                    <!-- Đơn Hàng & Vận Chuyển -->
                    <div id="answer11" class="answer">
                        <h4>Làm thế nào để theo dõi đơn hàng của tôi?</h4>
                        <p>Bạn có thể theo dõi đơn hàng của mình bằng cách đăng nhập vào tài khoản AeSport, đi tới phần "Lịch sử mua hàng" và chọn đơn hàng bạn muốn theo dõi. Tại đây, bạn sẽ thấy thông tin chi tiết về tình trạng vận chuyển và dự kiến ngày giao hàng của đơn hàng.</p>
                    </div>
                    <div id="answer12" class="answer">
                        <h4>Phí vận chuyển được tính như thế nào?</h4>
                        <p>Phí vận chuyển được tính dựa trên trọng lượng của sản phẩm, địa chỉ giao hàng và phương thức vận chuyển bạn chọn. Chi phí vận chuyển sẽ được hiển thị rõ ràng trong quá trình đặt hàng trước khi bạn xác nhận mua hàng.</p>
                    </div>
                    <div id="answer13" class="answer">
                        <h4>Điều gì sẽ xảy ra nếu tôi không có mặt để nhận hàng?</h4>
                        <p>Nếu bạn không có mặt để nhận hàng, nhân viên giao hàng sẽ liên hệ với bạn để sắp xếp lại thời gian giao hàng. Nếu không thể liên hệ được sau nhiều lần cố gắng, đơn hàng có thể được chuyển về kho. Bạn cần liên hệ với bộ phận chăm sóc khách hàng của AeSport để sắp xếp giao hàng lại hoặc nhận hàng tại kho.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            &copy; 2024 AESport. All rights reserved.
        </div>

        <script>
            document.querySelectorAll('.faq a').forEach(question => {
                question.addEventListener('click', function (event) {
                    event.preventDefault();
                    const answerId = this.getAttribute('data-answer');
                    const answer = document.getElementById(answerId);
                    if (answer.style.display === 'none' || answer.style.display === '') {
                        document.querySelectorAll('.answer').forEach(a => a.style.display = 'none');
                        answer.style.display = 'block';
                        this.scrollIntoView({behavior: 'smooth'});
                    } else {
                        answer.style.display = 'none';
                    }
                });
            });

            document.querySelectorAll('.category').forEach(category => {
                category.addEventListener('click', function () {
                    const categoryType = this.getAttribute('data-category');
                    document.querySelectorAll('.faq a').forEach(question => {
                        const questionCategory = question.getAttribute('data-category');
                        if (questionCategory === categoryType) {
                            question.style.display = 'block';
                        } else {
                            question.style.display = 'none';
                        }
                    });
                    document.querySelectorAll('.answer').forEach(answer => answer.style.display = 'none');
                });
            });

            document.getElementById('searchForm').addEventListener('submit', function (event) {
                event.preventDefault();
                const keyword = document.getElementById('searchInput').value.toLowerCase();
                document.querySelectorAll('.faq a').forEach(question => {
                    if (question.textContent.toLowerCase().includes(keyword)) {
                        question.style.display = 'block';
                    } else {
                        question.style.display = 'none';
                    }
                });
                document.querySelectorAll('.answer').forEach(answer => answer.style.display = 'none');
            });
        </script>
    </body>
</html>
