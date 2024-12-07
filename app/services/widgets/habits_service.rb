class Widgets::HabitsService
attr_reader :tasks, :widget

  def initialize(widget)
    @widget = widget
    @tasks = @widget.tasks
  end

  def first_session_today?
    last_sign_in = widget.user.current_sign_in_at
    previous_sign_in = widget.user.last_sign_in_at
    # If there's no previous sign in, this must be their first session:
    return true if previous_sign_in.nil? && last_sign_in.present?
    # If the last sign in was today, and the previous sign in was not today, this must be their first session today:
    last_sign_in.to_date == Date.current && previous_sign_in.to_date != Date.current
  end

  def reset_habits
    if first_session_today?
      tasks.update_all(done: false)
    end
  end

end