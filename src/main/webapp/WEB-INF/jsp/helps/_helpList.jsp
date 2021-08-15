<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<div class="row">
    <input type="hidden" id="current" value="${page}"/>
    <input type="hidden" id="total" value="${total}"/>
    <div class="col-md-12 mb-2 row">

        <label class="mt-2 mr-3">العدد: </label>

        <select id="size" class="form-control col-1"
                onchange="changeTableSize('/app/helps/search','searchHelpsResultDiv','searchHelpFormId')">
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
        <table id="helpsTable" class="table table-hover table-center mb-0">
            <thead>
            <tr>
                <th>م</th>
                <th>الاسم</th>
                <th>الرقم القومي</th>
                <th>الحالة الاجتماعية</th>
                <th>التليفون</th>
                <th>نوع المساعدة</th>
                <th>العنوان</th>
                <th>التاريخ</th>
                <th>الإستلام</th>
                <th class="no-print">العمليات</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${helpList}" var="item" varStatus="loop">
                <tr>
                    <td class="index">${loop.index + 1}</td>
                    <td><a href="javascript:;" onclick="openPersonProfile(${item.person.id})">${item.person.name}</a>
                    </td>
                    <td>${item.person.ssn}</td>
                    <td>${item.person.socialStatus}</td>
                    <td>${item.person.phone}</td>
                    <td>${item.helpType}</td>
                    <td>${item.person.address}</td>
                    <td>
                        <fmt:parseDate value="${ item.date }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime"
                                       type="both"/>
                        <fmt:formatDate pattern="dd-MM-yyyy HH:mm a" value="${parsedDateTime}"/>
                    </td>
                    <td>
                        <strong style="color: ${item.served == true ? "#00CC00" : "#FF0000"}">${item.served == true ? " استلم" : "لم يستلم"}</strong>
                    </td>
                    <td class="no-print">
                        <div class="btn-group">
                            <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">عمليات
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" onclick="changeHelpServedState(${item.id})">
                                        ${item.served == true ? "لم يستلم" : "استلم"}
                                </a>
                                <a class="dropdown-item" onclick="deleteHelp(${item.id})">حذف</a>
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
            <button onclick="nextPage('/app/helps/search','searchHelpsResultDiv','searchHelpFormId');"
                    class="page-link  ${page + 1 == total || total == 0 ? '' : 'text-success border-success'}"
            >التالي
            </button>
        </li>
        <li class="page-item  ${page == 0 ? 'disabled' : ''}">
            <button onclick="previousPage('/app/helps/search','searchHelpsResultDiv','searchHelpFormId')"
                    class="page-link ${page == 0 ? '' : 'text-success border-success'}"
            >السابق
            </button>
        </li>
    </ul>
</nav>

<script>
    $(document).ready(function () {
        var table = $('#helpsTable').DataTable({
            dom: 'Bfrtip',
            buttons: [
                'print'
            ],
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
                cell.innerHTML = ${page * size + 1} + i;
            });
        }).draw();
    });
</script>
