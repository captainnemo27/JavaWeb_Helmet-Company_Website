<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <c:if test="${not empty user}">
        <form action="${pageContext.request.contextPath}/user" method="POST">
            <div class="col-md-8">
                <div class="card">
                    <div class="header">
                        <h4 class="title">Edit Account</h4>
                    </div>
                    <div class="content">

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Account</label>
                                    <input type="text" name ="name" class="form-control" placeholder="Full name" value="${user.userName}">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Username</label>
                                    <input type="text" name="userName" class="form-control" placeholder="Username" value="${staff.userName}">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                        <%--@declare id="exampleinputemail1"--%><label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name ="email" class="form-control" placeholder="Email" value="${staff.email}">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Phone number</label>
                                    <input type="tel" name="phone" class="form-control" placeholder="Phone number" value="${staff.phone}">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Address</label>
                                    <input type="text" name="address" class="form-control" placeholder="Home Address" value="${staff.address}">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Team</label>
                                    <input type="text" name="idTeam" class="form-control" placeholder="Team" value="${staff.idTeam}">
                                </div>
                            </div>
                            <div class="col-md-6">

                                <div class="form-group">
                                    <label>Date Of Birth</label>
                                    <input type="date" name="dateOfBirth" class="form-control" placeholder="DateofBirth" value="${staff.dateOfBirth}">
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>About Me</label>
                                    <textarea rows="9" name="aboutStaff" class="form-control" placeholder="Here can be your description" >${staff.aboutStaff}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <p class="text-danger pull-right">${errorString}</p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <button type="submit" name="submit" class="btn btn-info btn-fill pull-right">Update Profile</button>
                                </div>
                            </div>
                        </div>

                        <div class="clearfix"></div>

                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card card-user">
                    <div class="image">
                        <img src="https://ununsplash.imgix.net/photo-1431578500526-4d9613015464?fit=crop&fm=jpg&h=300&q=75&w=400" alt="..."/>
                    </div>
                    <div class="content">
                        <div class="author">
                            <a href="#">
                                <img class="avatar border-gray" src="assets/img/faces/face-3.jpg" alt="..."/>

                                <h4 class="title">${staff.name}<br />
                                    <small>${staff.userName}</small>
                                </h4>
                            </a>
                        </div>
                        <p class="description text-center"> "${staff.aboutStaff}"
                        </p>
                    </div>
                    <hr>
                    <div class="text-center">
                        <button href="#" class="btn btn-simple"><i class="fa fa-facebook-square"></i></button>
                        <button href="#" class="btn btn-simple"><i class="fa fa-twitter"></i></button>
                        <button href="#" class="btn btn-simple"><i class="fa fa-google-plus-square"></i></button>

                    </div>
                </div>
            </div>
        </form>
    </c:if>
</div>