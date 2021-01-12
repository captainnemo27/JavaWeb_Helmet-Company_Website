<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Thang Dao
  Date: 12/9/2020
  Time: 6:20 PM
  To change this template use File | Settings | File Templates.
--%>




    <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


    <div class="sidebar-wrapper">
        <div class="logo">
            <a href="https://www.facebook.com/trungleoo/" class="simple-text">
                TrungLeo's Helmets
            </a>
        </div>

        <ul class="nav" >
            <li  <c:if test="${ItemMenu == 'dashboard'}">class="active"</c:if> >
                <a  href="${pageContext.request.contextPath}/dashboard">
                    <i class="pe-7s-graph"></i>
                    <p>Dashboard</p>
                </a>
            </li>
            <li <c:if test="${ItemMenu == 'user'}">class="  active "</c:if> >
                <a  href="${pageContext.request.contextPath}/user">
                    <i class="pe-7s-user"></i>
                    <p>User Profile</p>
                </a>
            </li>
            <li <c:if test="${ItemMenu == 'project'}"> class=" active" </c:if>  >
                <a  href="${pageContext.request.contextPath}/project">
                    <i class="pe-7s-note2"></i>
                    <p>Project List</p>
                </a>
            </li>
            <li  <c:if test="${ItemMenu == 'team' || ItemMenu == 'teamS' || ItemMenu == 'teamL'   }"> class="active" </c:if> >
                <a  href="${pageContext.request.contextPath}/team">
                    <i class="pe-7s-news-paper"></i>
                    <p>Team</p>
                </a>
            </li>
            <li  <c:if test="${ItemMenu == 'tasks'}">class="active" </c:if> >
                <a  href="${pageContext.request.contextPath}/tasks">
                    <i class="pe-7s-science"></i>
                    <p>Tasks</p>
                </a>
            </li>
            <li <c:if test="${ItemMenu == 'salary'}">class=" active "</c:if> >
                <a href="${pageContext.request.contextPath}/salary">
                    <i class="pe-7s-credit"></i>
                    <p>Salary</p>
                </a>
            </li>
            <li  <c:if test="${ItemMenu == 'notifications'}"> class=" active" </c:if>  >
                <a href="${pageContext.request.contextPath}/notifications">
                    <i class="pe-7s-bell"></i>
                    <p>Notifications</p>
                </a>
            </li>
        </ul>
    </div>


