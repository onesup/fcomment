$(".comments").ready ->
  $("#comment_update_btn").click (e) ->
    target = document.getElementById('comment_update_btn')
    spin_to(target)
    return
  return