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

