
$(function() {
    $('#searchbutton').on('click', function() {
        var searchTerm = $('#searchinput').val();
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
                                     
                    console.log("Search Term: " + searchTerm + " Search In: " + searchIn + " Search By: " + searchBy);
                    // $.ajax({
                         // type: 'GET',
                         // url: 'search.php',
                         // cache: false,
                         // data: {
                                  // term: searchTerm,
                                  // searchIn: searchIn,
                                  // searchBy: searchBy                         
                               // }
                    
                    // })
                    // .done(function(data) {
                        // if (data.startswith("ERROR_PROCESS_SEARCH") {
                           // alert(errorMessage);
                        // } else {
                            // $('#searchtextcontainer').empty();
                            // $('#searchcontainer').innerHTML(data);
                        // }                            
                    // })
                    // .fail(function(jqHXR, textStats, errorThrown) {
                        // alert(errorMessage);
                    // });
                }
            }
        }
    });
    
    function isEmpty(str) {
        return ((typeof str == 'string') && 
               (!str.trim()) || 
               (typeof str == 'undefined') || 
               (str == null));
    }
});