//Regitration_CheckBox
$(document).ready(function () {
  $("#accept_terms").click(function () {
    var isDisabled = $("#accept_terms").prop('checked');
    if (isDisabled) {
      $("#confirm_registration").removeAttr("disabled");
    } else {
      $("#confirm_registration").prop('disabled', true)
    }
  });
});

