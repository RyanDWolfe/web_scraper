class Cli

attr_reader :news

  def initialize
    @news = News.new
    list
  end

  def list
    puts "Here are today's news headlines:\n\n"
    @news.articles.each_with_index do |item, i|
      puts "#{i+1}: #{item['title']}"
    end
    puts "\n\nEnter the number you want more info on, type 'list' to return to the list or type 'exit':"
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
          puts "\n\nType 'list' to return or 'open' to visit the webpage for this article"
      elsif input == "list"
        list
      elsif input == "open"
        puts article_num
        open_article(article_num)
      elsif input == "exit"
        close_program
      else
        puts "\n\nItem Not Found\n\n"
        list
      end
    end
  end

  def open_article(article_num)
    system("open #{@news.articles[article_num]['url']}")
  end

  def close_program
    puts "\n\nGood Bye!\n\n"
    system("close")
  end

end
