class Cli

  def call
    list
    menu
  end

  def list
    @news = News.new
    puts "Here is today's news headlines:\n\n"
    @news.articles.each_with_index do |item, i|
      puts "#{i+1}: #{item['title']}"
    end
  end

  def menu
    puts "\n\nEnter the number you want more info on, type 'list' to return to the list or type 'exit':"
    input = nil
    article_num = nil
    while input != "exit"
      input = gets.strip.downcase
      if input.to_i > 0  #catch "You wrong fool!"
        article_num = input.to_i - 1
        # We SHOULD be able to find a matching article
        # Look into try catch
        puts "#{@news.articles[article_num]['description']}"
        puts "\n\nType 'list' to return or 'open' to visit the webpage for this article"
      elsif input == "list"
        list
      elsif input == "open"
        puts article_num
        open_article(article_num)
      elsif input == "exit"
        close_program
      else
        puts "Item Not Found"
        list
      end
    end
  end

  def open_article(article_num)
    system("open #{@news.articles[article_num]['url']}")
  end

  def close_program
    puts "Good Bye!"
  end
end
