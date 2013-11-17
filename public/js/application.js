$(document).ready(function() {

	$('#item_select').on('change', function(){
		var values = this.value.split(' ')
		url = '/menus/' + values[0] + '/additem/' + values[1]
		ajaxReq(url, 'POST')
		
		// $('#item_table').append('hihi')



		// <tr value="<%= item.id %>">
		// 	<td><%= item.name %></td>
		// 	<td><%= int_to_dollars(item.price) %></td>
		// </tr>

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
      $('body').html(server_data)
    }).fail(function(jqXHR, textStatus, errorThrown){
      console.log("fail" + errorThrown)
    })
  }