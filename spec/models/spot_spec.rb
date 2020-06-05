require 'rails_helper'

RSpec.describe Spot, type: :model do
  it "nameがない場合、無効である" do
    spot = Spot.new(name: nil)
    spot.valid?
    expect(spot.errors[:name]).to include("が入力されていません。")
  end

  it "main_visualがない場合、無効である" do
    spot = Spot.new(main_visual: nil)
    spot.valid?
    expect(spot.errors[:main_visual]).to include("が入力されていません。")
  end
end
