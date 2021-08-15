<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: bassemgawish
  Date: 1/23/21
  Time: 5:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
<meta name="_csrf" content="${_csrf.token}"/>
<title>Management</title>

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="<c:url value="/images/Sawa-Icon-Yellow-map.ico"/>">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<c:url value="/templates/plugins/bootstrap-rtl/css/bootstrap.min.css"/>">


<!-- Fontawesome CSS -->

<!-- Feathericon CSS -->
<link rel="stylesheet" href="<c:url value="/templates/css/feathericon.min.css"/>">


<!-- Main CSS -->
<link rel="stylesheet" href="<c:url value="/templates/css/style-ar.css"/>">


<link rel="stylesheet" href="<c:url value="/templates/plugins/toastr/toastr.min.css"/>">
<link href="<c:url value="/css/font-awesome.css" />" rel="stylesheet">

<!--[if lt IE 9]>
<script src="<c:url value="/templates/js/html5shiv.min.js"/>"></script>
<script src="<c:url value="/templates/js/respond.min.js"/>"></script>
<![endif]-->

<!-- jQuery -->
<script src="<c:url value="/templates/js/jquery-3.2.1.min.js"/>"></script>
<script src="<c:url value="/js/commons.js"/>"></script>
