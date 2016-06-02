//= require dataTables/datatables.min.js


$("select#nomination_type").change(function(){
     var id_value_string = $(this).val();
     if (id_value_string == "") {
         // if the id is empty remove all the sub_selection options from being selectable and do not do any ajax
         $("select#award option").remove();
         var row = "<option value=\"" + "" + "\">" + "" + "</option>";
         $(row).appendTo("select#award");
     }
     else {
         // Send the request and update sub category dropdown
         $.ajax({
             dataType: "json",
             cache: false,
             url: '/nominations/update_awards/' + id_value_string,
             timeout: 2000,
             error: function(XMLHttpRequest, errorTextStatus, error){
                 alert("Failed to submit : "+ errorTextStatus+" ;"+error);
             },
             success: function(data){
                 // Clear all options from sub category select
                 $("select#award option").remove();
                 //put in a empty default line
                 var row = "<option value=\"" + "" + "\">" + "" + "</option>";
                 $(row).appendTo("select#award");
                 // Fill sub category select
                 $.each(data, function(i, j){
                     row = "<option value=\"" + j.award.id + "\">" + j.award.name + "</option>";
                     $(row).appendTo("select#award");
                 });
              }
         });
     };

});
