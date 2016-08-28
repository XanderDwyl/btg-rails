(function ($) {

  $(document).on('ready', function () {
    var progressbar = $('.progress-bar.animated');
    progressbar.each(function(item){
      var progressVal = $(progressbar[item]).attr('data-width');
      var widthStyle  = 'width: ' + progressVal + '%;';

      $(progressbar[item]).attr('style', widthStyle);
      var progressTitle = $(progressbar[item]).parent().siblings();
      $(progressTitle).find('span.badge').append(progressVal + '%');
    })
  })
}(jQuery));
