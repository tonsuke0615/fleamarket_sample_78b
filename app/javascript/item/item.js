window.addEventListener('load', function () {
  // $(document).on('turbolinks:load', ()=> {
    const buildFileField = (index)=> {
      const html = `<div class="Image-box"><div class="Image-box__top">
                    <label for="item_item_images_attributes_${index}_src">
                    <i class="fas fa-camera Image-box__icon"></i>
                    <div class="Image-box__form" data-index="${index}"></div>
                    <input class="Image-box__uploader" type="file" name="item[item_images_attributes][${index}][src]" id="item_item_images_attributes_${index}_src">
                    </label></div><div class="Image-box__bottom"><span class="js-remove">削除</span></div></div>`;
      return html;
    }
  
    let fileIndex = [1,2,3];
  
    $(document).on("change", ".Image-box__uploader", function(e) {
      if ($(".Image-box__uploader").length >= 4)
        return false
      $(".ImageField").append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1 )
    });
  
    $(document).on('click', '.js-remove', function() {
      // const index = $(this).parents(".Image-box").data("index");
      $(this).parent().parent().remove();
      if ($(".Image-box__uploader").length == 0) $('.ImageField').append(buildFileField(fileIndex[0]));
    });
  
    // $(document).on('click', '.js-remove', function() {
    //   $(".Image_box").remove();
    //   if ($(".js-file").length == 0) $('.ImageField').append(buildFileField(fileIndex[0]));
    // });
  
  });
  