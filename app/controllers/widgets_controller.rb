class WidgetsController < ApplicationController
  def index
    @widgets = current_user.widgets
  end


  def fitness
    @widgets = Widgets.all
  end

end
