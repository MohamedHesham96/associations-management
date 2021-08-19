<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--
Created by: Mohamed Hesham.
Created On: 07/04/2021 3:41
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<style>

    @media screen {
        #printSection {
            display: none;
        }
    }

    @page {
        margin: 0 auto;
    }

    @media print {
        .no-print {
            display: none;
        }

        body * {
            width: 100%;
        }

        body * {
            visibility: hidden;
        }

        #printSection, #printSection * {
            visibility: visible;
        }

        #printSection {
            position: absolute;
            left: 0;
            top: 0;
        }
    }

</style>


<div class="row ">
    <input type="hidden" id="current" value="${page}"/>
    <input type="hidden" id="total" value="${total}"/>
    <div class="col-md-12 mb-2 row">

        <label class="mt-2 mr-3">العدد: </label>

        <select id="size" class="form-control col-1"
                onchange="changeTableSize('/app/persons/search','searchPersonsResultDiv','searchPersonFormId')">
            <option ${size eq 10 ? 'selected':''} value="10">10</option>
            <option ${size eq 25 ? 'selected':''} value="25">25</option>
            <option ${size eq 50 ? 'selected':''} value="50">50</option>
            <option ${size eq 100 ? 'selected':''} value="100">100</option>
        </select>
        <button class="btn btn-primary ml-3 col-md-2 font-weight-bold"
                onclick="printElement('printThis')">طباعة
        </button>
    </div>

</div>

<div id="printThis">
    <div class="table-responsive shadow">
        <table id="personsTable" class="table table-hover table-center mb-0">
            <thead>
            <tr>
                <th>م</th>
                <th>الاسم</th>
                <th>الرقم القومي</th>
                <th>التليفون</th>
                <th class="no-print">الحالة الاجتماعية</th>
                <th class="no-print">العنوان</th>
                <th class="no-print">>تاريخ التسجيل</th>
                <th class="no-print">العملية</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${personList}" var="item" varStatus="loop">
                <tr>
                    <td class="index"></td>
                    <td><a href="javascript:;" onclick="openPersonProfile(${item.id})">${item.name}</a></td>
                    <td>${item.ssn}</td>
                    <td>${item.phone}</td>
                    <td class="no-print">${item.socialStatus}</td>
                    <td class="no-print">${item.address}</td>
                    <td class="no-print">
                        <fmt:parseDate value="${ item.date }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime"
                                       type="both"/>
                        <fmt:formatDate pattern="dd-MM-yyyy HH:mm a" value="${parsedDateTime}"/></td>
                    <td class="no-print">
                        <div class="btn-group">
                            <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">عمليات
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" data-toggle="modal" data-target="#personModel"
                                   onclick="showUpdatePersonModel('${item.id}', '${item.name}', '${item.ssn}', '${item.socialStatus}',
                                           '${item.address}', '${item.phone}')">تعديل</a>
                                    <%--                                <a class="dropdown-item" onclick="deletePerson(${item.id})">حذف</a>--%>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <label class="mt-2">${total} / ${total == 0 ? page : page + 1} </label>
</div>

<nav aria-label="Page navigation" class="offset-md-5 col-md-2">
    <ul class="pagination">

        <li class="page-item ${page + 1 == total || total == 0 ? 'disabled' : ''}">
            <button onclick="nextPage('/app/persons/search','searchPersonsResultDiv','searchPersonFormId');"
                    class="page-link  ${page + 1 == total || total == 0 ? '' : 'text-success border-success'}">التالي
            </button>
        </li>
        <li class="page-item  ${page == 0 ? 'disabled' : ''}">
            <button onclick="previousPage('/app/persons/search','searchPersonsResultDiv','searchPersonFormId')"
                    class="page-link ${page == 0 ? '' : 'text-success border-success'}"
            >السابق
            </button>
        </li>
    </ul>
</nav>


<script>
    var table = $('#personsTable').DataTable({
        "bInfo": false,
        paging: false,
        searching: false,
        columnDefs: [{
            sortable: false,
            "class": "index",
            targets: 0
        }],
        order: [[1, 'asc']],
        fixedColumns: true
    });

    table.on('order.dt search.dt', function () {
        table.column(0, {search: 'applied', order: 'applied'}).nodes().each(function (cell, i) {
            cell.innerHTML = ${page * size + 1} +i;
        });
    }).draw();
</script>
