$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

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

});
