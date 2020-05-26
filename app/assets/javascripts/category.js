// カテゴリーセレクトボックス
$(function(){
  function appendOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示
  function appendChildrenBox(insertHTML){
    var childSelectHtml = '';
      childSelectHtml = `<div class='sell__content__box__the-details__category__select' id= 'children_wrapper'>
                        <select class="sell__content__box__the-details__category__select__box" id="child_category" name="item[categorie_id]">
                        <option value="">選択してください</option>
                        ${insertHTML}
                        </select>
                        </div>`;
    $('.sell__content__box__the-details__category__select').append(childSelectHtml);
  }
  // 孫カテゴリーの表示
  function appendgrandChildrenBox(insertHTML){
    var grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `<div class='sell__content__box__the-details__category__select' id= 'grandchildren_wrapper'>
                              <select class="sell__content__box__the-details__category__select__box" id="grandchild_category" name="item[categorie_id]">
                              <option value="">選択してください</option>
                              ${insertHTML}
                              </select>
                              </div>`;
    $('#children_wrapper').after(grandchildrenSelectHtml)
  }

  $(document).on('change', '#category_select', function(){
    var productcategory = document.getElementById('category_select').value;
    $('#children_wrapper').remove();
    $('#grandchildren_wrapper').remove();
    if (productcategory != ''){
      $.ajax({
        url: '/items/category_children',
        type: 'GET',
        data: { productcategory: productcategory },
        dataType: 'json'
      })
      .done(function(children){
        var insertHTML = '';
        children.forEach(function(child){  
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML); 
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
  });

  $(document).on('change', '#child_category', function(){
    var productcategory = document.getElementById('child_category').value;
    if (productcategory != ''){
    $.ajax ({
      url: '/items/category_grandchildren',
      type: 'GET',
      data: { productcategory: productcategory },
      dataType: 'json'
    })
    .done(function(grandchildren){
      var insertHTML = '';
      grandchildren.forEach(function(grandchild){
        insertHTML += appendOption(grandchild);
        });
        appendgrandChildrenBox(insertHTML);
        $(document).on('change', '#child_category',function(){
          $('#grandchildren_wrapper').remove();
          })
        })  
    .fail(function(){
      alert('カテゴリー取得に失敗しました');
      })
    }
  });
});