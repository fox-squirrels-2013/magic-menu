$(document).ready(function() {

	$('#item_select').on('change', function(e){
		var values = this.value.split(' ')
		url = '/menus/' + values[0] + '/additem/' + values[1]
		ajaxReq(url, 'POST')
	})

});

function ajaxReq(url, type, data){
    // data can be undefined
    $.ajax({
    	url: url,
    	type: type,
    	data: data
    }).done(function(server_data){
    	$('body').html(server_data)
    }).fail(function(jqXHR, textStatus, errorThrown){
    	console.log("fail" + errorThrown)
    })
}