<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row"><div class="col-md-12">
<div id="myCarousel1" class="carousel slide" data-ride="carousel">

    <div  class="carousel-inner">
        <div class="carousel-item active">
            <img class="img-responsive" src="assets/img/Asset%203.png" width="1600" height="400"/>
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



