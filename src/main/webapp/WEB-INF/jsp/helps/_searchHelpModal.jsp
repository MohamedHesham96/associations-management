<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
Created by: Mohamed Hesham.
Created On: 08/04/2021 10:49
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<div class="row mb-4 shadow pb-4">

    <form class="form-row col-12" id="searchHelpFormId">

        <div class="col">
            <label>الاسم</label>
            <input type="text" name="name" class="form-control" placeholder="اسم الشخص">
        </div>

        <div class="col">
            <label>الرقم القومي</label>
            <input type="text" name="ssn" class="form-control" placeholder="الرقم القومي">
        </div>

        <div class="col">
            <label>نوع المساعدة</label>
            <input type="text" name="helpType" class="form-control" placeholder="نوع المساعدة">
        </div>

        <div class="col-2">
            <label> </label>
            <button onclick="searchInTable('/app/helps/search', 'searchHelpsResultDiv', 'searchHelpFormId');"
                    class="btn btn-success text-white font-weight-bold form-control mt-2">بحث
            </button>
        </div>

    </form>

</div>
