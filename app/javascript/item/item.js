const { htmlPrefilter } = require("jquery");

window.addEventListener('load', function () {
// $(document).on('turbolinks:load', ()=> {
  // 元々の記述
  const buildFileField = (index)=> {
    const html = `<div class="Image-box__form" data-index="${index}">
                  <input class="Image-box__uploader" type="file" name="item[item_images_attributes][${index}][src]" id="item_item_images_attributes_${index}_src">
                  <div class="remove">削除する</div>
                  </div>`;
                  return html;
  };


  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // // この下の２行書き足したので要検討
  lastIndex = $('.Image-box__form:last').data('index');
  fileIndex.splice(0, lastIndex);

  // inputタグを変更すると４つまで新しいinputタグが生成される
  $(document).on("change", ".Image-box__uploader", function(e) {
    if ($(".Image-box__uploader").length >= 4  )
      return false
    $(".ImageField").append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1 )
  });


  // もともと記述ここからプレビュー関連
  const buildImg = (index, url)=> {
    const html = `
    <img data-index="${index}" src="${url}" width="120px" height="120px">`;
    return html;
  }

  // 追加した画像のプレビュー
  $(".ImageField").on('change', ".Image-box__uploader", function(e){
    const targetIndex = $(this).parent().data('index');
    console.log(targetIndex)
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]){
      img.setAttribute('src',blobUrl);
    } else {
      $('.Image-box').append(buildImg(targetIndex, blobUrl));
      $('.ImageField').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1 )
    };
  });


  $(".ImageField").on('click',".remove", function(){
    // indexを取得する
    const targetIndex = $(this).parent().data('index');
    console.log(targetIndex)

    // IDを指定してチェックボックスにチェックを入れる
    const a = $(`#item_item_images_attributes_${targetIndex}__destroy`)
    a.trigger("click");   
    
    // inputタグのIDを取得する
    const picData = $(`#item_item_images_attributes_${targetIndex}_src`);　

    // IDをremoveする
    $(picData).remove();

    // プレビューを消す記述
    $(`img[data-index="${targetIndex}"]`).remove();

    $(this).parent(".Image-box__form").remove();

    if ($(".Image-box__uploader").length == 0) $('.ImageField').append(buildFileField(fileIndex[0]));
  });

});