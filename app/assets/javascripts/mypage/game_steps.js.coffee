$(".game_steps").ready ->
  reserved_ul = $("ul.list-group").clone()
  $("#select-again-list").hide()
  $(".page-id-radio-btn").on "click", (e) ->
    reserved_li = $(this).parents("li.list-group-item").clone()
    select_again = $("#select-again-list").clone()
    page_id = $(this).val()
    get_posts(page_id)
    $("li.list-group-item").remove()
    $("ul.list-group").append(reserved_li)
    $("ul.list-group").append(select_again)
    $("#select-again-list").show()
    return
  $("#select-again").click (e) ->
    $("ul.list-group").remove()
    $("#page-id-select").append(reserved_ul)
    $('.post_element').remove()
    return
  return

get_posts = (page_id) ->
  $.getJSON("/mypage/pages/"+page_id+"/posts.json", (data) ->
    posts = []
    $.each data, (key, val) ->
      post = $('.post-element').first().clone()
      post.find('.post-picture').attr('src',val.picture)
      post.find('.post-message').text(val.message)
      post.attr('data-post-id',val.id)
      $('.posts-list').append(post)
      return
    $('.post-element').first().remove()  
    return
  ).done ->
    select_post()
  return
  
select_post = () ->
  $(".post-element").click (e) ->
    $(".post-element").css('background','#ffffff')
    e.preventDefault()
    selected_post = $(this)
    selected_post.css('background','#3D5B99')
    post_id = $(this).data('post-id')
    $('#game_post_id').val(post_id)
    console.log($('#game_post_id').val())
    return
  return