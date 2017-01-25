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
  $('#message_submit').on('click', function(e) {

    e.preventDefault();

    // .はクラス指定、#はid指定
    var $form = $('.chat__form').get()[0];
    console.log($form);
    var fd = new FormData($form);
    console.log(fd);

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
    })
    .fail(function(data) {
      alert('エラーが発生しました(´・ω・｀)')
    });
  });

  function scrollBottom(){
    console.log("Yeah");
    var pos = $(".messages").height();
    console.log(pos);
    $('html, body').animate({
      scrollTop: pos
    }, "slow", "swing");
  };
});