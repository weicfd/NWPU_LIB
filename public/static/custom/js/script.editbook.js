function loadResults(){

    var url = config.path.ajax 
            + "/books?category_id=" + $('#category_fill').val();

    var table = $('#all-books');
    
    var default_tpl = _.template($('#allbooks_show').html());

    $.ajax({
        url : url,
        success : function(data){
            if($.isEmptyObject(data)){
                table.html('<tr><td colspan="99">No Books in this category</td></tr>');
            } else {
                table.html('');
                for (var book in data) {
                    table.append(default_tpl(data[book]));
                }
            }
        },
        beforeSend : function(){
            table.css({'opacity' : 0.4});
        },
        complete : function() {
            table.css({'opacity' : 1.0});
        }
    });
}


$(document).ready(function(){

    $("#category_fill").change(function(){
        loadResults();
    });
    
    
    $(document).on("click",".editbooks",function () {
        var form = $(this).parents('tr');
        var tr_edit = form.children('.editable');
       
        
        $.each(tr_edit,function () {
            var text = $(this).text();
            $(this).html(function () {
                return $("<input type='text' class='form-control-inline' value=\""+text+"\"></input>");
            })
            
        })
        $(this).removeClass("editbooks");
        $(this).addClass("editpost");
        $(this).text("Finish");
        
    });
    
    $(document).on("click",".editpost",function () {
        var form = $(this).parents('tr'),
        module_body = $(this).parents('.module-body'),
        tr_edit = form.children('.editable'),
        button = $(this);
       
        var sendJSON ={},
            send_flag = true;
        
        sendJSON.id = form.children('tr .book_id').text();
        sendJSON.title = form.children('tr .book_title').children('input').val();
        sendJSON.author = form.children('tr .book_author').children('input').val();
        sendJSON.isbn = form.children('tr .book_isbn').children('input').val();
        sendJSON.description = form.children('tr .book_dsp').children('input').val();
        if(sendJSON.title == "" || sendJSON.author == "" || sendJSON.isbn == ""|| sendJSON.description == ""){
            send_flag = false;
        }
        
        bookID = sendJSON.id;
        if (send_flag == false) {
            loadResults();
            module_body.prepend(templates.alert_box( {type: 'danger', message: 'Book Details Not Complete'} ));
            return;
        }else{
            $.ajax(
            {
                type : 'PATCH',
                data : {
                    edit_book_data : JSON.stringify(sendJSON)
                },
                url : config.path.ajax + 'books/' + bookID,
                success: function(data) {                    
                    module_body.prepend(templates.alert_box( {type: 'success', message: data} ));
                    $.each(tr_edit,function () {
                        var text = $(this).children('input').val();
                        $(this).replaceWith(function () {
                            return $("<td class=\"editable book_title\">"+text+"</td>");
                        });
                    });
                    button.removeClass("editpost");
                    button.addClass("editbooks");
                    button.text("Edit");
                },
                error: function(xhr,status,error){
                    loadResults();
                    var err = eval("(" + xhr.responseText + ")");
                    module_body.prepend(templates.alert_box( {type: 'danger', message: err.error.message} ));
                },
                beforeSend: function() {
                    form.css({'opacity' : '0.4'});
                },
                complete: function() {
                    form.css({'opacity' : '1.0'});
                }
            });
        }
        

    });
    
    $(document).on("click", ".deletebooks", function () {
        var form = $(this).parents('tr'),
        module_body = $(this).parents('.module-body'),
        send_flag = true,
        bookID = form.children('tr .book_id').text();
        
        
        if (send_flag == true) {
            $.ajax(
            {
                type : 'DELETE',
                url : config.path.ajax + "/books/" +bookID,
                success: function(data) {                    
                    module_body.prepend(templates.alert_box( {type: 'success', message: data} ));
                },
                error: function(xhr,status,error){
                    var err = eval("(" + xhr.responseText + ")");
                    module_body.prepend(templates.alert_box( {type: 'danger', message: err.error.message} ));
                },
                beforeSend: function() {
                    form.css({'opacity' : '0.4'});
                },
                complete: function() {
                    form.css({'opacity' : '1.0'});
                }
            });
        }
        
        loadResults();
    });


    loadResults();

});