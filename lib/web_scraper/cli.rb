require_relative './library.rb'
class Cli

  def call
    list
    menu
    close_program
  end

  def list
    puts "Here is the List:"
    @items = Library.list_items
    # @items.each_with_index(1) do |item|
    #   puts "#{i}. #{item.name} - #{item.atr1} - #{item.atr2}"
    # end
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

end
