class News

attr_accessor :articles, :total_results, :article_source, :country

  def initialize
    refresh_news
  end

  def refresh_news(country = 'us', source = "null", page = 1)
    puts "\n\nGetting news...\n\n"
    sleep(0.25)
    begin
      url = "https://newsapi.org/v2/top-headlines?"
      url += "country=#{country}&" #this might be over-ridding the source call
      url += "source=#{source}&" # not working, seem to need to change end-point to /v2/sources
      url += "page=#{page}&"
      url += "apiKey=#{ENV['NEWS_API_TOKEN']}"
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
