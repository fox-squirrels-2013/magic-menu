$(document).ready(function() {
  // Add Items and Delete Items

  $("#item_form").on("submit", function(e){
    e.preventDefault();
    $.ajax({
      url: 'item/new',
      type: "POST",
      data: $(this).serialize(),
      success: function(item) {
        new_item = '<td>' + item.name + '</td><td>' + item.price + '</td><td><a class="delete_item" id="' + item.id + '" href="#"> Delete </a></td></br>';
        $('#item_table').append(new_item)
      }
    })
  });

  $(document).on('click', '.item_row .delete_item', function(e) {
    e.preventDefault();
    item_id = e.target.id;
    $.ajax({
      url: '/item/delete/'+item_id,
      type: "GET"
    }).complete(
    $(this).closest('tr').remove()
    )
  })

  // Add Menu and Delete Menu

  $("#menu_form").on("submit", function(e){
    e.preventDefault();
    $.ajax({
      url: 'menu/new',
      type: "POST",
      data: $(this).serialize(),
      success: function(menu) {
        new_menu = '<p><a href="menu/' + menu.id + '">' + menu.name + '</a></p>'
        $('#menu_list').append(new_menu)
      }
    })
  });

  // $(document).on('click', '.item_row .delete_item', function(e) {
  //   e.preventDefault();
  //   item_id = e.target.id;
  //   $.ajax({
  //     url: '/item/delete/'+item_id,
  //     type: "GET"
  //   }).complete(
  //   $(this).closest('tr').remove()
  //   )
  // })

});
