$(document).ready(function() {

	$('#item_select').on('change', function(){
		// var plain_vals = this.value
		var vals = this.value.split(' ')
		url = '/menus/' + vals[0] + '/additem/' + vals[1]


		var text = $("option[value='" + this.value + "']")[0].innerText.split(' ')
		console.log(text)
		var price = text.pop()
		text.pop() // remove '-' from array
		var name = text.join(' ')

		var new_row = '<tr value="' + vals[1] + '"><td>' + name +  '</td><td>' + price + '</td></tr>'

		$('#item_table').append(new_row)

		ajaxReq(url, 'POST')

	})

	// $('#menu_items').on('click', function(e){

	// 	// ajaxReq(url, 'DELETE')
	// 	console.log($(e.target).closest('tr'))
	// 	$(e.target).closest('tr').remove()
	// })

});

  function ajaxReq(url, type, data){
    // data can be undefined
    $.ajax({
      url: url,
      type: type,
      data: data
    }).done(function(server_data){
      console.log('success')
      // $('body').html(server_data)
    }).fail(function(jqXHR, textStatus, errorThrown){
      console.log("fail" + errorThrown)
    })
  }
