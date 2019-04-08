class News

attr_accessor :articles, :total_results

  def initialize
    refresh_news
  end

  def refresh_news(country = 'us')
    puts "\n\nGetting news...\n\n"
    begin
      url = "https://newsapi.org/v2/top-headlines?"
      url += "country=#{country}&"
      url += "apiKey=#{ENV['NEWS_API_TOKEN']}"
      req = open(url)
      response_body = req.read
      news = JSON.parse(response_body)
      @articles = news['articles']
      @total_results = news['totalResults']
    rescue
      puts "We were unable to get the news, try again later"
    end
  end

  def get_news_by_provider

  end

  def get_news_by_country(country)
    refresh_news(country)
  end

  def search_news

  end

end
