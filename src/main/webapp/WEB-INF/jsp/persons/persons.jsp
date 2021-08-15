<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
Created by: Mohamed Hesham.
Created On: 07/04/2021 11:00
--%>

<link rel="stylesheet" href="<c:url value="/templates/plugins/datatables/datatables.min.css"/>">
<script src="<c:url value="/templates/plugins/datatables/datatables.min.js"/>"></script>
<script src="<c:url value="/templates/plugins/datatables/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/templates/plugins/datatables/buttons.print.min.js"/>"></script>
<script src="<c:url value="/templates/plugins/datatables/dataTables.buttons.min.js"/>"></script>


<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-header">
                <h2 id="pageTitle">قائمة الأشخاص</h2>
            </div>

            <div class="card-body" id="cardBody">
                <jsp:include page="_searchPersons.jsp"/>
                <div id="searchPersonsResultDiv">
                    <jsp:include page="_personsList.jsp"/>
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

<jsp:include page="../helps/_addHelpModal.jsp"/>
<jsp:include page="_addPersonModal.jsp"/>
<jsp:include page="_personProfileModal.jsp"/>