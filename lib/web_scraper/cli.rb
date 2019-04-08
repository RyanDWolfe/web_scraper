class Cli

attr_accessor :news

  USER_DISPLAY = {
    intro_header: "Here are today's news headlines:\n\n",
    main_input_options: "\n\nType the number of the acticle you want to learn more about.\n\nOther Available Commands:\n\nrefresh\nset country\nexit\n\nWhat would you like to do?",
    detail_input_options: "\n\nType 'list' to return or 'open' to visit the webpage for this article.",
    country_input_options: "\n\nWhat country would you like to see news for?\n\n",
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
    end
    puts "\n\nThere are #{news.total_results} news articles"
    puts USER_DISPLAY[:main_input_options]
    input_handler
  end

  def input_handler
    input = nil
    article_num = nil
    while input != "exit"
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i <= news.total_results - 1
          article_num = input.to_i - 1
          article = @news.articles[article_num]
          puts "#{article['description']}"
          puts USER_DISPLAY[:detail_input_options]
      elsif input == "list"
        list
      elsif input == "open"
        puts article_num
        open_article(article_num)
      elsif input == "refresh"
        @news = News.new
        list
      elsif input == "set country"
        puts USER_DISPLAY[:country_input_options]
      elsif input == "exit"
        close_program
      else
        puts USER_DISPLAY[:not_found]
        list
      end
    end
  end

  def open_article(article_num)
    system("open #{@news.articles[article_num]['url']}")
  end

  def close_program
    puts USER_DISPLAY[:exit]
    system("close")
  end

end
