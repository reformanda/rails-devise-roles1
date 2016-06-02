//= require dataTables/datatables.min.js
$("select#nomination_nomination_type_id").change(function(){
     var id_value_string = $(this).val();
     var option_id = $("select#nomination_award_option_id").val();
     //alert(option_id);
     if (false) {
         // if the id is empty remove all the sub_selection options from being selectable and do not do any ajax
         $("select#nomination_award_option_id option").remove();
         //var row = "<option value=\"" + "" + "\">" + "" + "</option>";
         //$(row).appendTo("select#nomination_award_option_id");
     }
     else {
         // Send the request and update sub category dropdown
         $.ajax({
             dataType: "script",
             cache: false,
             url: '/nominations/update_awards/',
             data: { id: id_value_string, option_id: option_id  },
             timeout: 2000,
             error: function(XMLHttpRequest, errorTextStatus, error){
                 alert("Failed to submit : "+ errorTextStatus+" ;"+error);
             },
             success: function(data){
                 // Clear all options from sub category select
                 //$("select#award option").remove();
                 //put in a empty default line
                 //var row = "<option value=\"" + "" + "\">" + "" + "</option>";
                 //$(row).appendTo("select#award");
                 // Fill sub category select
                 //$.each(data, function(i, j){
                //     row = "<option value=\"" + j.award.id + "\">" + j.award.name + "</option>";
                //     $(row).appendTo("select#award");
                // });
              }
         });
     };



});
