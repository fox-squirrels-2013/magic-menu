$(document).ready(function() {
  console.log('your about to use jquery to select')
$('select').on('click',function(e) { 
	e.prevent.default()
	console.log("you've jqueery selected");
		$.ajax({
			url: '/menus/#{params[:id]}',
			type: post
			//data: $(this).serialize()
		}).done(function(server_data){

			console.log(server_data)
			$(".items").append(server_data)
		})
})
}

);


//$('select option:selected')