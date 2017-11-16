
$(function() {
      $('#tablecatalog').tablesorter();
    
     //Reset Drop Down On Refresh
     $('#departmentfilter').prop('selectedIndex', 0);
     
        // Set Drop Down Filter Department        
        $('#departmentfilter').on('change', function() {
          var selected = $(this).find('option:selected').text();
          if (selected != "-- Select Location --") {
              $('#tablecourses tr td:nth-child(2)').each(function() {
                   if($(this).text() != selected) {
                      $(this).parent().hide();
                   } else {
                      $(this).parent().show();
                   }
               });
           } else {
             $('#tablecourses tr').each(function() {
                    var $row = $(this);
                    if(!($row.is(":visible"))) {
                        $row.show();
                    } 
             });
          }           
     });
});