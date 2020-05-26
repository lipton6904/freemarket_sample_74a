window.addEventListener('DOMContentLoaded', function(){

  let submit = document.getElementById("payment_card_submit-button");

   Payjp.setPublicKey('pk_test_4d7d704af23ffee45efd6847'); //公開鍵

     submit.addEventListener('click', function(e){ //ボタン押すとトークン作成

     e.preventDefault(); //ボタンを無効


    let card = { //カード入力情報
        number: document.getElementById("card_number").value,
        cvc: document.getElementById("payment_card_cvc").value,
        exp_month: document.getElementById("payment_card_month").value,
        exp_year: document.getElementById("payment_card_year").value
    };
    console.log(card)
    Payjp.createToken(card, function(status, response) {  // トークン生成
      if (status === 200) { 
        //データをremoveAttr("name")で削除
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name"); 
        $("#charge-form").append(
          $('<input type="hidden" name="payjp_token">').val(response.id)
        ); //取得したトークンを送信
        document.inputForm.submit();
        alert("登録が完了しました"); 
      } else {
        alert("カード情報が正しくありません。"); //エラー確認用
      }
    });
  });
});
