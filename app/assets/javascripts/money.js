$(function(){
  $(".sell-page__main__information__form__content__status__price__group__right__input").on('change', function() {
    $('.sell-page__main__information__form__content__status__price__group__percent').empty();
    $('.sell-page__main__information__form__content__status__price__group__rights').empty();
    var target = document.getElementsByClassName('sell-page__main__information__form__content__status__price__group__right__input');
    var target_1 = document.forms.new_item;
    if (target_1 == null){
      target.innerText = $('#item_price').val();
    } else {
      target.innerText = document.forms.new_item.item_price.value;
    }

    var x = target.innerText / 10;
    X = Math.floor(x);
    $(".sell-page__main__information__form__content__status__price__group__percent").append(X);

    Y = target.innerText - X;
    $(".sell-page__main__information__form__content__status__price__group__rights").append(Y);
  });
});