<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: bassemgawish
  Date: 1/23/21
  Time: 5:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <tiles:insertAttribute name="head"/>
</head>
<body>
<!-- Main Wrapper -->
<div class="main-wrapper">
    <tiles:insertAttribute name="header"/>
    <br><br>
    <div class="row p-4 ">
        <div class="content container-fluid">
            <tiles:insertAttribute name="body"/>
        </div>
    </div>

</div>


<!-- Bootstrap Core JS -->
<script src="<c:url value="/templates/js/popper.min.js"/>"></script>

<c:if test="${sessionScope.currentLocale eq 'ar'}">
    <script src="<c:url value="/templates/plugins/bootstrap-rtl/js/bootstrap.min.js"/>"></script>
</c:if>
<c:if test="${sessionScope.currentLocale ne 'ar'}">

    <script src="<c:url value="/templates/js/bootstrap.min.js"/>"></script>

</c:if>

<!-- Slimscroll JS -->
<script src="<c:url value="/templates/plugins/slimscroll/jquery.slimscroll.min.js"/>"></script>

<!-- Custom JS -->
<script src="<c:url value="/templates/js/script.js"/>"></script>


<script src="<c:url value="/templates/plugins/toastr/toastr.min.js"/>"></script>
<script src="<c:url value="/templates/plugins/bootbox/bootbox.min.js"/>"></script>
<script src="<c:url value="/templates/plugins/bootbox/bootbox.locales.min.js"/>"></script>


</body>
</html>
