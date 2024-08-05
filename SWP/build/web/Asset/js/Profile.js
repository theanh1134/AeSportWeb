function updateProfile() {
    let name = $('#fullName').val(); // lấy giá trị theo id tab

    let userEmail = $('#email').val();
    let userPhone = $('#phone').val();
    let userAddress = $('#address').val();
    let boxMess = $('#profileMessageBox')
    let Mess = $('#profileMessage')
    if (name == '' || userEmail == '' || userPhone == '' || userAddress == '') {
        boxMess.removeClass("fade")
        Mess.text("please input your new information!!");
        setTimeout(() => {
            boxMess.addClass("fade")
        }, 3000)
        return;
    }
      // validate giá trị nhập vào
    if ( !validatePhoneNumber(userPhone) ) {
        let textMess = !validatePhoneNumber(userPhone) ? "Please enter correct form phone number is:10 number start 0" : ""

        boxMess.removeClass("bg-success").addClass("bg-danger")
        Mess.text(textMess);
        boxMess.removeClass("fade")
        setTimeout(() => {
            boxMess.addClass("fade")
        }, 3000)
        return;
    }
     if ( !validateEmail(userEmail) ) {
        let textMess = !validateEmail(userEmail) ? "Please enter correct form email" : ""

        boxMess.removeClass("bg-success").addClass("bg-danger")
        Mess.text(textMess);
        boxMess.removeClass("fade")
        setTimeout(() => {
            boxMess.addClass("fade")
        }, 3000)
        return;
    }

    $.ajax({// call api
        url: "/SWP/Profile",
        method: "POST",
        data: {
            Action: "ChangeInfor",
            userName: name,
            userEmail: userEmail,
            userPhone: userPhone,   
            userAddress: userAddress
        },
        
        
        success: function (data) {
            boxMess.removeClass("fade")
            Mess.text(data)
            // show message action 
                if (data.toLowerCase().includes("failed")) {
                boxMess.removeClass("bg-success").addClass("bg-danger")
            } else {
                boxMess.removeClass("bg-danger").addClass("bg-success")
            }
            // hide message action
            setTimeout(() => {
                boxMess.addClass("fade")
            }, 3000)
        },
        error: function (Error) {
            
        }
        
    });
    function validatePhoneNumber(phoneNumber) {
    const phoneRegex = /^0\d{9}$/;
    return phoneRegex.test(phoneNumber);
}
function validateEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}
}