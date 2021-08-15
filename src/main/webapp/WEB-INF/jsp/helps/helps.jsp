<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
Created by: Mohamed Hesham.
Created On: 07/04/2021 11:00
--%>


<script src="<c:url value="/templates/plugins/datatables/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/templates/plugins/datatables/datatables.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/templates/plugins/datatables/datatables.min.css"/>">


<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-header">
                <h2 id="pageTitle">قائمة المساعدات</h2>
            </div>

            <div class="card-body" id="cardBody">
                <jsp:include page="_searchHelpModal.jsp"/>
                <div id="searchHelpsResultDiv">
                    <jsp:include page="_helpList.jsp"/>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<c:url value="/js/commons.js"/>"></script>
<script src="<c:url value="/js/printOperation.js"/>"></script>
<script src="<c:url value="/templates/plugins/parsley/parsley.js"/>"></script>
<script src="<c:url value="/js/persons.js"/>"></script>
<script src="<c:url value="/js/helps.js"/>"></script>

<jsp:include page="_addHelpModal.jsp"/>
<jsp:include page="../persons/_addPersonModal.jsp"/>
<jsp:include page="../persons/_personProfileModal.jsp"/>