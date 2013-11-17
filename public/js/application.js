$(document).ready(function() {

  $('#item_select').on('change', function(e){
  	console.log(this.value.split(' '))
  	var values = this.value.split(' ')

  	$.ajax({
  		type: 'POST',
  		url: '/menus/' + values[0] + '/additem/' + values[1]
  	}).done(function(server_data){
  		console.log('creating new page')
  		$('body').html(server_data)
  	}).fail(function(jqXHR, textStatus, errorThrown){
  		console.log("fail" + errorThrown)
  	})
  })

});


  // function ajaxReq(url, type, data){
  //   // data can be undefined
  //   $.ajax({
  //     url: url,
  //     type: type,
  //     data: data
  //   }).done(function(server_data){
  //     $('body').html(server_data)
  //   }).fail(function(jqXHR, textStatus, errorThrown){
  //     console.log("fail" + errorThrown)
  //   })
  // }

// $.post( "ajax/test.html", function( data ) {
//   $( ".result" ).html( data );
// });


// $.ajax({
//   type: "POST",
//   url: url,
//   data: data,
//   success: success,
//   dataType: dataType
// });