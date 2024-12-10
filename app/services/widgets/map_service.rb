require "geocoder"

class Widgets::MapService
  attr_reader :widget

    def initialize(widget)
      @widget = widget
    end

  end