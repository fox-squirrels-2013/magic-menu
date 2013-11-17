$(document).ready(function() {

	$('#item_select').on('change', function(){
		url = '/menus/' + currentMenu() + '/item/' + this.value
		ajaxReq(url, 'POST')
		appendToTable(this.value)
	})

	$('#menu_items').on('click', function(e){
		var elementId = $(e.target).closest('tr')[0].id
		var itemId = elementId.split('-').pop()
		url = '/menus/' + currentMenu() + '/item/' + itemId
		ajaxReq(url, 'DELETE')
		$('#' + elementId).remove()
	})

});

function currentMenu(){
	return location.href.split('/').pop()
}

function ajaxReq(url, type, data){    
    $.ajax({ url: url, type: type, data: data // data can be undefined
    }).done(function(server_data){
    	console.log('success')
    }).fail(function(jqXHR, textStatus, errorThrown){
    	console.log("fail" + errorThrown)
    })
}

function appendToTable(value) {
	var text = $("option[value='" + value + "']")[0].innerText.split(' ')
	var price = text.pop()
	var name = text.join(' ')
	var new_row = '<tr value="' + value + '"><td>' + name +  '</td><td>' + price + '</td></tr>'
	$('#item_table').append(new_row)	
}