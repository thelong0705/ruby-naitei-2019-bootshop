$(document).ready(function () {
    document.body.addEventListener("ajax:success", function (event) {
        var detail = event.detail;
        var data = detail[0];
        console.log(data.errors);
        if (data.success) {
            location.reload();
        } else {
            $("#login-error").toggle();
        }
    });
});
