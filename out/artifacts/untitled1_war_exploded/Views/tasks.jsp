<%--
  Created by IntelliJ IDEA.
  User: Thang Dao
  Date: 12/8/2020
  Time: 3:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <button id="btnToolTask" type="button" class="btn btn btn-fill left"><span class="fa fa-bars"></span></button>
                <button  <%--id="btnAddStaff"--%> href="#myCarouselTeam" class="btn btn-dark  btn-fill left" data-slide-to="0" >Search Tasks</button>
                <button  <%--id="btnAddTeam"--%> href="#myCarouselTeam" class="btn btn-dark  btn-fill left" data-slide-to="1" >Book Task</button>
                <button  <%--id="btnSearchTeam"--%> href="#myCarouselTeam" class="btn btn-outline-primary btn-fill left" data-slide-to="2" >Edit Task</button>
                <button  <%--id="btnSearchTeam"--%> href="#" class="btn btn-dark btn-fill left"  >Tasks Deleted</button>
            </div>

        </div>
    </div>
</div>
<div class="divClass" id="divToolTask">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div id="myCarouselTeam"  class="carousel slide" >

                    <div class="carousel-inner">
                        <div class="carousel-item  active">
                            <form action="${pageContext.request.contextPath}/storeTaskName" method="POST">
                                <div class="content table-responsive">
                                    <div class="header">
                                        <h4 class="title">Search Tasks</h4>
                                    </div>
                                    <div class="content">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Name of Task</label>
                                                    <input type="text" name ="textName" id="textName" class="form-control" placeholder="Task's Name" value="">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Time From</label>
                                                    <input type="datetime-local" name="timeFrom" class="form-control" placeholder="TimeFrom" value="">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Time End</label>
                                                    <input type="datetime-local" name="timeEnd" class="form-control" placeholder="TimeEnd" value="">
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label >ID Project </label>
                                                            <input type="text" name="idProject" id="idProject" class="form-control" placeholder="ID Project" value="">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label >ID Staff </label>
                                                            <input type="text" name="idStaff" id="idStaff" class="form-control" placeholder="ID Staff" value="">
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <button type="submit" id="submit1" name="submit" class="btn btn-info btn-fill left" ><span class="fa fa-search"></span>  Search task</button>
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
                            </form>
                        </div>
                        <div class="carousel-item">
                            <div class="content table-responsive">

                                <div class="header">
                                    <h4 class="title">Book a Task</h4>
                                </div>
                                <div class="content">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Name of Task</label>
                                                <input type="text" name ="name1" id="name1" class="form-control" placeholder="Task's Name" value="">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Time From</label>
                                                <input type="datetime-local" name="timeFrom1" id="timeFrom1" class="form-control" placeholder="TimeFrom" value="">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Time End</label>
                                                <input type="datetime-local" name="timeEnd1" id="timeEnd1" class="form-control" placeholder="TimeEnd" value="">
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Content</label>
                                                <textarea rows="4" name="content1" id="content1" class="form-control" placeholder="Here be the content of task" ></textarea>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label >ID Project </label>
                                                        <input type="text" name="idproject1" id="idproject1" class="form-control" placeholder="ID Project" value="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label >ID Staff </label>
                                                        <input type="text" name="idstaff1" id="idstaff1" class="form-control" placeholder="ID Staff" value="">
                                                    </div>
                                                </div>
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
                                                <button type="submit" id="btn1" name = "submit" class="btn btn-danger btn-fill center" > <span class="fa fa-plus"></span> Book task</button>
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
                                    <h4 class="title">Edit Task</h4>
                                </div>
                                <div class="content">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label>Id of Task</label>
                                                <input type="text" name ="Id Task"  class="form-control" placeholder="Task's Id" value="">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <div class="input-group-prepend">
                                                    <label class="input-group-text" for="03">Status</label>
                                                </div>
                                                <select name="status" class="custom-select form-control" id="03">
                                                    <option  value="0">Running</option>
                                                    <option  value="1">Done</option>
                                                    <option  value="2">Stop</option>
                                                </select>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Name of Task</label>
                                                <input type="text" name ="name1"  class="form-control" placeholder="Task's Name" value="">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Time From</label>
                                                <input type="datetime-local" name="timeFrom1" class="form-control" placeholder="TimeFrom" value="">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Time End</label>
                                                <input type="datetime-local" name="timeEnd1"  class="form-control" placeholder="TimeEnd" value="">
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Content</label>
                                                <textarea rows="4" name="content1"  class="form-control" placeholder="Here be the content of task" ></textarea>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label >ID Project </label>
                                                        <input type="text" name="idproject1"  class="form-control" placeholder="ID Project" value="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label >ID Staff </label>
                                                        <input type="text" name="idstaff1"  class="form-control" placeholder="ID Staff" value="">
                                                    </div>
                                                </div>
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
                                                <button type="submit"  name = "submit" class="btn btn-outline-primary btn-fill center" >Update task</button>
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

