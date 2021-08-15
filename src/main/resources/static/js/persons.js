function createPerson() {
    event.preventDefault();
    var form = $('#personInfo');
    form.parsley().validate();
    if (form.parsley().isValid()) {
        var form = convertToJSONObject("#personInfo");
        $.ajax({
            url: $("#applicationContext").val() + "/app/persons",
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

function showPersonCreateModel() {

    clearForm('personInfo');

    $("#modelTitleId").text("اضافة مساعدة جديد");
    $('#personSaveButton').attr('onClick', 'createPerson();');
}


function showHelpCreateModel() {

    clearForm('helpInfo');

    $("#modelTitleId").text("اضافة مساعدة جديدة");
    $('#helpSaveButton').attr('onClick', 'createHelp();');
}


function showUpdatePersonModel(id, name, ssn, socialStatus, address, phone) {

    clearForm('personInfo');

    $("#personFormId").val(id);
    $("#name").val(name);
    $("#ssn").val(ssn);
    $("#socialStatus").val(socialStatus);
    $("#address").val(address);
    $("#phone").val(phone);
    $("#modelTitleId").text("تعديل بيانات");
    $('#saveButtonId').attr('onClick', 'createPerson();');
}

function deletePerson(personId) {
    $.ajax({
        url: $("#applicationContext").val() + "/app/persons/" + personId,
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
