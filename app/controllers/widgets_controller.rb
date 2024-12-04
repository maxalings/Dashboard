class WidgetsController < ApplicationController
  def index
    @widgets = current_user.widgets
  end

  def habits
    
  end

end
