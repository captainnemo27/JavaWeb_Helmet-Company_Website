<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="col-md-12">
    <div class="card-columns">
        <div class="header">

        </div>
        <div class="content">

        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="form-group">
            <div class="btn-group">
                <button id="btnToolTeam" type="button" class="btn btn btn-fill left"><span class="fa fa-bars"></span></button>
                <button  <%--id="btnAddStaff"--%> type="button" href="#myCarouselTeam" class="btn btn-info btn-fill left" data-slide-to="0" >Add Staff</button>
                <button  <%--id="btnAddTeam"--%> type="button" href="#myCarouselTeam" class="btn btn-info btn-fill left" data-slide-to="1" >Add Team</button>
                <button  <%--id="btnSearchTeam"--%> type="button" href="#myCarouselTeam" class="btn btn-info btn-fill left" data-slide-to="2" >Search Team</button>
            </div>
        </div>
    </div>
</div>
<div class="divClass" id="divToolTeam">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div id="myCarouselTeam"  class="carousel slide" >
                    <div class="carousel-inner">
                        <div class="carousel-item  active">
                            <div class="content table-responsive">
                                <div class="header">
                                    <h4 class="title"><b>Add Staff To Your Team</b></h4>
                                </div>
                                <div class="content">


                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Full NAME</label>
                                                <input type="text" name ="name Staff" id="staffName" class="form-control" placeholder="Full name" value="${staff.name}"  title="Fullname is your name, Please not null">
                                            </div>
                                        </div>

                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <div class="input-group-prepend">
                                                    <label class="input-group-text" for="staffSex">Sex</label>
                                                </div>
                                                <select name="sex" class="custom-select form-control" id="staffSex">
                                                    <option ${sex1} value="male">Male</option>
                                                    <option ${sex2} value="female">Female</option>
                                                    <option ${sex3} value="orther">Orther</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-2">

                                            <div class="form-group">
                                                <label>Date Of Birth</label>

                                                <input type="date" id="staffDateofbirth" name="dateOfBirth" class="form-control" placeholder="DateofBirth" value="${staff.dateOfBirth}">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <div class="input-group-prepend">
                                                    <label class="input-group-text" for="staffType">Type</label>
                                                </div>
                                                <select name="sex" class="custom-select form-control" id="staffType">
                                                    <option  value="Admin">Admin</option>
                                                    <option  value="LeaderTeam">Leader Team</option>
                                                    <option  value="Emp">Employ</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>User name</label>
                                                <input type="text" name="userName" id="staffUsername" class="form-control" placeholder="Username" pattern=[a-z]{1,15}" value="${staff.userName}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Password</label>
                                                <input type="text" name="userName" id="staffPassword" class="form-control" placeholder="password" value="${staff.passWord}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Address</label>
                                                <input type="text" name="address" id="staffAddress" class="form-control" placeholder="Home Address" value="${staff.address}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="staffEmail">Email address</label>
                                                <input type="email" id="staffEmail" name ="email" class="form-control" placeholder="Email"  value="${staff.email}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Phone number</label>
                                                <input type="tel" name="phone" id="staffPhone" class="form-control" placeholder="Phone number" value="${staff.phone}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Team</label>
                                                <input type="text" name="idTeam" id="staffIdTeam" class="form-control" placeholder="Team" value="${staff.idTeam}">
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
                                                <button type="submit" name="addStaff" id="addStaff" class="btn btn-info btn-fill pull-right">Add Staff</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="content table-responsive">
                                <div class="header">
                                    <h4 class="title"><b>Add A New Team</b></h4>
                                </div>
                                <div class="content">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Team Name</label>
                                                <input type="text" name ="teamName" id="teamName" class="form-control" placeholder="Team's name"   title="This is your Team Name, Please not null">
                                            </div>
                                        </div>


                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Admin Id</label>
                                                <input type="text" name ="Admin Id" id="teamIdAdmin"  class="form-control" placeholder="Admin Id"   title="This is the Id of Admin Team, Please not null">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="teamAddress">Address </label>
                                                <input type="text" id="teamAddress" name ="" class="form-control" placeholder="Address"  >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="teamEmail">Email </label>
                                                <input type="email" id="teamEmail" name ="email" class="form-control" placeholder="Email"  >
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Phone number</label>
                                                <input type="tel" name="phone" id="teamPhone" class="form-control" placeholder="Phone number" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <p class="text-danger pull-right">${errorStringAddTeam}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <button type="submit" name="submit" id="addTeam" class="btn btn-danger btn-fill pull-right">Add Team</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="content table-responsive">
                                <div class="header">
                                    <h4 class="title"><b>Search A Team</b></h4>
                                </div>
                                <div class="content">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Team Name</label>
                                                <input type="text" name ="teamName" class="form-control" placeholder="Team's name"   title="This is your Team Name, Please not null">
                                            </div>
                                        </div>

                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Team Id</label>
                                                <input type="text" name ="Team Id" class="form-control" placeholder="Team Id"   title="This is the Id of New Team, Please not null">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Admin Id</label>
                                                <input type="text" name ="Admin Id" class="form-control" placeholder="Admin Id"   title="This is the Id of Admin Team, Please not null">
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
                                                <button type="submit" name="submit" id="searchTeam" class="btn btn-outline-primary btn-fill pull-right">Search Team</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="content table-responsive">
                                <div class="header">
                                    <h4 class="title"><b>Update Staff</b></h4>
                                </div>
                                <div class="content">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Full NAME</label>
                                                <input type="text" name ="name Staff" id="staffNameUD" class="form-control" placeholder="Full name" value="${staff.name}"  title="Fullname is your name, Please not null">
                                            </div>
                                        </div>

                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <div class="input-group-prepend">
                                                    <label class="input-group-text" for="staffSex">Sex</label>
                                                </div>
                                                <select name="sex" class="custom-select form-control" id="staffSexUD">
                                                    <option ${sex1} value="male">Male</option>
                                                    <option ${sex2} value="female">Female</option>
                                                    <option ${sex3} value="orther">Orther</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-2">

                                            <div class="form-group">
                                                <label>Date Of Birth</label>

                                                <input type="date" id="staffDateofbirthUD" name="dateOfBirth" class="form-control" placeholder="DateofBirth" value="${staff.dateOfBirth}">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <div class="input-group-prepend">
                                                    <label class="input-group-text" for="staffType">Type</label>
                                                </div>
                                                <select name="sex" class="custom-select form-control" id="staffTypeUD">
                                                    <option  value="Admin">Admin</option>
                                                    <option  value="LeaderTeam">Leader Team</option>
                                                    <option  value="Emp">Employ</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>User name</label>
                                                <input type="text" name="userName" id="staffUsernameUD" class="form-control" placeholder="Username" pattern=[a-z]{1,15}" value="${staff.userName}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Password</label>
                                                <input type="text" name="userName" id="staffPasswordUD" class="form-control" placeholder="password" value="${staff.passWord}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Address</label>
                                                <input type="text" name="address" id="staffAddressUD" class="form-control" placeholder="Home Address" value="${staff.address}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="staffEmail">Email address</label>
                                                <input type="email" id="staffEmailUD" name ="email" class="form-control" placeholder="Email"  value="${staff.email}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Phone number</label>
                                                <input type="tel" name="phone" id="staffPhoneUD" class="form-control" placeholder="Phone number" value="${staff.phone}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Team</label>
                                                <input type="text" name="idTeam" id="staffIdTeamUD" class="form-control" placeholder="Team" value="${staff.idTeam}">
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
                                                <button type="submit" name="addStaff" id="updateStaff" class="btn btn-info btn-fill pull-right">Update Staff</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="divClass" id="divEditTeam">


