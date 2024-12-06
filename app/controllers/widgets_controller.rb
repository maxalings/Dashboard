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

  def time
    @widget = Widget.find(params[:widget_id])
  end

  def stock_portfolio
    @widget = Widget.find(params[:widget_id])
    @stock = Stock.new
    @stocks = Stock.all

    @total_value = @stocks.map do |stock|
      stock.amount * stock.current_price
    end.sum

    @total_invested = @stocks.map do |stock|
      stock.amount * stock.purchase_price
    end.sum
    if @total_invested > 0
      @percentage_change = ((@total_value - @total_invested) / @total_invested) * 100
    else
      @percentage_change = 0
    end
    @percentage_change = @percentage_change.round(2)
  end
end
