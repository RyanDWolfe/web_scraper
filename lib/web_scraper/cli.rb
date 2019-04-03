class Cli

  def call
    list
    menu
    close_program
  end

  def list
    get_news
    puts "Here is the List:"
    @items = get_news
    @items['articles'].each_with_index do |item, i|
      puts "#{i+1}: #{item['title']}"
    end
  end

  def menu
    puts "Enter the number you want more info on, type 'list' to return to the list or type 'exit':"
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      if input.to_i > 0
        puts @deals[input.to_i - 1]
      elsif input == "list"
        list
      else
        puts "Item Not Found"
        list
      end
    end
  end

  def close_program
    puts "Good Bye!"
  end

  def get_news
    url = 'https://newsapi.org/v2/top-headlines?'\
    'country=us&'\
    "apiKey=#{ENV['NEWS_API_TOKEN']}"
    req = open(url)
    response_body = req.read
    JSON.parse(response_body)
  end
end
