$(document).ready(function() {
 
  $('#createMenu').on('submit',function(e){
  	e.preventDefault();
  	
  	$.ajax({
  		url: '/menu/new',
  		type: 'post',
  		data: $('#createMenu').serialize()
  	}).done(function(data){
  		if(data === 'false'){
  			$('.fading').css("display","block")
  			$('.fading').html('Your menu must have a title!')
  		}else{
  			$('.fading').css("display","block")
  			$('.fading').html('Added!')
  			$('.fading').fadeOut(3000)

  			$('#menus').prepend(data + "<br/>")	
  			$('#createMenu')[0][0].value = ""
  		}
  	})
  })

  $('#createItem').on('submit',function(e){
  	e.preventDefault();
  	
  	$.ajax({
  		url: '/item/new',
  		type: 'post',
  		data: $('#createItem').serialize()
  	}).done(function(data){
  		if(data === 'false'){
  			$('.fading').css("display","block")
  			$('.fading').html('Your item must have a name!')
  		}else{
  			$('.fading').css("display","block")
  			$('.fading').html('Added!')
  			$('.fading').fadeOut(3000)

  			$('#items').prepend(data + "<br/>")
  			$('#createItem')[0][0].value = ""	
  		}
  	})
  })

});

//WHEN USING JS TO ADD TO LIST, ALSO ADD THE ANCHOR TAG