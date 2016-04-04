
$(function() {
     //Reset Drop Down On Refresh
     $('#departmentfilter').prop('selectedIndex', 0);
     
     var ajaxCall = $.ajax({
                 type: 'GET',
                 url: "/php/getCourses.php",
                 data: {
                      includeCheckbox: false
                 },
                 dataType: 'html',
                 cache: false             
             });
             
        ajaxCall.done (function(data) {         
                $('#tablecourses tbody').append(data);
                $('tr:odd').css('background-color', '#D3D3D3');
                $('#tablecourses').tablesorter({
                    headers: { 0: { sorter: false} } 
                });                
             }); 
             
             ajaxCall.fail (function(jqXHR, textStatus, errorThrown) { 
                              alert("Error Loading Courses");
             });
             
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