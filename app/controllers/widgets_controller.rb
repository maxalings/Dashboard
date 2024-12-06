require 'open-uri'
require 'json'

class WidgetsController < ApplicationController

  def new
    @widget = Widget.new
  end

  def index
    @widgets = current_user.widgets
    @user = current_user
    
  end

  def fitness
    @widget = Widget.find(params[:widget_id])
    @tasks = @widget.tasks
  end
  def stock_portfolio
    @widget = Widget.find(params[:widget_id])
    @stock = Stock.new
    @stocks = Stock.all
  end
end
