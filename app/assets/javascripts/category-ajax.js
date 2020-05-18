$(document).on('turbolinks:load', function(){
  let categoryBox = $('.sell__content__box__the-details__category')
  function appendOption(category) {
    let html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`
  }

  function appendChildBox(insertHTML) {
    let childSelectHtml = '';
    childSelectHtml = `<div class='form-select' id="child-category">
                      ${insertHTML}
                      </div>`
    categoryBox.append(childSelectHtml);
  }
  categoryBox.on("change", "#parent-category", function(){
    console.log(this)
    let parentCategory = $("#parent-category").val();
    console.log(parentCategory)
    if(parentCategory !== "") {
      $.ajax ({
        url: '/items/get_category_children',
        type: "GET",
        data: {
          parent_id: parentCategory
        },
        dataType: 'json'
      })
      .done(function(children){
        console.log(children)
        $('#child-category').remove();
        $('#grandchild-category').remove();
        var insertHTML = '';
        children.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        appendGrandchildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    } else {
      $('#child-category').remove(); 
      $('#grandchild-category').remove();
      $('#size').remove();
    }
  })
})