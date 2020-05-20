$(function(){
  function appendOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChildrenBox(insertHTML){
    var childSelectHtml = '';
      childSelectHtml = `<div class='sell__content__box__the-details__category__select' id= 'children_wrapper'>
                        <select class="sell__content__box__the-details__category__select__box" id="child_category" name="item[category_id]">
                        <option value="">選択してください</option>
                        ${insertHTML}
                        </select>
                        </div>`;
    $('.sell__content__box__the-details__category__select').append(childSelectHtml);
  }
  function appendgrandChildrenBox(insertHTML){
    var grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `<div class='sell__content__box__the-details__category__select' id= 'grandchildren_wrapper'>
                              <select class="sell__content__box__the-details__category__select__box" id="grandchild_category" name="item[category_id]">
                              <option value="">選択してください</option>
                              ${insertHTML}
                              </select>
                              </div>`;
    $('#children_wrapper').after(grandchildrenSelectHtml)
  }

  $(document).on('change', '#category_select', function(){
    var productcategory = document.getElementById('category_select').value;
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
        $(document).on('change', '#category_select', function(){
          $('#children_wrapper').remove(); 
          $('#grandchildren_wrapper').remove();
          $('#size-box').css('display', 'none');
          $('#shoes-box').css('display', 'none');
        })
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
          $('#size-box').css('display', 'none');
          $('#shoes-box').css('display', 'none');
          })
        })  
    .fail(function(){
      alert('カテゴリー取得に失敗しました');
      })
    }
  });
  $(document).on('change', '#grandchild_category', function() {
    console.log(1)
    let sizecategory = document.getElementById('child_category').value;
    console.log(document.getElementById("child_category").value)
    if (sizecategory == 7 || sizecategory == 205) {
      $('#shoes-box').css('display', 'block');
    } else if(sizecategory == 2 || sizecategory == 3 || sizecategory == 4 || sizecategory == 5 || sizecategory == 6 || sizecategory == 8 || sizecategory == 17 || sizecategory == 18 || sizecategory == 19
            || sizecategory == 202 || sizecategory == 203 || sizecategory == 204 || sizecategory == 207 || sizecategory == 212 || sizecategory == 214) {
      $('#size-box').css('display', 'block');
    } else {
      $('#size-box').css('display', 'none');
      $('#shoes-box').css('display', 'none');
    }
  });

});