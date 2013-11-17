$(document).ready(function() {

	$('#create_menu').on('submit', function(e){
		e.preventDefault()
		var data = $(this).serialize()
		ajaxReq('/menus', 'POST', data)
		var name = $('#new_menu_name')[0].value
		console.log(name)		
		appendToList(name)
	})

	$('#create_item').on('submit', function(e){
		e.preventDefault()
		var data = $(this).serialize()
		ajaxReq('/items', 'POST', data)
		var name = $('#new_item_name')[0].value
		var price = $('#new_item_price')[0].value
		appendToTable(name, price)
	})

	$('#item_select').on('change', function(){
		var itemId = this.value
		ajaxReq(targetUrl(itemId), 'POST')
		var text = $("option[value='" + itemId + "']")[0].innerText.split(' ')
		var price = text.pop()
		var name = text.join(' ')
		appendToTable(name, price, itemId)
	})

	$('#item_table').on('click', function(e){
		var elementClass = $(e.target).closest('tr')[0].className
		var itemId = elementClass.split('-').pop()
		ajaxReq(targetUrl(itemId), 'DELETE')
		$('.' + elementClass).remove()
	})

});

function targetUrl(itemId){
	loc = location.href.split('/').pop()
	if(loc === 'items'){ return '/' + loc + '/' + itemId 
	} else { return currentMenuItem(itemId) }
}

function currentMenuItem(itemId){
	var baseUrl = '/menuitems'
	var menuId = location.href.split('/').pop()
	return baseUrl + '/' + menuId + '/' + itemId
}

function ajaxReq(url, type, data){    
    $.ajax({ url: url, type: type, data: data // data can be undefined
    }).done(function(server_data){
      $('body').html(server_data)
    	console.log('success')
    }).fail(function(jqXHR, textStatus, errorThrown){
    	console.log("fail" + errorThrown)
    })
}

function appendToList(name){
	var new_menu = '<li><a href="#">' + name + '</a></li>'
	$('#menu_list').append(new_menu)
}

function appendToTable(name, price, itemId) {
	var new_row = '<tr value="' + itemId + '"><td>' + name +  '</td><td>' + price + '</td></tr>'
	$('#item_table').append(new_row)	
}