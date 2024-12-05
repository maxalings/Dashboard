class WidgetsService
  def call(widget)
    case widget.category
    when "time" then return Widgets::TimeService.new(widget)
    when "habits" then return Widgets::HabitsService.new(widget)
    end
  end
end
