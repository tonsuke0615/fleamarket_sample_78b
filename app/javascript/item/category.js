window.addEventListener('load', function () {
// 子レベルのselectタグ
function add_childSelect_tag() {
  let child_select_form = `
              <select name="item[category_id]" id="item_category_id" class="child_category_id">
              <option value="">カテゴリを選択</option>
              </select>
            `
  return child_select_form;
}

// 孫レベルのセレクトタグ
function add_grandchildSelect_tag(){
  let grandchild_select_form = `
              <select name="item[category_id]" id="item_category_id" class="grandchild_category_id">
              <option value="">カテゴリを選択</option>
              </select>
            `
  return grandchild_select_form
}

// selectタグにoptionタグを追加
function add_Option(children) {
  let option_html = `
                    <option value=${children.id}>${children.name}</option>
                    `
  return option_html;
}

// 親カテゴリを選択したあとのイベント
$("#category_form").on("change", function() {
  let parentValue = $("#category_form").val();
  if (parentValue.length !== 0) {
    $.ajax({
      url: '/items/search',
      type: 'GET',
      data: { parent_id: parentValue},
      dataType: 'json'
    })
    .done(function (data){
      $(".child_category_id").remove();
      $(".grandchild_category_id").remove();
      let child_select_form = add_childSelect_tag
      $(".ItemInfo__category--form").append(child_select_form);
      data.forEach(function(d){
        let option_html = add_Option(d)
        $(".child_category_id").append(option_html);
      });
    })
    .fail(function (){
      alert("カテゴリ取得に失敗しました");
    })
  }else{
    $(".child_category_id").remove();
    $(".grandchild_category_id").remove();  
  }
});

// 子カテゴリ選択後のイベント
$(document).on("change", ".child_category_id", function(){
  let childValue = $(".child_category_id").val();
  if (childValue.length !=0){
    $.ajax({
      url: '/items/search',
      type: 'GET',
      data: { children_id: childValue},
      dataType: 'json'
    })
    .done(function (gc_data){
      $(".grandchild_category_id").remove();
      let grandchild_select_form = add_grandchildSelect_tag
      $(".ItemInfo__category--form").append(grandchild_select_form);
      gc_data.forEach(function (gc_d){
        let option_html = add_Option(gc_d);
        $(".grandchild_category_id").append(option_html);
      })
    })
    .fail(function (){
      alert("カテゴリ取得に失敗しました");
    });
  }else{
    $(".grandchild_category_id").remove();  
  };
});
})