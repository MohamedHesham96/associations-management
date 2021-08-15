<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--
Created by: Mohamed Hesham.
Created On: 07/04/2021 3:40
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<div class="row">
    <div class="col-2">
        <div class="form-group">
            <strong style="display: block">الاسم: </strong>
            <strong style="font-size: 20px" class="text-primary">${person.name}</strong>
        </div>

        <div class="form-group">
            <strong style="display: block">الرقم القومي: </strong>
            <strong style="font-size: 20px" class="text-primary">${person.ssn}</strong>
        </div>

        <div class="form-group">
            <strong style="display: block">الحالة الاجتماعية: </strong>
            <strong style="font-size: 20px" class="text-primary">${person.socialStatus}</strong>
        </div>

        <div class="form-group">
            <strong style="display: block">التيليفون:</strong>
            <strong style="font-size: 20px" class="text-primary">${person.phone}</strong>
        </div>

        <div class="form-group">
            <strong style="display: block">العنوان:</strong>
            <strong style="font-size: 20px" class="text-primary">${person.address}</strong>
        </div>

        </form>
    </div>
    <div class="col-10">
        <div style="height: 500px" class="table-responsive shadow">
            <table style="" id="helpsTable" class="table  table-sm table-hover table-center mb-0">
                <thead style="">
                <tr>
                    <th>م</th>
                    <th>نوع المساعدة</th>
                    <th>التاريخ</th>
                    <th>الإستلام</th>
                    <th>العمليات</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${person.helpList}" var="item" varStatus="loop">
                    <tr>
                        <td class="index">${loop.index + 1}</td>
                        <td>${item.helpType}</td>
                        <td>
                            <fmt:parseDate value="${ item.date }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime"
                                           type="both"/>
                            <fmt:formatDate pattern="dd-MM-yyyy HH:mm a" value="${parsedDateTime}"/>
                        </td>
                        <td>
                            <strong style="color: ${item.served == true ? "#00CC00" : "#FF0000"}">${item.served == true ? " استلم" : "لم يستلم"}</strong>
                        </td>
                        <td>
                            <div class="btn-group">
                                <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">عمليات
                                </button>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item"
                                       onclick="changeHelpServedState(${item.id})">${item.served == true ? "لم يستلم" : "استلم"}</a>
                                    <a class="dropdown-item" onclick="deleteHelp(${item.id})">حذف</a>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>