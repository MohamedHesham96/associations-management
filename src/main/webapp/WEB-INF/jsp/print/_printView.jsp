<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
Created by: Mohamed Hesham.
Created On: 07/04/2021 3:40
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<div class="modal" tabindex="-1" role="dialog" id="printViewModel">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content  pb-1 pl-1 pr-1">
            <div class="modal-header">
                <h5 id="modelTitleId" class="modal-title">طباعة</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="printViewPersonsResultDiv">
                    <%--
                                        <jsp:include page="../print/_printViewPersonsList.jsp"/>
                    --%>
                </div>
            </div>

            <div class="pull-right">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">إغلاق</button>
                <button id="saveButtonId" onclick="" class="btn btn-primary">طباعة</button>
            </div>
        </div>
    </div>
</div>
