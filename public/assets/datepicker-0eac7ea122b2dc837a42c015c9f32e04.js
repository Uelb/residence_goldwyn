
$(function() {
    var startDate;
    var endDate;
    var initialMinDate;

    tmp_date= new Date();
    initialMinDate= 6 - tmp_date.getDay();
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
            if(date.getDay() == 6){
                startDate= new Date(date.getFullYear(), date.getMonth(), date.getDate());
                endDate= new Date(date.getFullYear(), date.getMonth(), date.getDate() + 6);
            }
            else{
                startDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() - 1);
                endDate = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() + 5);
            }
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
    
    $('.ui-datepicker-calendar tr').on('mousemove', function() { $(this).find('td a').addClass('ui-state-hover'); });
    $('.ui-datepicker-calendar tr').on('mouseleave', function() { $(this).find('td a').removeClass('ui-state-hover'); });
});


