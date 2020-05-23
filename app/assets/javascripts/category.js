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
  function appendsizeBox(){
    var sizeSelectHtml = '';  
    sizeSelectHtml = `<div class='sell__content__box__the-details__category__select' id= 'size-box'>
                      サイズ
                      <span class="required"> 必須 </span>
                      <select id="size_select" class="sell__content__box__the-details__status__select__box" name="item[size_id]">
                      <option value="">選択してください</option>
                      <option value="XXS以下">XXS以下</option>
                      <option value="XS(SS)">XS(SS)</option>
                      <option value="S">S</option>
                      <option value="M">M</option>
                      <option value="L">L</option>
                      <option value="XL(LL)">XL(LL)</option>
                      <option value="2XL(3L)">2XL(3L)</option>
                      <option value="3XL(4L)">3XL(4L)</option>
                      <option value="4XL(5L)以外">4XL(5L)以外</option>
                      <option value="FREE SIZE">FREE SIZE</option></select>
                      </div>`;
    $('#grandchildren_wrapper').after(sizeSelectHtml)
  }
  function appendkidSizeBox(){
    var kidSizeSelectHtml = '';  
    kidSizeSelectHtml = `<div class='sell__content__box__the-details__category__select' id= 'kidsize-box'>
                      サイズ
                      <span class="required"> 必須 </span>
                      <select id="kidsize_select" class="sell__content__box__the-details__status__select__box" name="item[size_id]">
                      <option value="">選択してください</option>
                      <option value="60cm">60cm</option>
                      <option value="70cm">70cm</option>
                      <option value="80cm">80cm</option>
                      <option value="90cm">90cm</option>
                      <option value="95cm">95cm</option>
                      </select>
                      </div>`;
    $('#grandchildren_wrapper').after(kidSizeSelectHtml)
  }
  function appendkidBigSizeBox(){
    var kidBigSizeSelectHtml = '';  
    kidBigSizeSelectHtml = `<div class='sell__content__box__the-details__category__select' id= 'kidbigsize-box'>
                      サイズ
                      <span class="required"> 必須 </span>
                      <select id="kidbigsize_select" class="sell__content__box__the-details__status__select__box" name="item[size_id]">
                      <option value="">選択してください</option>
                      <option value="100cm">100cm</option>
                      <option value="110cm">110cm</option>
                      <option value="120cm">120cm</option>
                      <option value="130cm">130cm</option>
                      <option value="140cm">140cm</option>
                      <option value="150cm">150cm</option>
                      <option value="160cm">160cm</option>
                      </select>
                      </div>`;
    $('#grandchildren_wrapper').after(kidBigSizeSelectHtml)
  }
  function appendshoesBox(){
    var shoesSelectHtml = '';  
    shoesSelectHtml = `<div class='sell__content__box__the-details__category__select' id= 'shoes-box'>
                      サイズ
                      <span class="required"> 必須 </span>
                      <select id="shose_select" class="sell__content__box__the-details__status__select__box" name="item[size_id]">
                      <option value="">選択してください</option>
                      <option value="20cm以下">20cm以下</option>
                      <option value="20.5cm">20.5cm</option>
                      <option value="21cm">21cm</option>
                      <option value="21.5cm">21.5cm</option>
                      <option value="22cm">22cm</option>
                      <option value="22.5cm">22.5cm</option>
                      <option value="23cm">23cm</option>
                      <option value="23.5cm">23.5cm</option>
                      <option value="24cm">24cm</option>
                      <option value="24.5cm">24.5cm</option>
                      <option value="25cm">25cm</option>
                      <option value="25.5cm">25.5cm</option>
                      <option value="26cm">26cm</option>
                      <option value="26.5cm">26.5cm</option>
                      <option value="27cm">27cm</option>
                      <option value="27.5cm以外">27.5cm以外</option></select></div>`;
    $('#grandchildren_wrapper').after(shoesSelectHtml)
  }
  function appendkidShoesBox(){
    var kidShoesSelectHtml = '';  
    kidShoesSelectHtml = `<div class='sell__content__box__the-details__category__select' id= 'kidshoes-box'>
                      サイズ
                      <span class="required"> 必須 </span>
                      <select id="kidshose_select" class="sell__content__box__the-details__status__select__box" name="item[size_id]">
                      <option value="">選択してください</option>
                      <option value="10.5cm以下">10.5cm以下</option>
                      <option value="11・11.5cm">11・11.5cm</option>
                      <option value="11・11.5cm">11・11.5cm</option>
                      <option value="12・12.5cm">12・12.5cm</option>
                      <option value="13・13.5cm">13・13.5cm</option>
                      <option value="14・14.5cm">14・14.5cm</option>
                      <option value="15・15.5cm">15・15.5cm</option>
                      <option value="16・16.5cm">16・16.5cm</option>
                      <option value="17cm以上">17cm以上</option></select></div>`;
    $('#grandchildren_wrapper').after(kidShoesSelectHtml)
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
          $('#size-box').remove();
          $('#shoes-box').remove();
          $('#kidsize-box').remove();
          $('#kidbigsize-box').remove();
          $('#kidshoes-box').remove();
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
          $('#size-box').remove();
          $('#shoes-box').remove();
          $('#kidsize-box').remove();
          $('#kidbigsize-box').remove();
          $('#kidshoes-box').remove();
          })
        })  
    .fail(function(){
      alert('カテゴリー取得に失敗しました');
      })
    }
  });
  $(document).on('change', '#grandchild_category', function() {
    let sizecategory = document.getElementById('child_category').value;
    if (sizecategory == 7 || sizecategory == 205) {
      appendshoesBox();
    } else if (sizecategory == 2 || sizecategory == 3 || sizecategory == 4 || sizecategory == 5 || sizecategory == 6 || sizecategory == 8 || sizecategory == 17 || sizecategory == 18 || sizecategory == 19
            || sizecategory == 202 || sizecategory == 203 || sizecategory == 204 || sizecategory == 207 || sizecategory == 212 || sizecategory == 214) {
      appendsizeBox();
    } else if (sizecategory == 347 || sizecategory == 348 || sizecategory == 349) {
      appendkidSizeBox();
    } else if (sizecategory == 350 || sizecategory == 351 || sizecategory == 352) {
      appendkidBigSizeBox();
    } else if (sizecategory == 353) {
      appendkidShoesBox();
    } else {
      $('#size-box').remove();
      $('#shoes-box').remove();
      $('#kidsize-box').remove();
      $('#kidbigsize-box').remove();
      $('#kidshoes-box').remove();
    }
  });
});