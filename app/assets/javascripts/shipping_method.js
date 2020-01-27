$(function(){
  var array1 = [ '未定','らくらくメルカリ便','ゆうメール','レターパック','普通郵便（定型、定型外）',
  'クロネコヤマト','ゆうパック','クリックポスト','ゆうパケット' ];

  var array2 = ['未定','ゆうメール','クロネコヤマト','ゆうパック'];

  function appendOption(shipping_method){
    var html = `<option value="${shipping_method}">${shipping_method}</option>`;
    return html;
  }

  $("#item_feeburden").on('change',function(){
    // var delivery_parentCategory = ""

    var delivery_parentCategory = document.getElementById('item_feeburden').value;
    if (delivery_parentCategory  != 1 ){


      $.ajax({
        url: '/items/get_delivery_method',
        type: 'GET',
        data: { parent_name: delivery_parentCategory },
        dataType: 'json'
      })

      .done(function() {
        $('#delivery_method-parent').empty();
        var methodBoxHtml = '';
        var insertHTML = '';
        if (delivery_parentCategory == 2){
          array1.forEach(function(shipping_method){
          insertHTML += appendOption(shipping_method);
          });
        }else{
          array2.forEach(function(shipping_method){
          insertHTML += appendOption(shipping_method);
          });
        }

        methodBoxHtml = `<div class="sell-page__main__information__form__content__status" id="delivery_method-parent"> 
                          <label class='sell-page__main__information__form__content__status__label'> 配送の方法</label> 
                          <span class='sell-require '>必須</span> 
                            <div class='sell-page__main__information__form__content__status-wrapper__box'>
                              <div class='sell-page__main__information__form__content__status-wrapper'></div>
                                <select class="sell-page__main__information__form__content__status-wrapper__box--select" id="delivery_charge", name = "item[shipping_method]">
                                  <option value="---"></option>
                                  ${insertHTML}
                                </select>
                              </div>
                            </div>
                          </div>`;
        
        $('#delivery_method-parent').append(methodBoxHtml);

      })
    }
    else {$('#delivery_method-parent').remove();}

  });

});