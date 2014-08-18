class CronWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  
  recurrence { secondly(5) }
  
  def perform
    Game.all.each do |game|
      if game.status == 'run'
        unless game.fetch_status == 'fetching'
          AnalyticsWorker.perform_async(game.id)
        end
      end
    end
    
  end
end