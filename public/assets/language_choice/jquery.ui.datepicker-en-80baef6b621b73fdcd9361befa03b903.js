jQuery(function($){

		$.datepicker.regional['en'] = {
		closeText: 'Close',
		prevText: 'Previous',
		nextText: 'Next',
		currentText: 'Today',
		monthNames: ['January','February','March','April','May','June',
		'July','August','September','October','November','December'],
		monthNamesShort: ['Jan.','Feb.','March','April','May','June',
		'July','Aug.','Sept.','Oct.','Nov.','Dec.'],
		dayNames: ['Sunday','Monday','Tuesday','Wenesday','Thursday','Friday','Saturday'],
		dayNamesShort: ['Sun.','Mon.','Tue.','Wen.','Thu.','Fri.','Sat.'],
		dayNamesMin: ['Su','M','Tu','W','Th','F','Sa'],
		weekHeader: 'Week',
		dateFormat: 'dd/mm/yy',
		firstDay: 1,
		isRTL: false,
		showMonthAfterYear: false,
		yearSuffix: ''};



		$.datepicker.setDefaults($.datepicker.regional['en']);
});
