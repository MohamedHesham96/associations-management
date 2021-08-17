<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: bassemgawish
  Date: 1/22/21
  Time: 4:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login V2</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/login_template/vendor/bootstrap/css/bootstrap.min.css"/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/login_template/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/login_template/fonts/iconic/css/material-design-iconic-font.min.css"/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/login_template/vendor/animate/animate.css"/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/login_template/vendor/css-hamburgers/hamburgers.min.css"/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/login_template/vendor/animsition/css/animsition.min.css"/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/login_template/vendor/select2/select2.min.css"/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/login_template/vendor/daterangepicker/daterangepicker.css"/>">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/login_template/css/util.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/login_template/css/main.css"/>">
    <!--===============================================================================================-->
</head>
<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <span class="login100-form-title p-b-15">
                    <img style="width: 250px"
                         src="${pageContext.servletContext.contextPath}/images/logo.jpeg">
					</span>
            <div class="mb-3">
               <span style="color: #db1f1f; font-size: 13px; margin-bottom: 2px;">
                   ${error}
               </span>
                <span style="color: #31c85a; font-size: 13px; margin-bottom: 2px;">
                    ${msg}
                </span>
            </div>

            <form class="login100-form validate-form" action="${pageContext.servletContext.contextPath}/login"
                  method="POST">

                <div class="wrap-input100 validate-input" data-validate="Valid email is: a@b.c">
                    <input class="input100" type="text" name="username">
                    <span class="focus-input100" data-placeholder="Email"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Enter password">
                    <input id="password" class="input100" type="password" name="password">
                    <span class="focus-input100" data-placeholder="Password"></span>
                </div>

                <div class="container-login100-form-btn">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn bg-success">
                            Login
                        </button>
                    </div>
                </div>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </div>
    </div>
</div>


<div id="dropDownSelect1"></div>

<!--===============================================================================================-->
<script src="<c:url value="/login_template/vendor/jquery/jquery-3.2.1.min.js"/>"></script>
<!--===============================================================================================-->
<script src="<c:url value="/login_template/vendor/animsition/js/animsition.min.js"/>"></script>
<!--===============================================================================================-->
<script src="<c:url value="/login_template/vendor/bootstrap/js/popper.js"/>"></script>
<script src="<c:url value="/login_template/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
<!--===============================================================================================-->
<script src="<c:url value="/login_template/vendor/select2/select2.min.js"/>"></script>
<!--===============================================================================================-->
<script src="<c:url value="/login_template/vendor/daterangepicker/moment.min.js"/>"></script>
<script src="<c:url value="/login_template/vendor/daterangepicker/daterangepicker.js"/>"></script>
<!--===============================================================================================-->
<script src="<c:url value="/login_template/vendor/countdowntime/countdowntime.js"/>"></script>
<!--===============================================================================================-->
<script src="<c:url value="/login_template/js/main.js"/>"></script>

</body>
</html>

