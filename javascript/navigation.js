
$(function() {
     $('#nav ul li').on('click', function(e) {
             if ($(this).hasClass('disabled')) {
                  e.preventDefault();
                  return false;
             } else {
               $('#account').addClass('disabled');
                    
                if ($('#catalog').hasClass('disabled')) {
                       $('#catalog').addClass('enabled');
                } else if ($('#search').hasClass('disabled')) {
                     $('#search').addClass('enabled');
                }
             }
     });
                
          $('#catalog').on('click', function(e) {
                 if ($('#catalog').hasClass('disabled')) {
                     e.preventDefault();
                     return false;
                 } else {
                    $('#catalog').addClass('disabled');
                    
                    if ($('#account').hasClass('disabled')) {
                       $('#account').addClass('enabled');
                    } else if ($('#search').hasClass('disabled')) {
                        $('#search').addClass('enabled');
                    }
                 }
                                      console.log("here");

               

          });
 
                $('#search').on('click', function(e) {
                    if ($('#search').hasClass('disabled')) {
                        e.preventDefault();
                        return false;
                    } else {
                        $('#search').addClass('disabled');
                        
                        if ($('#catalog').hasClass('disabled')) {
                           $('#catalog').addClass('enabled');
                        } else if ($('#account').hasClass('disabled')) {
                            $('#account').addClass('enabled');
                        }
                    }
                });
)};