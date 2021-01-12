<%--
  Created by IntelliJ IDEA.
  User: Thang Dao
  Date: 12/8/2020
  Time: 8:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <form action="${pageContext.request.contextPath}/storeSalaryList" method="POST">
        <div class="row" id="divRaw">
            <div class="col-md-12">
                <div class="card">
                    <div class="content table-responsive">

                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="choose">Choose</label>
                                    </div>
                                    <select name="choose" class="custom-select form-control" id="choose">
                                        <option  value="0">Hight to Low</option>
                                        <option  value="1">Low to Hight</option>

                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Staff </label>
                                    <input type="text" name ="IdTeamSalary" id="IdTeamSalary" class="form-control" placeholder="Team Id" value="">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="Month">Month</label>
                                    </div>
                                    <select name="Month" class="custom-select form-control" id="Month">
                                        <option  value="1">January</option>
                                        <option  value="2">February</option>
                                        <option  value="3">March</option>
                                        <option  value="4">April</option>
                                        <option  value="5">May</option>
                                        <option  value="6">June</option>
                                        <option  value="7">July</option>
                                        <option  value="8">August</option>
                                        <option  value="9">September</option>
                                        <option  value="10">October</option>
                                        <option  value="11">November</option>
                                        <option  value="12">December</option>
                                        <option  value="13">Bonus Year</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="Year">Year</label>
                                            </div>
                                            <select name="Year" class="custom-select form-control" id="Year">
                                                <option  value="2020">2020</option>
                                                <option  value="2021">2021</option>
                                                <option  value="2022">2022</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <button type="submit" id="submitSalary" name="submitSalary" class="btn btn-info btn-fill left" >Search Salary</button>
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
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card">
                    <div class="header">
                        <h4 class="title">Select your Option</h4>
                        <p class="category">and wait we a second : </p>
                        <p class="category">${errorString}</p>
                    </div>

                    <div class="content">
                        <a href="#" class="dropdown" data-toggle="dropdown">
                            Salary store:
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu ">
                            <li><a href="#">Low to Hight</a></li>
                            <li><a href="#">Hight to Low</a></li>
                            <li><a href="#">Follow Team</a></li>
                            <li><a href="#">All</a></li>
                        </ul>
                    </div>

                </div>
            </div>

        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card">
                    <div class="header">
                        <h4 class="title "><b>List Salary</b></h4>
                        <p class="category"> Get choose and see the result here</p>
                        <p class="category">${errorString}</p>
                    </div>
                    <div class="content">
                        <div class="table-responsive" >
                            <table class="table table-hover">
                                <thead>
                                <th>Month</th>
                                <th>Year</th>
                                <th>Name</th>
                                <th>Team</th>
                                <th>Fixed salary</th>
                                <th>Bonus</th>
                                <th>Salary</th>
                                <th scope="col" ></th>
                                </thead>
                                <tbody>
                                <c:forEach items="${SalaryList}" var="Salary" >
                                    <tr>

                                        <td>${Salary.month}</td>
                                        <td>${Salary.year}</td>
                                        <td>${Salary.name}</td>
                                        <td>#${Salary.teamName}</td>
                                        <td>${Salary.fixsalary}$</td>
                                        <td>${Salary.bonus}$</td>
                                        <td>${Salary.salary}$</td>
                                        <td align="center">
                                            <a href="${pageContext.request.contextPath}/editSalary?id=${Project.id}" class="text-primary"><i class="fa fa-fw fa-edit"></i> Edit</a> |
                                            <a href="${pageContext.request.contextPath}/deleteSalary?id=${Project.id}" onClick="return confirm('Are you sure to delete this Team?');"><i class="fa fa-fw fa-trash"></i> Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card">
                    <div class="header">
                        <h4 class="title "><b>Salary Search</b></h4>
                    </div>
                    <div class="content">
                        <div class="table-responsive ">
                            <table class="table table-hover">
                                <thead>
                                <th>~</th>
                                <th>#Month</th>
                                <th>Year</th>
                                <th>Name</th>
                                <th>Team</th>
                                <th>Fixed salary</th>
                                <th>Bonus</th>
                                <th>Salary</th>
                                <th></th>
                                </thead>
                                <tbody>
                                <c:forEach items="${SalaryTeamList}" var="Salary1" >
                                    <tr>
                                        <th>@</th>
                                        <td>${Salary1.month}</td>
                                        <td>${Salary1.year}</td>
                                        <td>${Salary1.name}</td>
                                        <td>${Salary1.teamName}</td>
                                        <td>${Salary1.fixsalary}$</td>
                                        <td>${Salary1.bonus}$</td>
                                        <td>${Salary1.salary}$</td>
                                        <td align="center">
                                            <a href="${pageContext.request.contextPath}/editSalary?month?year?team=${Salary1.month},${Salary1.year},${Salary1.teamName}" class="text-primary"><i class="fa fa-fw fa-edit"></i> Edit</a> |
                                            <a href="${pageContext.request.contextPath}/deleteSalary?month?year?team=${Salary1.month},${Salary1.year},${Salary1.teamName}" onClick="return confirm('Are you sure to delete this Team?');"><i class="fa fa-fw fa-trash"></i> Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>





