$(function () {
    $('input.date').datepicker({
        format: "dd/mm/yyyy",
        language: "pt-BR",
        autoclose: true,
        todayHighlight: true
    });

    $('form.validator').validator({
        match: "Does not match",
        minlength: "Not long enough",
        pattern:"Formato inválido"
    });
});