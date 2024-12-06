class Widgets::StockPortfolioService
  attr_reader :stocks, :widget, :total_invested, :total_value, :percentage_change, :stock

    def initialize(widget)
      @widget = widget
      stock_portfolio

    end

    def stock_portfolio
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
