class WidgetsController < ApplicationController
  def index
    @widgets = current_user.widgets
  end

  def fitness

  end

end
