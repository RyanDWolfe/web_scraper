class News

attr_accessor :articles, :total_results, :article_source, :country

  def initialize
    refresh_news
  end

  def refresh_news(country: "us", source: nil, page: 1)
    puts "\n\nGetting news...\n\n"
    sleep(0.25)
    begin
      url = "https://newsapi.org/v2/top-headlines?"
      if source
        url += "sources=#{source}&"
      else
        url += "country=#{country}&"
      end
      url += "page=#{page}&"
      url += "apiKey=#{ENV['NEWS_API_TOKEN']}"
      puts url
      req = open(url)
      response_body = req.read
      news = JSON.parse(response_body)
      @articles = news['articles']
      @total_results = news['totalResults']
      @country = country
      @article_source = news['id'] #not used returns null, making API call instead
    rescue
      puts "We were unable to get the news, try again later."
    end
  end
end
