<%--
  Created by IntelliJ IDEA.
  User: Thang Dao
  Date: 12/8/2020
  Time: 3:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>TrungLEo's ${Name}</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" type='text/css' rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" type='text/css' rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->


    <link href="assets/css/light-bootstrap-dashboard.css?v=1.4.0" type='text/css' rel="stylesheet"/>


    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />


    <link rel="stylesheet" href="https://rawgit.com/gionkunz/chartist-js/master/dist/chartist.min.css">

    <link href='assets/css/fullcalendar.css'  type='text/css' rel='stylesheet' />

    <link href='assets/css/fullcalendar.print.css'  type='text/css' rel='stylesheet' media='print' />
    <style>
        .carousel-inner {
            width: 100%;
            height: 100%;
        }
        .divClass
        {
            padding:5px;
            border:solid 0px;
        }
        .divClass
        {
            padding:50px;
            display:none;
        }
    </style>
</head>
<body>

<div class="wrapper">
    <div class="sidebar" data-color="blue" data-image="assets/img/sidebar-4.jpg">
        <jsp:include page="sidebar.jsp" ></jsp:include>
    </div>
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
                        <a class="navbar-brand" href="#">${Name}</a>
                        <a class="navbar-brand text-danger " href="#"><div class="spinner-border text-warning"></div>HELMET COMPANY - SAIGON - HANOI - DANANG</a>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-left">
                            <li>
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-dashboard"></i>
                                    <p class="hidden-lg hidden-md">${Name}</p>
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
                                <a href="${pageContext.request.contextPath}/user">
                                    <p> ${user.displayName}</p>
                                </a>
                            </li>
                            <li class="dropdown">
                                <a href="#"  class="dropdown-toggle" data-toggle="dropdown">
                                    <p>
                                        Dropdown
                                        <b class="caret"></b>
                                    </p>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="${pageContext.request.contextPath}/user">User Info</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li><a href="#">Something</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li><a href="${pageContext.request.contextPath}/changePassword">send password to my gmail</a></li>
                                    <li class="divider"></li>
                                    <li><a href="${pageContext.request.contextPath}/${ItemMenu}">Refresh</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="dashboard_guest1">
                                    <p>Log out</p>
                                </a>
                            </li>
                            <li class="separator hidden-lg"></li>
                        </ul>
                    </div>

                </div>
            </nav>

            <div class="content bg-info" >
                <div class="container-fluid" >
                    <jsp:include page="${ItemMenu}.jsp" ></jsp:include>
                </div>
            </div>

            <footer class="footer">
                <jsp:include page="footer.jsp" ></jsp:include>
            </footer>
        </div>
</div>

</body>


<!--   Core JS Files   -->
<script src="assets/js/bootstrap-switch.js" type="text/javascript"></script>
<script src="assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<%--<script src="assetLogin/vendor/bootstrap/js/tooltip.js" type="text/javascript"></script>
<script src="assetLogin/vendor/bootstrap/js/bootstrap.js" type="text/javascript"></script>--%>



<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->


<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
<script src='assets/js/jquery-1.10.2.js' type="text/javascript"></script>
<script src='assets/js/jquery-ui.custom.min.js' type="text/javascript"></script>
<script src='assets/js/fullcalendar.js' type="text/javascript"></script>

<script src="https://rawgit.com/gionkunz/chartist-js/master/dist/chartist.min.js"></script>



<script>

    $(document).ready(function(){

        $('#textName').keyup(function() {
            sendData();
        });
        $('#submit1').click(function() {
            sendData();
        });

    });
    function sendData(){

        var textName = $('#textName').val();
        var idProject =$('#idProject').val();
        var idStaff = $('#idStaff').val();
        var timefrom = $('#timeFrom').val();
        var timeend = $('#timeEnd').val();
                //alert(textName);
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/storeTaskName",
            data: { name : textName,idProject:idProject,idStaff:idStaff},
        });
    }
</script>
<script>

    $(document).ready(function() {
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();



        $('#external-events div.external-event').each(function() {

            // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
            // it doesn't need to have a start or end
            var eventObject = {
                title: $.trim($(this).text()) ,// use the element's text as the event title
                name:  $.trim($(this).text())
            };

            // store the Event Object in the DOM element so we can get to it later
            $(this).data('eventObject', eventObject);

            // make the event draggable using jQuery UI
            $(this).draggable({
                zIndex: 999,
                revert: true,      // will cause the event to go back to its
                revertDuration: 0  //  original position after the drag
            });

        });


        /* initialize the calendar
        -----------------------------------------------------------------*/

        var calendar =  $('#calendar').fullCalendar({
            header: {
                left: 'title,addEventButton',
                center: 'agendaDay,agendaWeek,month',
                right: 'prev,next today'
            },

            editable: true,
            firstDay: 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
            selectable: true,
            defaultView: 'month',

            axisFormat: 'h:mm',
            columnFormat: {
                month: 'ddd',    // Mon
                week: 'ddd d', // Mon 7
                day: 'dddd M/d',  // Monday 9/7
                agendaDay: 'dddd d'
            },
            titleFormat: {
                month: 'MMMM yyyy', // September 2009
                week: "MMMM yyyy", // September 2009
                day: 'MMMM yyyy'                  // Tuesday, Sep 8, 2009
            },
            allDaySlot: false,
            selectHelper: true,
            select: function(start,  allDay) {
                var title = prompt('Task Title:');
                var end = prompt('Task End thang dao(YYYY-MM-DD) : ');
                if (title) {
                    calendar.fullCalendar('renderEvent',
                        {
                            name: 'task1',
                            title: title,
                            start: start,
                            end: end,
                            allDay: allDay,
                            classname: 'dark'
                        },
                        true // make the event "stick"
                    );
                }
                calendar.fullCalendar('unselect');
            },
            droppable: true, // this allows things to be dropped onto the calendar !!!
            drop: function(date, allDay) { // this function is called when something is dropped

                // retrieve the dropped element's stored Event Object
                var originalEventObject = $(this).data('eventObject');

                // we need to copy it, so that multiple events don't have a reference to the same object
                var copiedEventObject = $.extend({}, originalEventObject);

                // assign it the date that was reported
                copiedEventObject.start = date;
                copiedEventObject.allDay = allDay;

                // render the event on the calendar
                // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
                $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

                // is the "remove after drop" checkbox checked?
                if ($('#drop-remove').is(':checked')) {
                    // if so, remove the element from the "Draggable Events" list
                    $(this).remove();
                }

            },

            events: [

                {
                    title: 'Hieu',
                    start: new Date(y, m, d),
                    end: new Date(y, m, 29),
                    url: 'http://google.com/',
                    className: 'success'
                }
            ],

        });


    });

</script>

</html>