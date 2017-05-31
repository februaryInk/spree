$(document).ready(function() {
    $('.js-tabs').tabs();
});

$(document).on('turbolinks:load', function() {
    $('.js-tabs').tabs();
});

(function($) {    
    // Apply tab functionality to the given `ul`.
    $.fn.tabs = function() {
        
        $(this).each(function(index, element) {
          
            if (!$(this).hasClass('activated')) {
              
                $(this).addClass('activated');
        
                var tabs = $(this).children();
                var tabContentIds = $(tabs).map(function() { return('#' + $(this).data('target-id')); }).get().join(', ');
                var tabContents = $(tabContentIds);
                
                $(tabs).each(function(index2, element2) {
                    $(document).on('click', '*[data-target-id="' + $(element2).data('target-id') + '"]', function(event) {
                        var tabContentId = '#' + $(this).data('target-id');
                        var tabContent = $(tabContentId);
                        
                        console.log( 'Open ' + tabContent );
                        
                        $(tabs).removeClass('-open');
                        $(this).addClass('-open');
                        
                        $(tabContents).removeClass('-open');
                        $(tabContent).addClass('-open');
                    });
                });
            }
        });
    }
})(jQuery);
