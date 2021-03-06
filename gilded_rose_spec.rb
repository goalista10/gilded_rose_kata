require_relative './gilded_rose_refactored'

RSpec.describe "GildedRose" do
  let!(:items) do
    [
     Item.new("+5 Dexterity Vest", 10, 20),
     Item.new("Aged Brie", 2, 0),
     Item.new("Elixir of the Mongoose", 5, 7),
     Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
     Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
     Item.new("Conjured Mana Cake", 3, 6),
    ]
  end

  it "changes the first item to have 9 and 19 as values respectively" do
    expect(update_quality(items)[0]).to eq(Item.new("+5 Dexterity Vest", 9, 19))
  end

  it "changes the second item to have 1 and 1 as values respectively" do
    expect(update_quality(items)[1]).to eq(Item.new("Aged Brie", 1, 1))
  end

  it "changes the third item to have 4 and 6 as values respectively" do
    expect(update_quality(items)[2]).to eq(Item.new("Elixir of the Mongoose", 4, 6))
  end

  it "does not change the fourth item" do
    expect(update_quality(items)[3]).to eq(Item.new("Sulfuras, Hand of Ragnaros", 0, 80))
  end

  it "changes the fifth item to have 14 and 21 as values respectively" do
    expect(update_quality(items)[4]).to eq(Item.new("Backstage passes to a TAFKAL80ETC concert", 14, 21))
  end

  it "changes the sixth item to have 14 and 21 as values respectively" do
    expect(update_quality(items)[5]).to eq(Item.new("Conjured Mana Cake", 2, 5))
  end

  context "normal degrading items" do
    let!(:normal_items) do
      [
       Item.new("+5 Dexterity Vest", 10, 20),
       Item.new("Elixir of the Mongoose", 5, 7),
      ]
    end
    it "should degrade normally" do 
      update_quality(normal_items)
      expect(normal_items[0]).to eq(Item.new("+5 Dexterity Vest", 9, 19))
      expect(normal_items[1]).to eq(Item.new("Elixir of the Mongoose", 4, 6))
    end
  end

  context "inverse degrading items" do
    let!(:inverse_items) do
      [
        Item.new("Aged Brie", 2, 0),
        Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
      ]
    end
    it "should upgrade instead" do 
      update_quality(inverse_items)
      expect(inverse_items[0]).to eq(Item.new("Aged Brie", 1, 1))
      expect(inverse_items[1]).to eq(Item.new("Backstage passes to a TAFKAL80ETC concert", 14, 21))
    end
  end

  context "permanent quality items" do
    let!(:permanent_items) do
      [
        Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
      ]
    end
    it "should remain in quality" do 
      update_quality(permanent_items)
      expect(permanent_items[0]).to eq(Item.new("Sulfuras, Hand of Ragnaros", 0, 80))
    end
  end

end


