require 'open-uri'
require 'json'

class StocksController < ApplicationController
  def create
    @stock = Stock.new(stock_params)
    @stock.widget = Widget.find(params[:widget_id])

    if @stock.save
      redirect_to widget_stocks_path(params[:widget_id]), notice: 'Stock was successfully created.'
    else
      redirect_to widget_stocks_path(params[:widget_id]), alert: @stock.errors.full_messages.to_sentence
    end
  end

  private

  def stock_params
    params.require(:stock).permit(:tickr, :amount, :purchase_price)
  end

end
