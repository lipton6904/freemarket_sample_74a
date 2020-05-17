$(document).on('turbolinks:load', function(){
  let categoryBox = $('.sell__content__box__the-details__category__select__box')
  function appendOption(category) {
    let html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`
  }

  function appendChildBox(insertHTML) {
    let childSelectHtml = '';
    childSelectHtml = `<select class="sell__content__box__the-details__category__select__box" category_id="category_id" name="item[category_id]" id="item_category_id">
                        ${insertHTML}
                        </select>`
    categoryBox.append(childSelectHtml);
  }
  categoryBox.on("change", "#parent-category", function(){
    var parentCategory = $("parent-category").value;
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