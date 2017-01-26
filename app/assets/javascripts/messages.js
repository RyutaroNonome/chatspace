$(document).on('turbolinks:load', function(){
//メッセージの仮HTML
  function insertedHtml(data){
    var html = "<li class='chat-message'>"                    +
               "<div class='message__information clearfix'>"  +
               "<p class='name'>"                             +
                 data.name                                    +
               "</p>"                                         +
               "<p class='time'>"                             +
                 data.date                                    +
               "</p>\                  </div>"                +
               "<p class='message__body'>"                    +
                 data.body                                    +
               "</p>"                                         +
               "</li>"
    return html
  };

//メッセージ投稿時にAjax通信
  $('.chat__form').on('submit', function(e) {
    e.preventDefault();
    // .はクラス指定、#はid指定
    var $form = $(this).get()[0];
    var fd = new FormData($form);
    $.ajax({
      url: './messages.json',
      type: 'POST',
      data: fd,
      processData: false,
      contentType: false
    })
    .done(function(data) {
      $('.messages').append(insertedHtml(data));
      // ↓ 投稿したら、投稿フォームを空にする。
      $('#message_body').val('');
      scrollBottom();
      $('#message_submit').attr('disabled', false);
    })
    .fail(function(data) {
      alert('エラーが発生しました(´・ω・｀)')
    });
  });

  function scrollBottom(){
    $('html, body').animate({
      scrollTop: $(".messages").height()
    }, "slow", "swing");
  };
});