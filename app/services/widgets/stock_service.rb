require 'open-uri'
require 'json'
require 'date'

class StockService

  def fetch_stock_price(ticker)
    Rails.cache.fetch("#{ticker}/cachestockprice", expires_in: 6.hours) do
      # url = "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=#{ticker}&apikey=#{ENV["ALPHAKEY"]}"
      yesterday = Date.today - 1
      formatted_yesterday = yesterday.strftime("%Y-%m-%d")
      url = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=IBM&apikey=demo"
      response = URI.open(url).read
      data = JSON.parse(response)
      if data["Information"].nil?
        100
      else
      data["Time Series (Daily)"][formatted_yesterday]["4. close"].to_f
      # data["Global Quote"]["05. price"].to_f
      end
    end
  end
end
