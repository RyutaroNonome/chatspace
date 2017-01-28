$(document).on('turbolinks:load', function(){
//メッセージの仮HTML
  function insertedHtml(message){
    if(message.image){
      var insertImage = "<br><img src='" + message.image + "' class='message_img'>"
    }else{
      var insertImage = "";
    };
    var html = "<li class='chat-message'>\n"                    +
               "<div class='message__information clearfix'>\n"  +
               "<span class='name'>\n"                          +
                 message.name                                   +
               "</span>\n"                                      +
               "<span class='time'>\n"                          +
                 message.date                                   +
               "</span>\n"                                      +
               "</div>\n"                                       +
               "<span class='message__body'>\n"                 +
                 message.body                                   +
               "\n"                                             +
                 insertImage                                    +
               "</span>\n"                                      +
               "</li>"
    return $(html);
  };

//メッセージ投稿時にAjax通信
  $('.chat__form').on('submit', function(e) {
    e.preventDefault();
    // .はクラス指定、#はid指定
    var data = new FormData($(this)[0]);
    $.ajax({
      url: './messages.json',
      type: 'POST',
      data: data,
      processData: false,
      contentType: false
    })
    .done(function(res) {
      $('.messages').append(insertedHtml(res));
      // ↓ 投稿したら、投稿フォームを空にする。
      $('#message_body').val('');
      $('#new_image').val('');
      scrollBottom();
      //452pxまでのみ投稿後スクロールできる。
      console.log($(".messages").height());
    })
    .fail(function() {
      alert('エラーが発生しました(´・ω・｀)')
    });
    return false;
  });

  function scrollBottom(){
    $('html, body').animate({
      scrollTop: $(".messages").height()
    }, "slow", "swing");
  };

  //setinterval
  setInterval(reloadMessages, 10000);

  function reloadMessages() {
    $.ajax({
      url: './messages',
      type: 'GET',
      dataType: 'json'
    })
    .done(function(message) {
      var reloadedHtml = '';
      messsage.forEach(function (message) {
        reloadedHtml += insertHtml(message);
      });
      $('.messages').append(reloadHtml);
      scrollBottom();
    })
  };
});