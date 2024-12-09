class Widgets::HabitsService
  attr_reader :tasks, :widget

  def initialize(widget)
    @widget = widget
    @tasks = @widget.tasks
  end
  
  def local_timestamp(timestamp)
    # Since localtime can only be called on a Time object:
    # Parse the timestamp (converted to a string since parse requires a string)
    # into a Time object
    t = Time.parse(timestamp.to_s)
    # call localtime on the Time object
    t.localtime
  end

  def first_session_today?
    current_signin = local_timestamp(widget.user.current_sign_in_at)
    previous_signin = local_timestamp(widget.user.last_sign_in_at)

    # Debugging output
    puts "Current sign in: #{current_signin}"
    puts "Previous sign in: #{previous_signin}"

    # If previous sign-in and last sign-in are the same, this must be their first session:
    return true if previous_signin == current_signin

    # If the last sign in was today, and the previous sign in was not today, this must be their first session today:
    current_signin.to_date == Date.current && previous_signin.to_date != Date.current
  end

  def reset_habits
    if first_session_today?
      # Debugging output
      puts "Resetting habits for widget: #{widget.id}"
      widget.tasks.update_all(done: false)
    else
      # Debugging output
      puts "Not the first session today, no reset needed."
    end
  end

end