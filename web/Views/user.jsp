<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<c:if test="${not empty userError}">
    <div class="row">
        <div class="col-md-6">
            <div class="card text-white bg-secondary ">
                <div class="header">
                    <h4 class="title text-danger "><b>your account is not a Staff</b></h4>
                </div>
                <div class="content"></div>
            </div>
        </div>
    </div>
</c:if>
    <div class="row">
        <form action="${pageContext.request.contextPath}/user" method="POST">
            <div class="col-md-8">
                <div class="card">
                    <div class="header">
                        <h4 class="title"><b>Edit Profile</b></h4>
                    </div>
                    <div class="content">


                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>FULLNAME</label>
                                    <input type="text" name ="name" class="form-control" placeholder="Full name" value="${staff.name}"    title="Fullname is your name, Please not null">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Username</label>
                                    <input type="text" name="userName" id="userNameCPW" class="form-control" disabled placeholder="Username" pattern="[a-z]{1,15}" value="${staff.userName}">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="02">Sex</label>
                                    </div>
                                    <select name="sex" class="custom-select form-control" id="02">
                                        <option ${sex1} value="male">Male</option>
                                        <option ${sex2} value="female">Female</option>
                                        <option ${sex3} value="orther">Orther</option>
                                    </select>

                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="exampleEmail1">Email address</label>
                                    <input type="email" id="exampleEmail1" name ="email" class="form-control" placeholder="Email"  value="${staff.email}">
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

    </div>
    <div class="row">
        <div class="col-md-8">
            <div class="card">
                <div class="header">
                    <h4 class="title"><b>Change password</b></h4>
                </div>
                <div class="content">

                    <div class="row">

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Old Password</label>
                                <div class="pass_show">
                                    <input type="password" name ="oldPassword" id="oldPassword" class="form-control" placeholder="Old Password"  title=" Please not null">
                                    <span class="ptxt">Show</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>New Password</label>
                                <div class="pass_show">
                                    <input type="password" name ="newPassword" id="newPassword"  class="form-control" placeholder="New Password"  title=" Please not null">
                                    <span class="ptxt">Show</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <button type="submit" name="submit1" id ="btnCPW" class="btn btn-info btn-fill pull-right">change password</button>
                            </div>
                        </div>
                    </div>

                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>

