$("#category_form").change(function (){
  let parentValue = $("#category_form").val();
  if (parentValue.length != 0) {
    $.ajax({
      url: '/items/search',
      type: 'GET',
      data: { parent_id: parentValue},
      dataType: 'json'
    })
    .done(function (data){
    })
    .fail(function (){
    });
  }
});