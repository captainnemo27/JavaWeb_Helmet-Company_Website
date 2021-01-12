<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Thang Dao
  Date: 1/12/2021
  Time: 12:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row">
    <div class="col-md-12">
        <div class="card text-white bg-secondary ">
            <div class="header">
                <h4 class="title text-info "><b>My Team </b></h4>
            </div>
            <div class="content">
                <div class="table-responsive table-active">
                    <table class="table table-hover ">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col" >#</th>
                            <th scope="col" >Name</th>
                            <th scope="col" >Address</th>
                            <th scope="col" >Phone</th>
                            <th scope="col" >Email</th>
                            <th scope="col" >Admin</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td ><b>${myTeam.id}</b></td>
                            <td >${myTeam.name} </td>
                            <td >${myTeam.address} </td>
                            <td >${myTeam.phone} </td>
                            <td >${myTeam.email}</td>
                            <td >${myTeam.admin}</td>
                        </tr>
                        <c:forEach items="${myteam}" var="myteam" >

                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>