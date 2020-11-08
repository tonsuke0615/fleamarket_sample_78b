window.addEventListener('load', function () {
// $(document).on('turbolinks:load', ()=> {
  const buildFileField = (index)=> {
    const html = `<div class="Image-box__form" data-index="${index}">
                  <input class="Image-box__uploader" type="file" name="item[item_images_attributes][${index}][src]" id="item_item_images_attributes_${index}_src">
                  <div class="remove">削除する</div>
                  </div>`;

                  // <input name="item[item_images_attributes][${index}][_destroy]" type="hidden" >
                  // <input data-index="${index}" class="hidden" type="checkbox" value="1" name="item[item_images_attributes][${index}][_destroy]" id="item_item_images_attributes_${index}__destroy">

                  return html;
  };

  let fileIndex = [1,2,3];
  // // この下の２行書き足したので要検討
  lastIndex = $('.Image-box__form:last').data('index');
  fileIndex.splice(0, lastIndex);

  $(document).on("change", ".Image-box__uploader", function(e) {
    if ($(".Image-box__uploader").length >= 4)
      return false
    $(".ImageField").append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1 )
  });

  $(".remove").on('click',function(){
    // indexを取得する
    let getIndex = $(this).parent().data('index');
    console.log(getIndex)

    // IDを指定してチェックボックスにチェックを入れる
    const a = $(`#item_item_images_attributes_${getIndex}__destroy`)
    console.log(a)
    a.trigger("click");  
    
    // inputタグのIDを取得する
    const picData = $(`#item_item_images_attributes_${getIndex}_src`);　
    console.log(picData);

    // IDをremoveする
    $(picData).remove();
    $(this).parent(".Image-box__form").remove();
    // $(picData).parent().remove();

    if ($(".Image-box__uploader").length == 0) $('.ImageField').append(buildFileField(fileIndex[0]));
  });



  // // $(".hidden").hide();
  // $(document).on('click', '.remove', function() {
  //   const targetIndex = $(this).parent().data('index');
  //   const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden`);
  //   if (hiddenCheck) hiddenCheck.prop('checked', true);
  //     // $(this).parent(".Image-box__form").data().remove();
  //   if ($(".Image-box__uploader").length == 0) $('.ImageField').append(buildFileField(fileIndex[0]));
  // });
});