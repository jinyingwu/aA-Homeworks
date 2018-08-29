require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements
without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "TWGOK") }
  subject(:cake) {Dessert.new("cake", 50, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do

      expect{Dessert.new("cake", "wowo", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(cake.add_ingredient('sugar')).to include('sugar')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      cake.add_ingredient('sugar')
      cake.add_ingredient('flour')
      cake.add_ingredient('cream')
      expect(cake.mix!).to eq(cake.ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(cake.eat(5)).to eq(cake.quantity)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{cake.eat(9999)}.to raise_error(RuntimeError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("TWGOK the Great Baker")
      expect(cake.serve).to eq("TWGOK the Great Baker has made 50 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cake)
      cake.make_more
    end
  end
end
