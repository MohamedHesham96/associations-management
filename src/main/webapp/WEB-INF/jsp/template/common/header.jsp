<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: bassemgawish
  Date: 1/23/21
  Time: 5:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<input type="hidden" value="${pageContext.servletContext.contextPath}" id="applicationContext">
<input type="hidden" value="${sessionScope.currentLocale}" id="currentLocale">
<!-- Header -->
<div class="header">
    <!-- Logo -->
    <div class="header-left">
        <a href="index.html" class="logo">
            <img src="${pageContext.servletContext.contextPath}/images/Sawa_team_@2000.png" alt="Logo">
            <%--<img src="${pageContext.servletContext.contextPath}/templates/img/logo.png" alt="Logo">--%>
        </a>
        <a href="index.html" class="logo logo-small">
            <img src="${pageContext.servletContext.contextPath}/images/Icon-Yellow.png" alt="Logo" width="30"
                 height="30">
            <%--<img src="${pageContext.servletContext.contextPath}/templates/img/logo-small.png" alt="Logo" width="30"
                 height="30">--%>
        </a>
    </div>

    <!-- Header Right Menu -->
    <ul class="nav user-menu">

        <!-- User Menu -->
        <li class="nav-item dropdown has-arrow">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                <span class="user-img"><img class="rounded-circle"
                                            src="${pageContext.servletContext.contextPath}/templates/img/avatar.png"
                                            width="31" alt="Ryan Taylor"></span>
            </a>
            <div class="dropdown-menu">
                <div class="user-header">
                    <div class="avatar avatar-sm">
                        <img src="${pageContext.servletContext.contextPath}/images/avatar.png"
                             class="avatar-img rounded-circle">
                    </div>
                    <div class="user-text">
                        <c:if test="${ not empty LoggedInUser}">
                            <h6>${LoggedInUser.firstName} ${LoggedInUser.lastName}</h6>
                        </c:if>
                        <c:if test="${empty LoggedInUser}">
                            <h6>${LoggedInUser.userName}</h6>
                        </c:if>
                        <p class="text-muted mb-0">Administrator</p>
                    </div>
                </div>
                <c:url value="/j_spring_security_logout" var="logoutUrl"/>
                <form action="${logoutUrl}" method="post" id="logoutForm">
                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}"/>
                </form>
                <script>
                    function formSubmit() {
                        document.getElementById("logoutForm").submit();
                    }
                </script>
                <a class="dropdown-item" href="javascript:formSubmit();">Logout</a>
            </div>
        </li>
        <!-- /User Menu -->

    </ul>
    <!-- /Header Right Menu -->


    <ul class="nav mt-2">

        <li class="nav-item">
            <button onclick="showHelpCreateModel()"
                    class="btn btn-success text-black  mr-1"
                    type="button"
                    data-toggle="modal" data-target="#helpModel">
                اضافه مساعدة جديدة
            </button>
        </li>

        <li class="nav-item">
            <button onclick="showPersonCreateModel()"
                    class="btn btn-info text-black  mr-1"
                    type="button"
                    data-toggle="modal" data-target="#personModel">
                اضافه شخص جديد
            </button>
        </li>


        <li class="nav-item">
            <a style="background-color: #6f42c1"
               href="${pageContext.servletContext.contextPath}/app/helps"
               class="btn  btn-secondary text-black  mr-1"
               type="button">
                قائمة المساعدات
            </a>
        </li>

        <li class="nav-item">

            <a style="background-color: #f62d51"
               href="${pageContext.servletContext.contextPath}/app/persons"
               class="btn text-white  mr-1"
               type="button">
                قائمة الأشخاص
            </a>
        </li>
    </ul>


</div>
<!-- /Header -->

<script>
    $(function () {
        var token = $("input[name='_csrf']").val();
        var header = "X-CSRF-TOKEN";
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });

    });
</script>


