window.addEventListener('load', function () {
// 子レベルのselectタグを追加
function add_childSelect_tag() {
  let child_select_form = `
            <select name="item[category_id]" class="child_category_id">
              <option value="">---</option>
            </select>
            `
  return child_select_form;
}

// selectタグにoptionタグを追加
function add_Option(children) {
  let option_html = `
                    <option value=${children.id}>${children.name}</option>
                    `
  return option_html;
}
console.log("test1")

// 親カテゴリを選択したあとのイベント
$("#category_form").on("change", function() {
  console.log("test2")
  let parentValue = $("#category_form").val();
  if (parentValue.length != 0) {
    $.ajax({
      url: '/items/search',
      type: 'GET',
      data: { parent_id: parentValue},
      dataType: 'json'
    })
    .done(function (data){
      let child_select_form = add_childSelect_tag
      $(".categoryField").append(child_select_form);
      data.forEach(function(d){
        let option_html = add_Option(d)
        $(".child_category_id").append(option_html);
      })
    })
    .fail(function (){
      alert("エラーです")
    });
  }
});

console.log("test3")
})