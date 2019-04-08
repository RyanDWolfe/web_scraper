class News

  attr_accessor :articles, :total_results

  def initialize
    puts "\n\nGetting news...\n\n"
    url = 'https://newsapi.org/v2/top-headlines?'\
    'country=us&'\
    "apiKey=#{ENV['NEWS_API_TOKEN']}"
    req = open(url)
    response_body = req.read
    news = JSON.parse(response_body)
    @articles = news['articles']
    @total_results = news['totalResults']
  end

  # def self.get_news
  #   url = 'https://newsapi.org/v2/top-headlines?'\
  #   'country=us&'\
  #   "apiKey=#{ENV['NEWS_API_TOKEN']}"
  #   req = open(url)
  #   response_body = req.read
  #   @news = JSON.parse(response_body)
  # end

end
