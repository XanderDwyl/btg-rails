// http://codeseven.github.io/toastr/demo.html

var Toast = {
  options: {
    "closeButton"       : true,
    "debug"             : false,
    "progressBar"       : false,
    "preventDuplicates" : false,
    "positionClass"     : "toast-top-center",
    "onclick"           : null,
    "showDuration"      : "400",
    "hideDuration"      : "1000",
    "timeOut"           : "3000",
    "extendedTimeOut"   : "1000",
    "showEasing"        : "swing",
    "hideEasing"        : "linear",
    "showMethod"        : "fadeIn",
    "hideMethod"        : "fadeOut"
  },
  error: function(message, title) {
    toastr.options = this.options;
    toastr.error(message, title);
  },
  success: function(message, title) {
    toastr.options = this.options;
    toastr.success(message, title);
  }
};

