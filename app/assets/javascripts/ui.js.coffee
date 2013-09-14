#Add refer tag into post textarea

#highlight when jumping to related post
highlight = (elemId) ->
  elem = $(elemId)
  elem.css "backgroundColor", "#ffffff" # hack for Safari
  elem.animate
    backgroundColor: "#ffffaa"
  , 1500
  setTimeout (->
    $(elemId).animate
      backgroundColor: "#ffffff"
    , 3000
  ), 1000

$ ->
  if $("form.edit_discussion").length
    $(".action_menu a.reply").click (e) ->
      e.preventDefault()
      t = ">" + $(this).parent().parent().attr("id").substring(1) + "\n"
      ta = $("form textarea").first()
      t = ta.val() + "\n" + t  if ta.val()
      ta.val(t).focus()
      ta[0].scrollTop = ta[0].scrollHeight
      $("body, form").addClass "side"

  else
    newPostForm = $('form.new_discussion')
    newPostFields = newPostForm.find(".field")
    newPostFields.hide()
    newPostForm.find("input[type=submit]").addClass("link").click (e) ->
      e.preventDefault()
      newPostFields.show()
      $(this).unbind().removeClass()

  $("a[href*=#]").click ->
    elemId = "#" + $(this).attr("href").split("#")[1]
    highlight elemId


