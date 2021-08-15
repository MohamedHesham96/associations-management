function nextPagePrint(url, responseDiv, formId) {
    var currentPage = $("#currentPrint").val();
    var totalNumberOfPages = $("#totalPrint").val();
    var size = $("#sizePrint").val();
    var nextPage = parseInt(currentPage) + 1;
    if (nextPage < parseInt(totalNumberOfPages)) {
        if (formId != null) {
            var form = convertToJSONObject("#" + formId);
            loadTableForm(url, responseDiv, form, nextPage, size)
        } else {
            loadTable(url, responseDiv, nextPage, size)
        }
    }
}

function previousPagePrint(url, responseDiv, formId) {
    event.preventDefault();
    var currentPage = $("#currentPrint").val();
    var size = $("#sizePrint").val();
    var previousPage = parseInt(currentPage) - 1;
    if (previousPage >= 0) {
        if (formId != null) {
            var form = convertToJSONObject("#" + formId);
            loadTableForm(url, responseDiv, form, previousPage, size)
        } else {
            loadTable(url, responseDiv, previousPage, size)
        }
    }
}

function changeTableSizePrint(url, responseDiv, formId) {
    event.preventDefault();
    var size = $("#sizePrint").val();
    if (formId != null) {
        var form = convertToJSONObject("#" + formId);
        loadTableForm(url, responseDiv, form, 0, size)
    } else {
        loadTable(url, responseDiv, 0, size)
    }
}

function searchInTablePrint(url, responseDiv, formId) {

    event.preventDefault();
    var size = $("#sizePrint").val();

    var form = convertToJSONObject("#" + formId);

    loadTableForm(url, responseDiv, form, 0, size)
}

function copyTableToPrint() {

    $("#printTable").htmt();
}