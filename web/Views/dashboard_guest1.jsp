<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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



    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

    <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />

    <link href='assets/css/fullcalendar.css' rel='stylesheet' />
    <link href='assets/css/fullcalendar.print.css' rel='stylesheet' media='print' />




</head>
<body>


<div class="wrapper">
    <div class="sidebar" data-color="blue" data-image="assets/img/sidebar-4.jpg">
        <jsp:include page="sidebar_guest.jsp" ></jsp:include>
    </div>

    <div class="main-panel">
        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-prev"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="dashboard_guest">Dashboard</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="${pageContext.request.contextPath}/login">
                            <b>Log in</b>
                        </a>
                    </li>

                        <li class="separator hidden-lg"></li>
                    </ul>
                </div>
                <div id="u3" class="ax_default heading_3">
                    <div id="u3_div" class=""></div>
                </div>
            </div>
        </nav>
        <div class="content table-responsive">
            <div class="container-fluid">
                <div class="row"><div class="col-md-12">
                    <div id="myCarousel1" class="carousel slide" data-ride="carousel">

                        <div  class="carousel-inner">
                            <div class="carousel-item active">
                                <img class="img-responsive" class="img-responsive" src="assets/img/Asset%203.png" width="1600" height="400"/>
                            </div>
                            <div class="carousel-item ">
                                <img class="img-responsive" src="assets/img/Asset4.png" width="1600" height="400"/>
                            </div>
                            <div class="carousel-item">
                                <img class="img-responsive" src="assets/img/Asset5.png"  width="1600" height="400"/>
                            </div>
                            <div class="carousel-item">
                                <img class="img-responsive" src="assets/img/Asset6.png"  width="1600" height="400"/>
                            </div>
                            <div class="carousel-item">
                                <img class="img-responsive" src="assets/img/Asset7.png"  width="1600" height="400"/>
                            </div>
                            <div class="carousel-item">
                                <img class="img-responsive" src="assets/img/Asset8.png" width="1600" height="400"/>
                            </div>

                        </div>
                        <a class="carousel-control-prev" href="#myCarousel1" data-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a class="carousel-control-next" href="#myCarousel1" data-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </a>
                    </div>
                </div></div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card"></div></div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="header">
                                <h4 class="title text-warning ">Welcome TrungLeo's HELMET COMPANY</h4>
                                <p class="category text-warning  "><i>ABOUT US</i></p>
                                <p class="category">${errorString}</p>
                            </div>
                            <div class="content ">

                                <p class="text-black category">
                                    Trung Leo’s Helmet is the biggest helmets in VietNam according to consumer experience. The principle activities of the Trung Leo’s Helmet are produce and distribute travel helmets, gloves, coat, …
                                </p>

                                <i class=" category text-black ">

                                    We have the leading distribution network in Vietnam, giving us broad access to consumer. We generate a substantial majority of our revenues from sales of our products in Vietnam. We market the majority of our products under our “Trung Leo’s Helmets” brand, which has been designated as both a Famous Brand and one of the Top 100 Strongest Brands in 2006.
                                </i>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card ">
                            <div class="header">
                                <h4 class="title">2020 Sales</h4>
                                <p class="category">All products including Helmet</p>
                            </div>
                            <div class="content table-responsive ">
                                <div id="chartActivity" class="ct-chart"></div>

                                <div class="footer">
                                    <div class="legend">
                                        <i class="fa fa-circle text-info"></i> fullFace Racing S
                                        <i class="fa fa-circle text-danger"></i> Raw 5 Series
                                    </div>
                                    <hr>
                                    <div class="stats">
                                        <i class="fa fa-check"></i> Data information certified
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">


                        <div class="col-md-6">
                            <div class="card">
                                <div class="header">
                                    <h4 class="title">Task Running</h4>
                                    <p class="category">24 Hours performance</p>
                                </div>
                                <div class="content table-responsive">
                                    <%--<div id="chartHours" class="ct-chart"></div>--%>
                                    <table class="table table-info">
                                        <thead>
                                        <tr>
                                            <th></th>
                                            <th scope="col">#</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Content</th>
                                            <th scope="col">IdProject</th>
                                            <th scope="col">Deadline</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${TaskList}" var="Task" >
                                            <tr>
                                                <th></th>
                                                <th scope="row">1</th>
                                                <td>${Task.name}</td>
                                                <td>${Task.content}</td>
                                                <td>${Task.idProject}</td>
                                                <td>${Task.timeEnd}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card ">
                                <div class="header">
                                    <h4 class="title">New Products</h4>
                                    <p class="category">Helmets full face</p>
                                </div>
                                <div class="content">
                                    <div id="myCarousel" class="carousel slide" data-ride="carousel">

                                        <div  class="carousel-inner">
                                            <div class="carousel-item active">
                                                <img src="assets/img/f2-600x600.jpg" width="740" height="740"/>
                                            </div>
                                            <div class="carousel-item">
                                                <img src="assets/img/f3-600x600.jpg"  width="740" height="740"/>
                                            </div>
                                            <div class="carousel-item">
                                                <img src="assets/img/f4-600x600.jpg"  width="740" height="740"/>
                                            </div>
                                            <div class="carousel-item">
                                                <img src="assets/img/f5-600x600.jpg" width="740" height="740"/>
                                            </div>
                                            <div class="carousel-item">
                                                <img src="assets/img/f6-600x600.jpg"  width="740" height="740"/>
                                            </div>
                                            <div class="carousel-item">
                                                <img src="assets/img/f7-600x600.jpg" width="740" height="740"/>
                                            </div>
                                            <div class="carousel-item">
                                                <img src="assets/img/f8-600x600.jpg" width="740" height="740"/>
                                            </div>
                                            <div class="carousel-item">
                                                <img src="assets/img/f9-600x600.jpg" width="740" height="740"/>
                                            </div>
                                        </div>
                                        <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
                                            <span class="carousel-control-prev-icon"></span>
                                        </a>
                                        <a class="carousel-control-next" href="#myCarousel" data-slide="next">
                                            <span class="carousel-control-next-icon"></span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">

                    </div>


                </div>

            </div>
        </div>
        <footer class="footer">
            <jsp:include page="footer.jsp" ></jsp:include>
        </footer>
    </div>
</div>

</body>


<!--   Core JS Files   -->
<script src="assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>


<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>
<script src="assets/js/bootstrap-select.js"></script>
<!--  Google Maps Plugin    -->


<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

<script src='assets/js/jquery-1.10.2.js' type="text/javascript"></script>
<script src='assets/js/jquery-ui.custom.min.js' type="text/javascript"></script>
<script src='assets/js/fullcalendar.js' type="text/javascript"></script>
<%--<script>
    $(document).ready(function(){
        $('#myCarousel').carousel({
            interval: 2000
        });

        $('#myCarousel').on('slid', function () {
            //alert("Slide Event");
            console.log('slid event');
        });

        $(".carousel-control-prev").click(function(){
            $("#myCarousel").carousel("prev");
        });
        $(".carousel-control-next").click(function(){
            $("#myCarousel").carousel("next");
        });

        $('#myCarouselTeam').carousel("pause");

        $('#btnAddStaff').click(function(){
            $('#myCarouselTeam').carousel(0);
        });

        $('#btnAddTeam').click(function(){
            $('#myCarouselTeam').carousel(1);
        });
    });

</script>--%>

</html>

