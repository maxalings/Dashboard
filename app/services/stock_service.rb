require 'open-uri'
require 'json'
require 'date'

class StockService

  def fetch_stock_price(ticker)
    Rails.cache.fetch("#{ticker}/cachestockprice", expires_in: 12.hours) do
      url = "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=#{ticker}&apikey=#{ENV["ALPHAKEY"]}"
      Rails.logger.info("Cache miss for ticker: #{ticker}")
      yesterday = Date.today - 1
      formatted_yesterday = yesterday.strftime("%Y-%m-%d")
      # url = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=IBM&apikey=demo"
      response = URI.open(url).read
      data = JSON.parse(response)
      # data["Time Series (Daily)"][formatted_yesterday]["4. close"].to_f
      if data["Information"].nil?
        data["Global Quote"]["05. price"].to_f
      else
        10000
      end
    end
  end
end
