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
                <button id="btnToolProject" type="button" class="btn btn btn-fill left"><span class="fa fa-bars"></span></button>
                <button  <%--id="btnAddStaff"--%> type="button" href="#myCarouselTasks" class="btn btn-danger btn-fill left" data-slide-to="0" >Search Project</button>
                <button  <%--id="btnAddTeam"--%> type="button" href="#myCarouselTasks" class="btn btn-danger btn-fill left" data-slide-to="1" >Add Project</button>
                <button  <%--id="btnSearchTeam"--%> type="button" href="#myCarouselTasks" class="btn btn-danger btn-fill left" data-slide-to="2" >Edit Project</button>
                <button  <%--id="btnSearchTeam"--%> type="button" href="#myCarouselTasks" class="btn btn-danger btn-fill left" data-slide-to="2" >Projects Deleted</button>
            </div>

        </div>
    </div>
</div>
<div class="divClass" id="divToolProject">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div id="myCarouselTasks"  class="carousel slide" >
                    <div class="carousel-inner">
                        <div class="carousel-item  active">
                            <form action="${pageContext.request.contextPath}/storeProjectName" method="POST">
                                <div class="content table-responsive">
                                    <div class="header">
                                        <h4 class="title"><b>Search Project</b></h4>
                                    </div>
                                    <div class="content">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Name of Project</label>
                                                    <input type="text" name ="textName" id="projectName" class="form-control" placeholder="Project's Name" value="">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Time From</label>
                                                    <input type="datetime-local" name="timeFrom" id="projectTimeFrom" class="form-control" placeholder="TimeFrom" value="">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label>Time End</label>
                                                    <input type="datetime-local" name="timeEnd" id="projectTimeEnd" class="form-control" placeholder="TimeEnd" value="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label >Id Project </label>
                                                            <input type="text" name="projectId" id="projectId" class="form-control" placeholder="Id Project" value="">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label >Id Team </label>
                                                            <input type="text" name="teamId" id="teamId" class="form-control" placeholder="Id Team" value="">
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <button type="submit" id="submit1" name="submit" class="btn btn-info btn-fill left" ><span class="fa fa-search"></span> Search Project</button>
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
                                    <h4 class="title"><b>Add A Project</b></h4>
                                </div>
                                <div class="content">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Name of Project</label>
                                                <input type="text" name ="name1" id="projectName1" class="form-control" placeholder="Project's Name" value="">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Time From</label>
                                                <input type="datetime-local" name="timeFrom1" id="projectTimeFrom1" class="form-control" placeholder="TimeFrom" value="">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Time End</label>
                                                <input type="datetime-local" name="timeEnd1" id="projectTimeEnd1" class="form-control" placeholder="TimeEnd" value="">
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Content</label>
                                                <textarea rows="4" name="content1" id="projectContent1" class="form-control" placeholder="Here be the content of Project" ></textarea>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label >ID Project </label>
                                                        <input type="text" name="projectId1" id="projectId1" class="form-control" placeholder="Id Project" value="">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label >ID Staff </label>
                                                        <input type="text" name="teamId1" id="teamId1" class="form-control" placeholder="Id Team" value="">
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
                                                <button type="submit" id="btnAddProject" name = "submit" class="btn btn-danger btn-fill center" ><span class="fa fa-plus"></span>Add Project</button>

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
                                    <h4 class="title"><b>Edit Project</b></h4>
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

<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="header">
                <h4 class="title text-info"><b>Project of Company</b></h4>
                <p class="category">Here is a subtitle for this table</p>
            </div>
            <div class="content table-responsive table-full-width">
                <table class="table table-hover">
                    <thead>
                    <th>  </th>
                    <th>ID</th>
                    <th>Name Project</th>
                    <th>Content</th>
                    <th>Start</th>
                    <th>End</th>
                    <th>Done</th>
                    <th>Id Team</th>
                    <th></th>
                    </thead>
                    <tbody>
                    <c:if test="${not empty ProjectList}">
                        <c:forEach items="${ProjectList}" var="Project">
                            <tr>
                                <td>  </td>
                                <td>${Project.id}</td>
                                <td>${Project.name}</td>
                                <td>${Project.content}</td>
                                <td>${Project.timeFrom}</td>
                                <td>${Project.timeEnd}</td>
                                <td>
                                    <label class="checkbox-info">
                                        <input type="checkbox" <c:if test="${Project.statusProject==1}">checked="checked"</c:if> >
                                    </label>
                                </td>
                                <th>${Project.idTeam}</th>
                                <td align="left">
                                    <a href="${pageContext.request.contextPath}/editProject?id=${Project.id}" class=" text-primary td-actions"><i class="fa fa-fw fa-edit"></i> Edit</a> |
                                    <a href="${pageContext.request.contextPath}/deleteProject?id=${Project.id}" class="td-actions" onClick="return confirm('Are you sure to delete this Team?');"><i class="fa fa-fw fa-trash"></i> Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>


                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>