</div>
<div class="content">
    <div class="container-fluid ">


    </div>
</div>
<c:if test="${not empty teamEdit}">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="content table-responsive">
                    <div class="header">
                        <h4 class="title"><b>Edit Team</b></h4>
                    </div>
                    <div class="content">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Team Name</label>
                                    <input type="text" name ="teamName" id="teamNameEdit" class="form-control" placeholder="Team's name" value="${teamEdit.name}"  title="This is your Team Name, Please not null">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>Team Id</label>
                                    <input type="text" name ="teamName" id="teamIdEdit" class="form-control" disabled placeholder="Id's name" value="${teamEdit.id}"  title="This is your Team Name, Please not null">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Admin Id</label>
                                    <input type="text" name ="Admin Id" id="teamIdAdminEdit"  class="form-control" placeholder="Admin Id" value="${teamEdit.idAdmin}"   title="This is the Id of Admin Team, Please not null">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="teamAddress">Address </label>
                                    <input type="text" id="teamAddressEdit" name ="" class="form-control" placeholder="Address"  value="${teamEdit.address}" >
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="teamEmail">Email </label>
                                    <input type="email" id="teamEmailEdit" name ="email" class="form-control" placeholder="Email"  value="${teamEdit.email}" >
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Phone number</label>
                                    <input type="tel" name="phone" id="teamPhoneEdit" class="form-control" placeholder="Phone number" value="${teamEdit.phone}">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <p class="text-danger pull-right">${errorStringAddTeam}</p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <button type="submit" name="submit" id="editTeam" class="btn btn-danger btn-fill pull-right">Update Team</button>
                                </div>
                            </div>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</c:if>


