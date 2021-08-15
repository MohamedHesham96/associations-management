<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
Created by: Mohamed Hesham.
Created On: 07/04/2021 3:40
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<div class="modal" tabindex="-1" role="dialog" id="personModel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 id="modelTitleId" class="modal-title">اضافة شخص جديد</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <form id="personInfo" class="parsley-form" data-parsley-validate>

                    <input type="hidden" id="personFormId" name="id">

                    <div class="form-group">
                        <label>الاسم</label>
                        <input data-parsley-required="true" data-parsley-trigger="change"
                               type="text"
                               id="name" name="name" data-parsley-maxlength="50"
                               class="form-control required">
                    </div>

                    <div class="form-group">
                        <label>الرقم القومي</label>
                        <input data-parsley-required="true" data-parsley-trigger="change"
                               type="text"
                               id="ssn" name="ssn" data-parsley-maxlength="50"
                               class="form-control required">
                    </div>

                    <div class="form-group">
                        <label>الحالة الاجتماعية</label>
                        <input data-parsley-required="true" data-parsley-trigger="change"
                               type="text"
                               id="socialStatus" name="socialStatus" data-parsley-maxlength="50"
                               class="form-control required">
                    </div>

                    <div class="form-group">

                        <label>التيليفون</label>
                        <input data-parsley-required="true" data-parsley-trigger="change"
                               type="text"
                               id="phone" name="phone" data-parsley-maxlength="50"
                               class="form-control required">
                    </div>

                    <div class="form-group">
                        <label>العنوان</label>
                        <input data-parsley-required="true" data-parsley-trigger="change"
                               type="text"
                               id="address" name="address" data-parsley-maxlength="50"
                               class="form-control required">
                    </div>

                </form>

                <div class="row">
                    <button id="helpSaveButton" onclick="createPerson();" class="btn btn-warning col-2 m-1">حفظ
                    </button>
                    <button type="button" class="btn btn-secondary col-2 m-1" data-dismiss="modal">إلغاء</button>
                </div>

            </div>

        </div>
    </div>
</div>

