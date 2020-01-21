$(function(){
  
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}" >${category.name}</option>`;
    return html;
  }
  
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='sell-page__main__information__form__content__status__select__added' id= 'item_category_children'>
                        <div class='sell-page__main__information__form__content__status__select__added__box'>
                          <select class="sell-page__main__information__form__content__status__select" id="child_category" name="category_id">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>
                        </div>
                      </div>`;
    $('.sell-page__main__information__form__content__status__select').append(childSelectHtml);
  }
  
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='sell-page__main__information__form__content__status__select__added' id= 'item_category_grandchildren'>
                              <div class='sell-page__main__information__form__content__status__select__added__box'>
                                <select class="sell-page__main__information__form__content__status__select" id="grandchild_category" name="category_id">
                                  <option value="---" data-category="---">---</option>
                                  ${insertHTML}
                                </select>
                              </div>
                            </div>`;
    $('.sell-page__main__information__form__content__status__select').append(grandchildSelectHtml);
  }
  // 親カテゴリー選択後のイベント
  $('#item_category').on('change', function(){
    var parentCategory = document.getElementById('item_category').value; //選択された親カテゴリーの名前を取得
    if (parentCategory != 1 ){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#item_category_children').remove(); //親が変更された時、子以下を削除するする
        $('#item_category_grandchildren').remove();
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#item_category_children').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
      $('#item_category_grandchildren').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });
  // 子カテゴリー選択後のイベント
  $('.sell-page__main__information__form__content__status__select').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
    if (childId != "---"){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#item_category_grandchildren').remove(); //子が変更された時、孫以下を削除するする
          $('#size_wrapper').remove();
          $('#brand_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#item_category_grandchildren').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });
});