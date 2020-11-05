window.addEventListener('load', function () {
// $(document).on('turbolinks:load', ()=> {
  const buildFileField = (index)=> {
    const html = `<div class="Image-box__form" data-index="${index}">
                  <input class="Image-box__uploader" type="file" name="item[item_images_attributes][${index}][src]" id="item_item_images_attributes_${index}_src">
                  <div class="remove">削除</div></div>`;
    
                  // ラベルとアイコン付のときに使っていたコード
                  // <div class="Image-box"><div class="Image-box__top">
                  // <label for="item_item_images_attributes_${index}_src">
                  // <div class="Image-box__form" data-index="${index}"></div>
                  // <input class="Image-box__uploader" type="file" name="item[item_images_attributes][${index}][src]" id="item_item_images_attributes_${index}_src">
                  // </label></div><div class="Image-box__bottom"><span class="js-remove">削除</span></div></div>`;
    return html;
  }

  let fileIndex = [1,2,3];
  // この下の２行書き足したので要検討
  lastIndex = $('.Image-box__form:last').data('index');
  fileIndex.splice(0, lastIndex);

  $(document).on("change", ".Image-box__uploader", function(e) {
    if ($(".Image-box__uploader").length >= 4)
      return false
    $(".ImageField").append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1 )
  });

  $(".hidden").hide();
  $(document).on('click', '.remove', function() {
    const targetIndex = $(this).parent().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
      $(this).parent().remove();
    if ($(".Image-box__uploader").length == 0) $('.ImageField').append(buildFileField(fileIndex[0]));
  });

  // $(".Image_box__top").on('click', '.remove',function(){
  //   const targetIndex = $(this).parent().data('index');
  //   const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden`);
  //   if (hiddenCheck) hiddenCheck.prop('checked', true);
  // });

});