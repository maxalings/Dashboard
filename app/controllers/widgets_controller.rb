class WidgetsController < ApplicationController
  def index
    @widgets = current_user.widgets
  end

  def stock_portfolio
    @stock = Stock.new
  end
end
