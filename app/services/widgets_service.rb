class WidgetsService
  def call(widget)
    case widget.category
    when "time" then return Widgets::TimeService.new(widget)
    when "weather" then return Widgets::WeatherService.new(widget)
    when "habits" then return Widgets::HabitsService.new(widget)
    when "flashcards" then return Widgets::FlashcardsService.new(widget)
    when "fitness" then return Widgets::FitnessService.new(widget)
    when "stock_portfolio" then return Widgets::StockPortfolioService.new(widget)
    when "map" then return Widgets::MapService.new(widget)
    end
  end
end
