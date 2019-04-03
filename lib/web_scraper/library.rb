class Library

  attr_accessor :name, :atr1, :atr2

  def self.list_items
    # puts <<-DOC
    # 1. Item One - ABC - 123
    # 2. Item Two - DEF - 456
    # 3. Item Three - GHI - 789
    # DOC

    item_1 = self.new
    item_1.name = "item 1"
    item_1.atr1 = "ABC"
    item_1.atr2 = "123"

    item_2 = self.new
    item_2.name = "item 2"
    item_2.atr1 = "DEF"
    item_2.atr2 = "456"

    [item_1, item_2]
  end


end
