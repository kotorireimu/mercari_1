$(function(){
  $(".sell-page__main__information__form__content__status__price__group__right__input").on('change', function() {
    var target = document.getElementsByClassName('sell-page__main__information__form__content__status__price__group__right__input');
    target.innerText = document.forms.new_item.item_price.value;
    var x = target.innerText / 10;
    X = Math.floor(x);
    $(".sell-page__main__information__form__content__status__price__group__percent").append(X);

    Y = target.innerText - X;
    $(".sell-page__main__information__form__content__status__price__group__rights").append(Y);
  });
});