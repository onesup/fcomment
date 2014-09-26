class AnalyticsWorker
  include Sidekiq::Worker
  # sidekiq_options unique: true
  
  def perform(game_id)
    puts "@@@@@@@" + game_id.to_s
    game = Game.find game_id
    game.fetch_comments
    puts "@@@@@@@" + game_id.to_s + "@@@@@"
  end
end