class Cli

attr_accessor :news

  USER_DISPLAY = {
    intro_header: "Here are today's news headlines:\n\n",
    main_input_options: "\n\nType the number of the acticle you want to learn more about.\n\nOther Available Commands:\n\nr: refresh\nc: set country\ns: set source\ne: exit\n\nWhat would you like to do?",
    detail_input_options: "\n\nType 'list' or 'l' to return or 'open' or 'o' to visit the webpage for this article.",
    country_input_options: "\n\nWhat country would you like to see news for?\n\n",
    country_codes: "Country codes:\n\nus\nar\nau\nor any other valid country codes...",
    source_input_options: "\n\nWhat news source would you like to see news for?\n\n",
    source_codes: "Type 'list' to return or one of the following:\nbbc-news\nabc-news\nbloomberg\nor any other valid news source...",
    not_found: "\n\nItem Not Found\n\n",
    exit: "\n\nGood Bye!\n\n"
  }

  def initialize
    @news = News.new
    list
  end

  def list
    puts USER_DISPLAY[:intro_header]
    @news.articles.each_with_index do |item, i|
      puts "#{i+1}: #{item['title']}"
      sleep(0.1)
    end
    puts "\n\nThere are #{news.total_results} news articles."
    puts USER_DISPLAY[:main_input_options]
    input_handler
  end

  def input_handler
    input = nil
    article_num = nil
    while input != "exit" || input != "e"
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i <= news.total_results - 1
          article_num = input.to_i - 1
          article = @news.articles[article_num]
          puts "#{article['description']}"
          puts USER_DISPLAY[:detail_input_options]
      elsif input == "list" || input == "l"
        list
      elsif input == "open" || input == "o"
        puts article_num
        open_article(article_num)
      elsif input == "refresh" || input == "r"
        @news = News.new
        list
      elsif input == "set country" || input == "c"
        country_input_handler
      elsif input == "set source" || input == "s"
        source_input_handler
      elsif input == "exit" || input == 'e'
        close_program
      else
        puts USER_DISPLAY[:not_found]
        sleep(2)
        list
      end
    end
  end

  def country_input_handler
    puts USER_DISPLAY[:country_input_options]
    puts USER_DISPLAY[:country_codes]
    @news.refresh_news(country = gets.strip.downcase, source = "null")
    list
  end

  def source_input_handler
    puts USER_DISPLAY[:source_input_options]
    puts USER_DISPLAY[:source_codes]
    @news.refresh_news(country = "#{@news.country}", source = "#{gets.strip.downcase}")
    list
  end

  def open_article(article_num)
    system("open #{@news.articles[article_num]['url']}")
  end

  def close_program
    puts USER_DISPLAY[:exit]
    system("close")
  end

end