<div class="row">
    <div class="col-md-6">
        <div class="card text-white bg-secondary ">
            <div class="header">
                <h4 class="title text-info "><b>List Team of TrungLeo's HELMET COMPANY</b></h4>
                <p class="category">Team: </p>
                <p class="text-danger">${errorStringDel}</p>
            </div>
            <div class="content">
                <div class="table-responsive table-active">
                    <table class="table table-hover ">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col" >#</th>
                            <th scope="col" >Name</th>
                            <th scope="col" >Phone</th>
                            <th scope="col" >Email</th>
                            <th scope="col" ></th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${TeamList}" var="Team" >
                            <tr href="${pageContext.request.contextPath}/storeProjectOfTeam" >
                                <td ><b>${Team.id}</b></td>
                                <td >${Team.name} </td>
                                <td >${Team.phone} </td>
                                <td >${Team.email}</td>
                                <td  align="center">
                                    <a href="${pageContext.request.contextPath}/storeStaffOfTeam?id=${Team.id}" class="text-warning"><i class="fa fa-address-book"></i>Staff</a>
                                    <a href="${pageContext.request.contextPath}/storeProjectOfTeam?id=${Team.id}" class="text-warning"><i class="fa fa-address-book"></i> Project</a> |
                                    <a href="${pageContext.request.contextPath}/storeEditTeam?id=${Team.id}" class="text-primary" id="btnEditTeam" ><i  class="fa fa-fw fa-edit"></i> Edit</a> |
                                    <a href="${pageContext.request.contextPath}/deleteTeam?id=${Team.id}&status=${Team.status}" onClick="return confirm('Are you sure to delete this Team?');"><i class="fa fa-fw fa-trash"></i> Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <c:if test="${not empty ProjectList}">
        <div class="col-md-6">
            <div class="card">
                <div class="header">
                    <h4 class="title text-info"><b>Project Of Team ${idteam} : </b></h4>
                </div>
                <div class="content">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th></th>
                                <th scope="col">#</th>
                                <th scope="col">Name</th>
                                <th scope="col">Content</th>
                                <th scope="col">FROM</th>
                                <th scope="col">TO</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${ProjectList}" var="Project" >
                                <tr>
                                    <td></td>
                                    <th scope="row">${Project.id}</th>
                                    <td >${Project.name}</td>
                                    <td>${Project.content}</td>
                                    <td class="text-warning" >${Project.timeFrom}</td>
                                    <td class="text-danger" >${Project.timeEnd}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </c:if>
</div>
<c:if test="${not empty StaffList}">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="header">
                    <h4 class="title text-info"><b>Staff Of Team ${nameTeam} :</b> </h4>
                </div>
                <div class="content">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th></th>
                                <th scope="col">#</th>
                                <th scope="col">Name</th>
                                <th scope="col">Address</th>
                                <th scope="col">Phone</th>
                                <th scope="col">Sex</th>
                                <th scope="col">Team</th>
                                <th scope="col">NumTask</th>
                                <th scope="col">Type</th>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${StaffList}" var="Staff" >
                                <tr>
                                    <td></td>
                                    <th scope="row">${Staff.id}</th>
                                    <td >${Staff.name}</td>
                                    <td>${Staff.address}</td>
                                    <td >${Staff.phone}</td>
                                    <td >${Staff.sex}</td>
                                    <td >${Staff.idTeam}</td>
                                    <td class="text-danger" >${Staff.numTask}</td>
                                    <td class="text-info" >${Staff.type}</td>

                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:if>


