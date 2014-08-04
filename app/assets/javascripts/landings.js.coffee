$(".landings").ready ->
  $("#fb_login_btn").click (e) ->
    target = document.getElementById('fb_login_btn')
    spin_to(target)
    return
  return