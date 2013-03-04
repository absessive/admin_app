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
//= require jquery-1.9.1.min
//= require jquery-ui-1.10.1.custom
//= require jquery.purr
//= require best_in_place
//= require best_in_place.purr
//= require bootstrap
//= require jquery.dataTables.min.js
//= require_self
//= require_tree .


/* Define two custom functions (asc and desc) for string sorting */
jQuery.fn.dataTableExt.oSort['string-case-asc']  = function(x,y) {
    return ((x < y) ? -1 : ((x > y) ?  1 : 0));
};
			
jQuery.fn.dataTableExt.oSort['string-case-desc'] = function(x,y) {
    return ((x < y) ?  1 : ((x > y) ? -1 : 0));
};    

var asInitVals = new Array();
    
$(document).ready(function(){
    
  $("tfoot input").keyup( function () {
    /* Filter on the column (the index) of this element */
    $("#usertable").dataTable().fnFilter( this.value, $("tfoot input").index(this) );
  });

  $("tfoot input").each( function (i) {
    asInitVals[i] = this.value;
  } );

  $("tfoot input").focus( function () {
    if ( this.className == "search_init" ){
      this.className = "";
      this.value = "";
    }
  });
    
  $("tfoot input").blur( function (i) {
    if ( this.value == "" ){
      this.className = "search_init";
      this.value = asInitVals[$("tfoot input").index(this)];
    }
  });
      
  $('#usertable').dataTable({ 
    "aaSorting" : [[ 0, "desc" ]],
		"aoColumns": [ null, null, null, null, null, { "bSortable": false }, { "bSortable": false }, 
									{ "bSortable": false }, { "bSortable": false } ],
    "fnDrawCallback": function( oSettings ) {
      $(".best_in_place").best_in_place();
    }
  });

});

