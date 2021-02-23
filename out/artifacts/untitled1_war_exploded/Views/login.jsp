<%--
  Created by IntelliJ IDEA.
  User: Thang Dao
  Date: 12/10/2020
  Time: 5:11 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login </title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->
    <link href="assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->



    <!--     Fonts and icons     -->
    <link href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css' rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />

    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="assetLogin/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="assetLogin/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="assetLogin/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="assetLogin/fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="assetLogin/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="assetLogin/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="assetLogin/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="assetLogin/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="assetLogin/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="assetLogin/css/util.css">
    <link rel="stylesheet" type="text/css" href="assetLogin/css/main.css">
    <!--===============================================================================================-->

    <style>
        .pass_show{position: relative}

        .pass_show .ptxt {

            position: absolute;

            top: 50%;

            right: 10px;

            z-index: 1;

            color: #f36c01;

            margin-top: -10px;

            cursor: pointer;

            transition: .3s ease all;

        }

        .pass_show .ptxt:hover{color: #333333;}


    </style>
</head>
<body>

<div class="limiter">
    <div class="container-login100" style="background-image: url('assetLogin/images/1.png');">

        <div class="wrap-login100">

            <form method="POST" action="${pageContext.request.contextPath}/login" class="login100-form validate-form">
                <img class="img-responsive" src="assets/img/Asset%202.png"/>

                <span class="login100-form-title p-b-34 p-t-27">
						Log in TRUNGLEO'S HELMET
					</span>

                <div class="wrap-input100 validate-input" data-validate = "Enter username">
                    <input class="input100" type="text" name="userName" placeholder="Username" value="${user.userName}" >
                    <span class="focus-input100" data-placeholder="&#xf207;"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Enter password">
                    <input class="input100" type="password" name="password" placeholder="Password"  value="${user.passWord}">
                    <span class="focus-input100" data-placeholder="&#xf191;"></span>
                </div>
                <a class="text-danger">${errorString}</a>
                <div class="contact100-form-checkbox">
                    <input class="input-checkbox100" id="ckb1" type="checkbox" name="rememberme">
                    <label class="label-checkbox100" for="ckb1">
                        Remember me
                    </label>
                </div>

                <div class="container-login100-form-btn">
                    <button  class="login100-form-btn">
                        Login
                    </button>
                </div>

                <div class="text-center p-t-50">
                    <a class="txt1" href="#">
                        Forgot Password?
                    </a>
                </div>
                <div class="text-center p-t-50">
                    <a class="txt1" href="${pageContext.request.contextPath}/dashboard_guest1">
                        Go to Dashboard Not Account
                    </a>
                </div>
            </form>

        </div>
    </div>
</div>


<div id="dropDownSelect1"></div>
<script>
    $(document).on('click','.pass_show .ptxt', function(){

        $(this).text($(this).text() === "Show" ? "Hide" : "Show");

        $(this).prev().attr('type', function(index, attr){return attr === 'password' ? 'text' : 'password'; });

    });
</script>
<!--===============================================================================================-->
<script src="assetLogin/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="assetLogin/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="assetLogin/vendor/bootstrap/js/popper.js"></script>
<script src="assetLogin/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="assetLogin/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="assetLogin/vendor/daterangepicker/moment.min.js"></script>
<script src="assetLogin/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="assetLogin/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="assetLogin/js/main.js"></script>

</body>
</html>
<%--
<html>
<body>
<script>
    function toDataURL(url, callback) {
        var httpRequest = new XMLHttpRequest();
        httpRequest.onload = function() {
            var fileReader = new FileReader();
            fileReader.onloadend = function() {
                callback(fileReader.result);
            }
            fileReader.readAsDataURL(httpRequest.response);
        };
        httpRequest.open('GET', url);
        httpRequest.responseType = 'blob';
        httpRequest.send();
    }
    toDataURL('https://www.tutorialspoint.com/videotutorials/images/tutor_connect_home.jpg', function(dataUrl) {
        document.write('Result in string:', dataUrl)
    })

</script>
</body>
</html>
--%>
>
