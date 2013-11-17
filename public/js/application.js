$(document).ready(function() {

  $('#item_select').on('change', function(e){
  	console.log(this.value.split(' '))
  	var values = this.value.split(' ')

  	$.ajax({
  		type: 'POST',
  		url: '/menus/' + values[0] + '/additem/' + values[1]
  	})
  })

});

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