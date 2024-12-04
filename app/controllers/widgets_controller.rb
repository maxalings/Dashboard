class WidgetsController < ApplicationController
  def index
    @widgets = current_user.widgets
    @user = current_user
  end
end