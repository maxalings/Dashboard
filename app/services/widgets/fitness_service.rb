class Widgets::FitnessService
  attr_reader :tasks, :widget, :days, :hours, :minutes, :seconds, :races

    def initialize(widget)
      @widget = widget
      @tasks = @widget.tasks
      @races = @widget.races
      @days = 0
      @hours = 0
      @minutes = 0
      @seconds = 0
      @goal = 0
      @progress = 0
    end

    def set_time_until_race!
    if @races.any?
      given_date = Time.new(@races.last.year, @races.last.month, @races.last.day, 0, 0, 0)

      now = Time.now
      total_seconds = (given_date - now).to_i

      if total_seconds.positive?
        @days = total_seconds / (60 * 60 * 24)
        @hours = (total_seconds % (60 * 60 * 24)) / (60 * 60)
        @minutes = (total_seconds % (60 * 60)) / 60
        @seconds = total_seconds % 60
        else
          @days = @hours = @minutes = @seconds = 0
        end
      end
    end
  end
