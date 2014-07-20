$(".pages").ready ->
  $("#page_update_btn").click (e) ->
    e.preventDefault()
    target = document.getElementById('page_update_btn')
    spin_to(target)
    return
  return