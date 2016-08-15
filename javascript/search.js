
$(function() {
    $('#searchbutton').on('click', function() {
        var searchTerm = $('#searchinput').val().trim();
        
        if (isEmpty(searchTerm)) {
            alert("Must Enter Search Term");
        } else {
            var searchInText = $('#indropdown option:selected').text();
            if (isEmpty(searchInText)) {
                alert("Must Select Where to Search In");
            } else {
                //Proceed To Search
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