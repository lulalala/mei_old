$(function(){
  $('.action_menu a.reply').click(function(){
    var t = ">" + $(this).parent().parent().attr('id').substring(1) + "\n";
    var ta = $('form textarea').first();
    if(ta.val())
      t = ta.val() + "\n" + t;
    ta.val(t).focus();
    ta[0].scrollTop = ta[0].scrollHeight;
  });
})
