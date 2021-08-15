<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
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

    @media print {
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
<div class="row 2">
    <input type="" id="currentPrint" value="${pagePrint}"/>
    <input type="" id="totalPrint" value="${totalPrint}"/>
    <input type="" id="sizePrint" value="${sizePrint}"/>
    <div class="col-9 mb-2 row">

    </div>
    <div id="printTable" class="table-responsive">
        <table class="table table-hover table-sm table-center mb-0">
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
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${persons}" var="item" varStatus="loop">
                <tr>
                    <td>${loop.index + 1}</td>
                    <td>${item.name}</td>
                    <td>${item.ssn}</td>
                    <td>${item.socialStatus}</td>
                    <td>${item.phone}</td>
                    <td>${item.helpType}</td>
                    <td>${item.address}</td>
                    <td>${item.date}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <nav id="noPrint" aria-label="Page navigation" class="offset-md-5 col-md-2  mt-2">
            <ul class="pagination">
                <li class="page-item ${pagePrint + 1 == total || totalPrint == 0 ? 'disabled' : ''}">
                    <button onclick="nextPagePrint('/app/persons/searchPrint','printViewPersonsResultDiv','searchPersonFormId');"
                            class="page-link  ${pagePrint + 1 == totalPrint || totalPrint == 0 ? '' : 'text-warning'}">
                        التالي
                    </button>
                </li>
                <li class="page-item  ${pagePrint == 0 ? 'disabled' : ''}">
                    <button onclick="previousPagePrint('/app/persons/searchPrint','printViewPersonsResultDiv','searchPersonFormId')"
                            class="page-link ${pagePrint == 0 ? '' : 'text-warning'}">السابق
                    </button>
                </li>

            </ul>
        </nav>

        <label>${totalPrint} / ${totalPrint == 0 ? pagePrint : pagePrint + 1} </label>

    </div>
</div>