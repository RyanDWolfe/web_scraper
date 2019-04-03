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
  end

  def menu
    puts "Enter the number you want more info on, type 'list' to return to the list or type 'exit':"
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "list"
        list
      when "1"
        puts "You know about One"
      when "2"
        puts "You know about Two"
      when "3"
        puts "You know about Three"
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
