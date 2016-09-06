var holdSearchInput;
var holdSearchIn;
var holdSearchBy;

$(function() {
    $(window).on('unload', function() {
        $.ajax({
             type: 'POST',
             url: 'saveSearch.php',
             data:
                   {
                       searchInput: holdSearchInput,
                       searchIn: holdSearchIn,
                       searchBy: holdSearchBy,
                       
                       
                   }                   
        )};
    });
    
    $('#searchbutton').on('click', function() {
        var searchTerm = $('#searchinput').val().trim();
        var regexAllLetters = /^[a-zA-Z- ]+$/;
        
        if (isEmpty(searchTerm)) {
            alert("Must Enter Search Term");
            $('#searchinput').focus();
        } else if(!(searchTerm.match(regexAllLetters))) {
            alert("Search Term Must Not Contain Special Characters except hyphen");
            $('#searchinput').focus();
        } else {
            var searchIn = $('#indropdown option:selected').val();
            if (isEmpty(searchIn)) {
                alert("Must Select Where to Search In");
                $('#indropdown').focus();
            } else {
                var  searchBy = $('#bydropdown option:selected').val();
                if (isEmpty(searchBy)) {
                    alert('Must Select Where to Search By');
                    $('#bydropdown').focus();
                } else {
                    var errorMessage = "Error Processing Search, Please Try Again";
                    //Insert underscore for sql column
                    
                    $.ajax({
                         type: 'GET',
                         url: 'processSearch.php',
                         cache: false,
                         data: {
                                  searchTerm: searchTerm,
                                  searchIn: searchIn,
                                  searchBy: searchBy                         
                               }
                    
                    })
                    .done(function(data) {
                         if (data.match("^ERROR_PROCESS_SEARCH")) {
                            alert(errorMessage);
                         } else {
                             $('#searchresultscontainer').html(data);
                         }                            
                    })
                    .fail(function(jqHXR, textStats, errorThrown) {
                        alert(errorMessage);
                    });
                }
            }
        }
        holdSearchInput = searchTerm;
    });
    
    $('#searchinput').on('keyup', function() {
        holdSearchInput = $(this).val().trim();
    });
    
    $('#indropdown').on('change', function() {
        holdSearchIn = $(this).find('option:selected').text();
    });
    
    $('#bydropdown').on('change', function() {
        holdSearchBy = $(this).find('option:selected').text();
    });
    
    function isEmpty(str) {
        return ((typeof str == 'string') && 
               (!str.trim()) || 
               (typeof str == 'undefined') || 
               (str == null));
    }
});