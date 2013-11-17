function currentUrl(num_parts){
  num_parts = num_parts || 1
  return location.href.split('/').slice(-num_parts).join('/')
}

function add_item_to_menu(e) {
  var item_id = $('select').find(':selected').val();
  // var item_name = $('select').find(':selected').text();
  // console.log(item_id);
  // console.log($(this).serialize());

  $.post('/' + currentUrl(2), $(this).serialize())
    .done(function(data){
      console.log(data);
      // {"item":{"created_at":"2013-11-16T14:40:02-08:00","id":4,"name":"oranges with the cores cutout or something","price":450,"updated_at":"2013-11-16T14:40:02-08:00"}}
      var item = JSON.parse(data).item;

      var $item_html = $('.menu-item-template').clone()
                      .attr('class', 'menu-item')
                      .attr('display', 'inline');

      $item_html.find('.item').text(item.name + ' - $' + (item.price / 100.0));

      // this line is shit bc i have to know how the
      // partial is implemented using img and data-id
      $item_html.find('img').attr('data-id', item.id);

      $('.menu-items').append($item_html.html());
    })
    .fail(function(data){
      console.log('something went horribly wrong');
    });

}

function delete_something(e) {
  e.preventDefault();
  var $target = $(e.target);
  var model = $(e.target).data('model');
  var id = $(e.target).data('id');
  var form_data = '';

  if (model === 'menu') {
    form_data += 'menu_id=' + id
  } else if(model === 'item'){
    form_data += 'menu_id=' + currentUrl(1) + '&item_id=' + id
  }

  $.ajax({
    url: '/' + model + 's',
    method: 'delete',
    data: form_data

  }).done(function(data){
    // remove the menu item on successful delete
    // go ahead and attempt to remove both items.
    // holy jank-town!
    $target.closest('.menu-item').remove();
    $target.closest('.menu').remove();

  }).fail(function(data){
    console.log('something went horribly wrong, again!');

  });
}

$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $('body').on('change', 'select.item_id', add_item_to_menu);
  $('body').on('click', '.btn-delete img', delete_something);
});


