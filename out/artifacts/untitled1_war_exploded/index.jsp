<%--
  Created by IntelliJ IDEA.
  User: Thang Dao
  Date: 12/8/2020
  Time: 3:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <link rel="icon" type="image/png" href="assets/img/favicon.ico">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

  <title>TrungLEo's Dashboard</title>

  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
  <meta name="viewport" content="width=device-width" />


  <!-- Bootstrap core CSS     -->
  <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

  <!-- Animation library for notifications   -->
  <link href="assets/css/animate.min.css" rel="stylesheet"/>

  <!--  Light Bootstrap Table core CSS    -->
  <link href="assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>


  <!--  CSS for Demo Purpose, don't include it in your project     -->
  <link href="assets/css/demo.css" rel="stylesheet" />


  <!--     Fonts and icons     -->
  <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
  <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
  <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />

</head>
<body>

<div class="wrapper">
  <div class="sidebar" data-color="purple" data-image="assets/img/sidebar-5.jpg">
    <jsp:include page="/Views/sidebar_guest.jsp" ></jsp:include>
    <div class="main-panel">
      <nav class="navbar navbar-default navbar-fixed">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Dashboard</a>
          </div>
          <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-left">
              <li>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-dashboard"></i>
                  <p class="hidden-lg hidden-md">Dashboard</p>
                </a>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-globe"></i>
                  <b class="caret hidden-lg hidden-md"></b>
                  <p class="hidden-lg hidden-md">
                    5 Notifications
                    <b class="caret"></b>
                  </p>
                </a>
                <ul class="dropdown-menu">
                  <li><a href="#">Notification 1</a></li>
                  <li><a href="#">Notification 2</a></li>
                  <li><a href="#">Notification 3</a></li>
                  <li><a href="#">Notification 4</a></li>
                  <li><a href="#">Another notification</a></li>
                </ul>
              </li>
              <li>
                <a href="">
                  <i class="fa fa-search"></i>
                  <p class="hidden-lg hidden-md">Search</p>
                </a>
              </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
              <li>
                <a href="">
                  <p>Account</p>
                </a>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <p>
                    Dropdown
                    <b class="caret"></b>
                  </p>

                </a>
                <ul class="dropdown-menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something</a></li>
                  <li class="divider"></li>
                  <li><a href="#">Separated link</a></li>
                </ul>
              </li>
              <li>
                <a href="logout">
                  <p>Log out</p>
                </a>
              </li>
              <li class="separator hidden-lg"></li>
            </ul>
          </div>
          <div id="u3" class="ax_default heading_3">
            <div id="u3_div" class=""></div>
            <div id="u3_text" class="text ">
              <p><span>HELMET COMPANY - SAIGON - HANOI - DANANG</span></p>
            </div>
          </div>
        </div>
      </nav>

      <div class="content">
        <div class="container-fluid">
          <jsp:include page="/Views/dashboard.jsp" ></jsp:include>
        </div>
      </div>
      <footer class="footer">
        <jsp:include page="/Views/footer.jsp" ></jsp:include>
      </footer>
    </div>
  </div>
</div>

</body>

<!--   Core JS Files   -->
<script src="assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js"></script>

<script type="text/javascript">
  $(document).ready(function(){

    demo.initChartist();

    $.notify({
      icon: 'pe-7s-gift',
      message: "Welcome to <b>TrungLeo'sHelmet</b> - Life for a Ride."

    },{
      type: 'info',
      timer: 4000
    });

  });
</script>

</html>