<div class="content">
        <div class="container-fluid ">

        </div>
</div>

<c:if test="${not empty TaskNameList}">
    <div class="row">
        <div class="col-md-12">
            <div class="card ">
                <div class="header">
                    <h4 class="title text-info"><b>TASKS Search : </b></h4>

                </div>
                <div class="content table-responsive ">

                    <table class="table table-hover " >
                        <thead>
                        <tr>
                            <th></th>
                            <th scope="col">#</th>
                            <th scope="col">Name</th>
                            <th scope="col">Content</th>
                            <th scope="col">Project's name</th>
                            <th scope="col">Staff's name</th>
                            <th scope="col">Done</th>
                            <th scope="col">Start</th>
                            <th scope="col">To</th>
                            <th scope="col" ></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${TaskNameList}" var="Task" >
                            <tr>
                                <td></td>
                                <th >${Task.id}</th>
                                <td>${Task.name}</td>
                                <td>${Task.content}</td>
                                <td>${Task.nameProject}</td>
                                <td>${Task.nameStaff}</td>
                                <td >
                                    <label class="checkbox-info" >
                                        <input id="checkTask${Task.id}" value="${Task.id}" type="checkbox" onclick="myfunction(this)" <c:if test="${Task.statusTask==1}">checked</c:if> >
                                        <p class="text-danger pull-right">${errorString}</p>
                                    </label>
                                </td>
                                <td>${Task.timeFrom}</td>
                                <td>${Task.timeEnd}</td>
                                <td align="center">
                                    <a <%--href="${pageContext.request.contextPath}/editProject?id=${Project.id}"--%> class="text-primary"><i  class="fa fa-fw fa-edit"></i> Edit</a> |
                                    <a href="${pageContext.request.contextPath}/deleteTask?id=${Task.id}" onClick="return confirm('Are you sure to delete this Team?');"><i class="fa fa-fw fa-trash"></i> Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</c:if>

<div class="row">
    <div class="col-md-12">
        <div class="card ">
            <div class="header">
                <h4 class="title text-info"><b>TASKS LIST : </b></h4>
                <%--<p class="category">24 Hours performance</p>--%>
            </div>
            <div class="content table-responsive  ">
                <%--<div id="chartHours" class="ct-chart"></div>--%>
                <table class="table table-hover  " >
                    <thead>
                    <tr>
                        <th></th>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Content</th>
                        <th scope="col">Project</th>
                        <th scope="col">Done</th>
                        <th scope="col">Deadline</th>
                        <th scope="col" ></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${TaskList}" var="Task" >
                        <tr>
                            <td></td>
                            <th >${Task.id}</th>
                            <td >${Task.name}</td>
                            <td >${Task.content}</td>
                            <td >${Task.idProject}</td>
                            <td >
                                <label class="checkbox-info" id="tb-list">
                                    <input id="checkTask${Task.id}" value="${Task.id}" type="checkbox" onclick="myfunction(this)" <c:if test="${Task.statusTask==1}">checked</c:if> >
                                    <p class="text-danger pull-right">${errorString}</p>
                                </label>
                            </td>
                            <td>${Task.timeEnd}</td>
                            <td align="center">
                                <a href="${pageContext.request.contextPath}/editTask" class="text-primary"><i  class="fa fa-fw fa-edit"></i> Edit</a> |
                                <a href="${pageContext.request.contextPath}/deleteTask?id=${Task.id}" onClick="return confirm('Are you sure to delete this Team?');"><i class="fa fa-fw fa-trash"></i> Delete</a>
                            </td>
                        </tr>
                    </c:forEach>


                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<div class="row">
    <div class="col-md-6">

        <div class="card">
            <div class="content table-responsive table-full-width ">
                <div id='calendar'></div>

                <div style='clear:both'></div>
            </div>
        </div>
    </div>
</div>






