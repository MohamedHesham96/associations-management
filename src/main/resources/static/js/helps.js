function createHelp() {
    event.preventDefault();
    var form = $('#helpInfo');
    form.parsley().validate();
    if (form.parsley().isValid()) {
        var form = convertToJSONObject("#helpInfo");
        $.ajax({
            url: $("#applicationContext").val() + "/app/helps",
            type: "POST",
            contentType: 'application/json',
            data: JSON.stringify(form),
            success: function (response) {
                if (response.status) {
                    toastr.success(response.message);
                    setTimeout(location.reload.bind(location), 1000);
                } else {
                    toastr.error(response.message);
                    setTimeout(location.reload.bind(location), 1000);
                }
            },
            error: function () {
                toastr.error('حدث خطأ !');
            }
        });
    }
}

function showHelpCreateModel() {

    clearForm('helpInfo');

    $("#modelTitleId").text("اضافة مساعدة جديدة");
    $('#helpSaveButton').attr('onClick', 'createHelp();');
}


function showUpdateModel(id, name, ssn, socialStatus, address, phone, helpType, date) {

    clearForm('personInfo');

    $("#id").val(id);
    $("#helpType").val(helpType);
    $("#modelTitleId").text("تعديل مساعدة");
    $('#saveButtonId').attr('onClick', 'createPerson();');
}

function changeHelpServedState(helpId) {
    $.ajax({
        url: $("#applicationContext").val() + "/app/helps/" + helpId,
        type: "POST",
        contentType: 'application/json',
        success: function (response) {
            if (response.status) {
                toastr.success(response.message);
                setTimeout(location.reload.bind(location), 1000);
            } else {
                toastr.error(response.message);
                setTimeout(location.reload.bind(location), 1000);
            }
        },
        error: function () {
            toastr.error("حدث خطأ!");
        }
    })
}


function openPersonProfile(personId) {
    $.ajax({
        url: $("#applicationContext").val() + "/app/persons/profile/" + personId,
        type: "GET",
        contentType: 'application/json',
        success: function (response) {
            console.log("response: " + response);
            $("#personProfileModalBody").html(response);
            $("#personProfileModel").modal("show");
        },
        error: function () {
            toastr.error('حدث خطأ !');
        }
    });
}

function printElement(elementId) {

    var element = document.getElementById(elementId);

    var domClone = element.cloneNode(true);

    var $printSection = document.getElementById("printSection");

    if (!$printSection) {
        var $printSection = document.createElement("div");
        $printSection.id = "printSection";
        document.body.appendChild($printSection);
    }

    $printSection.innerHTML = "";
    $printSection.appendChild(domClone);
    window.print();

}

function deleteHelp(helpId) {
    var confirm = window.confirm("هل انت متأكد من حذف هذه المساعدة ؟");
    if (confirm == true) {
        $.ajax({
            url: $("#applicationContext").val() + "/app/helps/" + helpId,
            type: "DELETE",
            contentType: 'application/json',
            success: function (response) {
                if (response.status) {
                    toastr.success(response.message);
                    setTimeout(location.reload.bind(location), 1000);
                } else {
                    toastr.error(response.message);
                    setTimeout(location.reload.bind(location), 1000);
                }
            }
        })
    }
}