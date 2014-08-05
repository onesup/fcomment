$(".games").ready ->
  reserved_ul = $(".list-group").clone()
  $("#select-again-list").hide()
  $(".page-id-radio-btn").on "click", (e) ->
    # reserved_ul = $(".list-group").clone()
    reserved_li = $(this).parents(".list-group-item").clone()
    select_again = $("#select-again-list").clone()
    $(".list-group-item").remove()
    $(".list-group").append(reserved_li)
    $(".list-group").append(select_again)
    $("#select-again-list").show()
    return
  
  $("#select-again").click (e) ->
    $(".list-group").remove()
    $("#page-id-select").append(reserved_ul)
    return
  
  return