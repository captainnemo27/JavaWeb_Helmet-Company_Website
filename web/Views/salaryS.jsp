<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Thang Dao
  Date: 1/13/2021
  Time: 12:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">

    <div class="col-md-6">
        <div class="card">
            <div class="card">
                <div class="header">
                    <h4 class="title "><b>My Salary Of This Month</b></h4>
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
                            </thead>
                            <tbody>
                            <c:forEach items="${SalaryListS}" var="SalaryS" >
                                <tr>
                                    <td>${SalaryS.month}</td>
                                    <td>${SalaryS.year}</td>
                                    <td>${SalaryS.name}</td>
                                    <td>#${SalaryS.teamName}</td>
                                    <td>${SalaryS.fixsalary}$</td>
                                    <td>${SalaryS.bonus}$</td>
                                    <td>${SalaryS.salary}$</td>
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