def update_quality(items)
    items.each do |item|
        # BEAR IN MIND EXCEPTIONS ARE STILL UNDER GENERAL RULES EXCEPT LEGENDARY ITEMS

        # EXCEPTIONS
        # “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
        if item.name != 'Sulfuras, Hand of Ragnaros'

            # “Aged Brie” actually increases in Quality the older it gets
            if item.name == 'Aged Brie'
                item.quality += 2
            
                # Once the sell by date has passed, Quality degrades twice as fast
                if item.sell_in <= 0
                    item.quality += 2
                end
            end

            # “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches
            if item.name == 'Backstage passes to a TAFKAL80ETC concert'
                item.quality += 2

                # Quality increases by 2 when there are 10 days or less
                if item.sell_in <= 10
                    item.quality += 1

                    # by 3 when there are 5 days or less 
                    if item.sell_in <= 5
                        item.quality += 1

                        # Quality drops to 0 after the concert
                        if item.sell_in <= 0
                            item.quality = 0
                        end
                    end
                end
            end
            
            # “Conjured” items degrade in Quality twice as fast as normal items
            if item.name == 'Conjured Mana Cake'
                item.quality -= 1
            
                # Once the sell by date has passed, Quality degrades twice as fast
                if item.sell_in <= 0
                    item.quality -= 1
                end
            end

            # THE GENERAL RULE
            # Once the sell by date has passed, Quality degrades twice as fast     
            if item.sell_in <= 0
                item.quality -= 1
            end

            # At the end of each day our system lowers both values for every item
            item.sell_in -= 1
            item.quality -= 1   

            # CORRECTIONS
            # The Quality of an item is never more than 50
            if item.quality > 50
                item.quality = 50
            end
            
            # The Quality of an item is never negative
            if item.quality < 0
                item.quality = 0
            end
        end
    end
end
  
  # DO NOT CHANGE THINGS BELOW -----------------------------------------
  
  Item = Struct.new(:name, :sell_in, :quality)
  
  # We use the setup in the spec rather than the following for testing.
  #
  # Items = [
  #   Item.new("+5 Dexterity Vest", 10, 20),
  #   Item.new("Aged Brie", 2, 0),
  #   Item.new("Elixir of the Mongoose", 5, 7),
  #   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
  #   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
  #   Item.new("Conjured Mana Cake", 3, 6),
  # ]
  
  