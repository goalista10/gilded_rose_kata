require_relative './gilded_rose_refactored'

RSpec.describe "GildedRose" do

  context "Normal Items" do
    let!(:normal_items) do
      [
        Item.new("+5 Dexterity Vest", 10, 20),
        Item.new("Elixir of the Mongoose", 0, 7),
      ]  
    end
    it "should DECREASE BOTH values by 1 " do
      update_quality(normal_items)
      expect(normal_items[0]).to eq(Item.new("+5 Dexterity Vest", 9, 19))
    end
    it "should DECREASE 'sell_in' BY 1 and 'quality' BY 2" do
      update_quality(normal_items)
      expect(normal_items[1]).to eq(Item.new("Elixir of the Mongoose", -1, 5))
    end
  end

  context "Aged Brie" do
    let!(:aged_brie) do
      [
        Item.new("Aged Brie", 2, 0),
        Item.new("Aged Brie", 0, 0),
      ]  
    end
    it "should DECREASE 'sell_in' BY 1 and INCREASE 'quality' BY 1" do
      update_quality(aged_brie)
      expect(aged_brie[0]).to eq(Item.new("Aged Brie", 1, 1))
    end
    it "should DECREASE 'sell_in' BY 1 and INCREASE 'quality' BY 2" do
      update_quality(aged_brie)
      expect(aged_brie[1]).to eq(Item.new("Aged Brie", -1, 2))
    end
  end

  context "Legendary Item" do
    let!(:legendary_item) do
      [
        Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
      ]  
    end
    it "should REMAIN" do
      update_quality(legendary_item)
      expect(legendary_item[0]).to eq(Item.new("Sulfuras, Hand of Ragnaros", 0, 80))
    end
  end

  context "Concert" do
    let!(:concert) do
      [
        Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
        Item.new("Backstage passes to a TAFKAL80ETC concert", 7, 20),
        Item.new("Backstage passes to a TAFKAL80ETC concert", 3, 20),
        Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 20),
      ]  
    end
    it "should DECREASE 'sell_in' BY 1 and INCREASE 'quality' BY 1" do
      update_quality(concert)
      expect(concert[0]).to eq(Item.new("Backstage passes to a TAFKAL80ETC concert", 14, 21))
    end
    it "should DECREASE 'sell_in' BY 1 and INCREASE 'quality' BY 2" do
      update_quality(concert)
      expect(concert[1]).to eq(Item.new("Backstage passes to a TAFKAL80ETC concert", 6, 22))
    end
    it "should DECREASE 'sell_in' BY 1 and INCREASE 'quality' BY 3" do
      update_quality(concert)
      expect(concert[2]).to eq(Item.new("Backstage passes to a TAFKAL80ETC concert", 2, 23))
    end
    it "should DECREASE 'sell_in' BY 1 and LET 'quality' EQUAL 0" do
      update_quality(concert)
      expect(concert[3]).to eq(Item.new("Backstage passes to a TAFKAL80ETC concert", -1, 0))
    end
  end

  context "Conjured" do
    let!(:conjured) do
      [
        Item.new("Conjured Mana Cake", 3, 6),
        Item.new("Conjured Mana Cake", 0, 6),
      ]  
    end
    it "should DECREASE 'sell_in' BY 1 and DECREASE 'quality' BY 2" do
      update_quality(conjured)
      expect(conjured[0]).to eq(Item.new("Conjured Mana Cake", 2, 4))
    end
    it "should DECREASE 'sell_in' BY 1 and DECREASE 'quality' BY 4" do
      update_quality(conjured)
      expect(conjured[1]).to eq(Item.new("Conjured Mana Cake", -1, 2))
    end
  end

end


