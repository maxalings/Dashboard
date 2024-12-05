require 'tzinfo'
require 'geocoder'

class Widgets::TimeService
    attr_reader :timezone

  def initialize(widget)
    @widget = widget
    @timezone = widget.timezone
  end

  def converted_time
    # Utiliser Geocoder pour chercher la ville
    results = Geocoder.search(@widget.timezone)
    if results.any?
      tf = TimezoneFinder.create
      timezone_name = tf.timezone_at(lng:results.first.data["center"][0], lat: results.first.data["center"][1])
      timezone = TZInfo::Timezone.get(timezone_name).now
      return timezone.strftime("%H:%M:%S")
    else
      "Location not found"
    end
  end
end
