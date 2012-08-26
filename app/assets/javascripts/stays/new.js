$(function() {
    $.datepicker.setDefaults($.datepicker.regional['fr']);
    $( "#stay_arrival_date" ).datepicker({
      minDate: 0,
      defaultDate: "+1w",
      regional: "fr",
      dateFormat: "dd/mm/yy",
      changeMonth: true,
      showOtherMonths:true,
      selectOtherMonths: true,
      onSelect: function( selectedDate ) {
        currentDate= $("#stay_arrival_date").datepicker("getDate")
      	$( "#stay_departure_date" ).datepicker( "option", "minDate",new Date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate() + 1));
      }
      });
    $( "#stay_departure_date" ).datepicker({
      minDate: 1,
      defaultDate: "+1w",
      dateFormat: "dd/mm/yy",
      showOtherMonths:true,
      selectOtherMonths: true,
      changeMonth: true,
      onSelect: function( selectedDate ) {
        currentDate= $("#stay_departure_date").datepicker("getDate")
      	$( "#stay_arrival_date" ).datepicker( "option", "maxDate", new Date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate() - 1) );
      }
    });
  });

    jQuery(function($){
        
        $.supersized({
        
          // Functionality
          slide_interval          :   7000,   // Length between transitions
          transition              :   1,      // 0-None, 1-Fade, 2-Slide Top, 3-Slide Right, 4-Slide Bottom, 5-Slide Left, 6-Carousel Right, 7-Carousel Left
          transition_speed    : 1000,    // Speed of transition
                                 
          // Components             
          slide_links       : 'blank',  // Individual links for each slide (Options: false, 'num', 'name', 'blank')
          slides          :   [     // Slideshow Images
                            {image : 'http://1.bp.blogspot.com/-BJNnMxoxkMs/TqOkxBgIX6I/AAAAAAAAA84/6yQhOGGmYMU/s1600/340945_10150301735356843_108412031842_8427553_1791147376_o.jpg', title : '#', url : 'http://www.google.fr/'},
                            {image : 'http://fr.prestige-mls.com/modules/documents/biens/5346/photos/40783.jpg', title : 'Oxynum', url : 'http://www.oxynum.fr/'},
                            {image : 'http://1.bp.blogspot.com/-BJNnMxoxkMs/TqOkxBgIX6I/AAAAAAAAA84/6yQhOGGmYMU/s1600/340945_10150301735356843_108412031842_8427553_1791147376_o.jpg', title : '#', url : 'http://www.google.fr/'},
                            {image : 'http://fr.prestige-mls.com/modules/documents/biens/5346/photos/40783.jpg', title : 'Oxynum', url : 'http://www.oxynum.fr/'},
                            {image : 'http://1.bp.blogspot.com/-BJNnMxoxkMs/TqOkxBgIX6I/AAAAAAAAA84/6yQhOGGmYMU/s1600/340945_10150301735356843_108412031842_8427553_1791147376_o.jpg', title : '#', url : 'http://www.google.fr/'},
                            {image : 'http://fr.prestige-mls.com/modules/documents/biens/5346/photos/40783.jpg', title : 'Oxynum', url : 'http://www.oxynum.fr/'}
                        ]
          
        });
        });
