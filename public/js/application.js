$(document).ready(function() {

	$('#item_select').on('change', function(){
		var vals = this.value.split(' ')
		url = '/menus/' + vals[0] + '/additem/' + vals[1]
		ajaxReq(url, 'POST')

		var text = $("option[value='" + vals.join(' ') + "']")[0].innerText.split(' ')
		var price = text.pop()
		var name = text.join(' ')
		var new_row = '<tr value="' + vals[1] + '"><td>' + name +  '</td><td>' + price + '</td></tr>'
		$('#item_table').append(new_row)			
	})

	// $('#menu_items').on('click', function(e){

	// 	// ajaxReq(url, 'DELETE')
	// 	console.log($(e.target).closest('tr'))
	// 	$(e.target).closest('tr').remove()
	// })

});


function ajaxReq(url, type, data){    
    $.ajax({ url: url, type: type, data: data // data can be undefined
    }).done(function(server_data){
    	console.log('success')
    }).fail(function(jqXHR, textStatus, errorThrown){
    	console.log("fail" + errorThrown)
    })
}
