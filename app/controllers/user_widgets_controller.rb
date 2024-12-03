class UserWidgetsController < ApplicationController

  def index
    @user_widgets = current_user.user_widgets
  end

end

