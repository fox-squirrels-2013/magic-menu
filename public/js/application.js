$(document).ready(function() {


  $("#item-select").change(function(event){
    event.preventDefault()
    var item_id = selected_option_data()
    console.log(item_id)
    $.ajax({
      type: 'POST',
      url: '/menuitem/add',
      data: item_id
    }).done(function(menuitem){
      $("#menu-items").append(menuitem)
    }).fail(function(){
    console.log("fail");
    })
  })
  
   $("#menu-items").on("click",".menudelete", function(event){
    event.preventDefault()
    var menuitem_id = "id=" + $(this).data("id")
    var menuitem_id_selector = "#menuitem-" + $(this).data("id")
    console.log(menuitem_id)
    $.ajax({
      type: 'delete',
      url: '/menuitem',
      data: menuitem_id
    }).done(function(){
      $(menuitem_id_selector).remove()
      
    }).fail(function(){
    console.log("fail");
    })
  })
  
  $("#add-item").on('click',function(event){
    event.preventDefault()
    $("#item-form").slideToggle( "slow");
  });
  $("#add-menu").on('click',function(event){
    event.preventDefault()
    $("#menu-form").slideToggle( "slow");
  });
  
  $("#item-form").on('submit',function(event){
    event.preventDefault()
    $("#item-form").slideToggle("slow")
    console.log($(this).serialize())
    $.ajax({
      type: 'POST',
      url: '/item/new',
      data: $(this).serialize()
    }).done(function(item){
      $("#item-select").append(item)
    }).fail(function(){
    console.log("fail");
    })
  })
  
  function selected_option_data(){
    return "item_id=" + $('select option:selected').val()
  }

});
