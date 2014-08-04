$(".posts").ready ->
  $("#post_update_btn").click (e) ->
    target = document.getElementById('post_update_btn')
    spin_to(target)
    return
  return