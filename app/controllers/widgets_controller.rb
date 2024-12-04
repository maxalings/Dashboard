require 'open-uri'
require 'json'

class WidgetsController < ApplicationController
  def new
    @widget = Widget.new
  end

  def stock_portfolio
    @widget = Widget.find(params[:widget_id])
    @stock = Stock.new
    @stocks = Stock.all
  end
end
