$(".games").ready ->
  toggle_status()
  return

toggle_status = () ->
  $('#toggle-status').click (e) ->
    e.preventDefault()
    game_id = $( this ).data('game-id')
    $.post("/mypage/games/"+game_id+"/toggle_status.json",{
      game_id: game_id
      },null,"json").done (data) ->
        if data.status == 'run'
          status = '작동중'
        else
          status = '정지됨'
        $('#toggle-status').text(status)
      return
    return
  return