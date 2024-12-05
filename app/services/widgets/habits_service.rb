class Widgets::HabitsService
attr_reader :tasks, :widget

  def initialize(widget)
    @widget = widget
    @tasks = @widget.tasks
  end


end