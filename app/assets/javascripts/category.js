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
                      <option value="1">XXS以下</option>
                      <option value="2">XS(SS)</option>
                      <option value="3">S</option>
                      <option value="4">M</option>
                      <option value="5">L</option>
                      <option value="6">XL(LL)</option>
                      <option value="7">2XL(3L)</option>
                      <option value="8">3XL(4L)</option>
                      <option value="9">4XL(5L)以外</option>
                      <option value="10">FREE SIZE</option></select>
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
                      <option value="11">60cm</option>
                      <option value="12">70cm</option>
                      <option value="13">80cm</option>
                      <option value="14">90cm</option>
                      <option value="15">95cm</option>
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
                      <option value="21">100cm</option>
                      <option value="22">110cm</option>
                      <option value="23">120cm</option>
                      <option value="24">130cm</option>
                      <option value="25">140cm</option>
                      <option value="26">150cm</option>
                      <option value="27">160cm</option>
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
                      <option value="31">20cm以下</option>
                      <option value="32">20.5cm</option>
                      <option value="33">21cm</option>
                      <option value="34">21.5cm</option>
                      <option value="35">22cm</option>
                      <option value="36">22.5cm</option>
                      <option value="37">23cm</option>
                      <option value="38">23.5cm</option>
                      <option value="39">24cm</option>
                      <option value="40">24.5cm</option>
                      <option value="41">25cm</option>
                      <option value="42">25.5cm</option>
                      <option value="43">26cm</option>
                      <option value="44">26.5cm</option>
                      <option value="45">27cm</option>
                      <option value="46">27.5cm以外</option></select></div>`;
    $('#grandchildren_wrapper').after(shoesSelectHtml)
  }
  function appendkidShoesBox(){
    var kidShoesSelectHtml = '';  
    kidShoesSelectHtml = `<div class='sell__content__box__the-details__category__select' id= 'kidshoes-box'>
                      サイズ
                      <span class="required"> 必須 </span>
                      <select id="kidshose_select" class="sell__content__box__the-details__status__select__box" name="item[size_id]">
                      <option value="">選択してください</option>
                      <option value="51">10.5cm以下</option>
                      <option value="52">11・11.5cm</option>
                      <option value="53">11・11.5cm</option>
                      <option value="54">12・12.5cm</option>
                      <option value="55">13・13.5cm</option>
                      <option value="56">14・14.5cm</option>
                      <option value="57">15・15.5cm</option>
                      <option value="58">16・16.5cm</option>
                      <option value="59">17cm以上</option></select></div>`;
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