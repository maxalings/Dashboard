class UserWidgetsController < ApplicationController

  def index
    @user_widgets = UserWidget.all
  end

end

