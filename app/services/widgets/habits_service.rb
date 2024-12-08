class Widgets::HabitsService
  attr_reader :tasks, :widget

  def initialize(widget)
    @widget = widget
    @tasks = @widget.tasks
  end

  def first_session_today?
    last_sign_in = widget.user.current_sign_in_at
    previous_sign_in = widget.user.last_sign_in_at

    # Debugging output
    puts "Last sign in: #{last_sign_in}"
    puts "Previous sign in: #{previous_sign_in}"

    # If there's no previous sign in, this must be their first session
    # this doesn't work because devise always records last_sign_in_at and
    # current_sign_in_at as the same date
    return true if previous_sign_in == last_sign_in
    # If the last sign in was today, and the previous sign in was not today, this must be their first session today:
    last_sign_in.to_date == Date.current && previous_sign_in.to_date != Date.current
  end

  def reset_habits
    if first_session_today?
      puts "Resetting habits for widget: #{widget.id}"
      widget.tasks.update_all(done: false)
    else
      puts "Not the first session today, no reset needed."
    end
  end

end