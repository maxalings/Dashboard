class WidgetsService
  def call(widget)
    case widget.category
    when "time" then return TimeService.new(widget)
    end
  end
end
