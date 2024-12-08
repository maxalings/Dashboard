require 'tzinfo'
require 'geocoder'

class Widgets::HabitsService
  attr_reader :tasks, :widget

  def initialize(widget)
    @widget = widget
    @tasks = @widget.tasks
  end

  def user_tz
    #  determine time zone using current_sign_in_ip from devise
    user_ip = widget.user.current_sign_in_ip
    user_location = Geocoder.search(user_ip).first
    if user_location
      tf = TimezoneFinder.create
      timezone_name = tf.timezone_at(lng:user_location.data["center"][0], lat: user_location.data["center"][1])
      TZInfo::Timezone.get(timezone_name)
    else
      "UTC"
    end
  end

  def first_session_today?
    # Need to convert the following values into users time zone using
    #  .in_time_zone(user_tz)
    last_sign_in = widget.user.current_sign_in_at
    previous_sign_in = widget.user.last_sign_in_at

    # Debugging output
    puts "Last sign in: #{last_sign_in}"
    puts "Previous sign in: #{previous_sign_in}"

    # If previous sign-in and last sign-in are the same, this must be their first session:
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