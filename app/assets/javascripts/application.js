// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree ./lib

$(function() {
    var startDate;
    var endDate;
    var initialMinDate;

    tmp_date= new Date();
    initialMinDate= 6 - tmp_date.getDay();
    if(initialMinDate == 0)
      initialMinDate= 7
    var selectCurrentWeek = function() {
        window.setTimeout(function () {
            $('#week-picker').find('.ui-datepicker-current-day a').addClass('ui-state-active')
        }, 1);
    }


    
    $('#week-picker').datepicker( {
        showOtherMonths: true,
        selectOtherMonths: true,
        minDate: initialMinDate,
        firstDay:6,
        onSelect: function(dateText, inst) { 
            var date = $(this).datepicker('getDate');
            startDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() - 1);
            endDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() + 5);
            var dateFormat = inst.settings.dateFormat || $.datepicker._defaults.dateFormat;
            $('#stay_arrival_date').val($.datepicker.formatDate( dateFormat, startDate, inst.settings ));
            $('#stay_departure_date').val($.datepicker.formatDate( dateFormat, endDate, inst.settings ));
            $('#fake_arrival_date').val($.datepicker.formatDate( dateFormat, startDate, inst.settings ));
            $('#fake_departure_date').val($.datepicker.formatDate( dateFormat, endDate, inst.settings ));
            
            selectCurrentWeek();
        },
        beforeShowDay: function(date) {
            var cssClass = '';
            if(date >= startDate && date <= endDate)
                cssClass = 'ui-datepicker-current-day';
            return [true, cssClass];
        },
        onChangeMonthYear: function(year, month, inst) {
            selectCurrentWeek();
        }
    });
    
    $('.ui-datepicker-calendar tr').live('mousemove', function() { $(this).find('td a').addClass('ui-state-hover'); });
    $('.ui-datepicker-calendar tr').live('mouseleave', function() { $(this).find('td a').removeClass('ui-state-hover'); });
});


