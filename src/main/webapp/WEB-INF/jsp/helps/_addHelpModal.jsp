<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
Created by: Mohamed Hesham.
Created On: 07/04/2021 3:40
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<div class="modal" tabindex="-1" role="dialog" id="helpModel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 id="modelTitleId" class="modal-title">اضافة مساعدة جديدة</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <form id="helpInfo" class="parsley-form" data-parsley-validate>

                    <input type="hidden" id="id" name="id">

                    <div class="form-group">
                        <label>الاسم</label>
                        <select class="form-control" id="personId" name="personId"
                                data-parsley-required="true">
                            <option>-- اختار اسم الشخص --</option>
                            <c:forEach items="${personList}" var="person">
                                <option value="${person.id}">${person.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>نوع المساعدة</label>
                        <input data-parsley-required="true" data-parsley-trigger="change"
                               type="text"
                               id="helpType" name="helpType" data-parsley-maxlength="50"
                               class="form-control required">
                    </div>

                    <div class="form-group row text-center">
                        <div class="col-md-6">
                            <label for="served">استلم المساعدة<input type="radio" value="true"
                                                                     id="served" name="served"
                                                                     data-parsley-required="true"
                                                                     class="form-control"></label>

                        </div>
                        <div class="col-md-6">
                            <label for="notServed">لم يستلم المساعدة<input type="radio" value="false"
                                                                           data-parsley-required="true"
                                                                           id="notServed" name="served"
                                                                           class="form-control">
                            </label>
                        </div>
                    </div>

                </form>

                <div class="">
                    <button id="helpSaveButton" onclick="createHelp();" class="btn btn-success col-2">حفظ
                    </button>
                    <button type="button" class="btn btn-secondary col-2 m-1" data-dismiss="modal">إلغاء</button>
                </div>

            </div>
        </div>
    </div>
</div>

