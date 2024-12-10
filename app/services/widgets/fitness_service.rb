class Widgets::FitnessService
  attr_reader :tasks, :widget

    def initialize(widget)
      @widget = widget
      @tasks = @widget.tasks
      @races = @widget.races
    end

  end
