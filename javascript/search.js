
$(function() {
    $('#searchbutton').on('click', function() {
        var searchTerm = $('#searchinput').val();
        
        if (isEmpty(searchTerm)) {
            alert("Must Enter Search Term");
        } else {
            var searchInText = $('#indropdown option:selected').val();
            if (isEmpty(searchInText)) {
                alert("Must Select Where to Search In");
            } else {
                var  searchByText = $('#bydropdown option:selected').val();
                if (isEmpty(searchByText)) {
                    alert('Must Select Where to Search By');
                } else {
                    var errorMessage = "Error Processing Search, Please Try Again";
                    //Insert underscore for sql column
                    if (searchBy.indexOf(' ') > -1) {
                        searchBy.replace(/ /g, "_");
                    }
                    //Convert to lower case easier to read sql
                    searchIn = searchIn.toLowerCase();
                    searchBy = searchBy.toLowerCase();
                    $.ajax({
                         type: 'GET',
                         url: 'search.php',
                         cache: false,
                         data: {
                                  term: searchTerm,
                                  searchIn: searchIn,
                                  searchBy: searchBy                         
                               }
                    
                    })
                    .done(function(data) {
                        if (data.startswith("ERROR_PROCESS_SEARCH") {
                           alert(errorMessage);
                        } else {
                           
                        }                            
                    })
                    .fail(function(jqHXR, textStats, errorThrown) {
                        alert(errorMessage);
                    });
                }
            }
        }
    });
    
    function isEmpty(str) {
        return ((typeof str == 'string') && 
               (!str.trim()) || 
               (typeof str == 'undefined')} || 
               (str == null));
    }
});