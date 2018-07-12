require 'spec_helper.rb'

def attr_names
  Character.column_names
end

def attr_numerics_names
  attr_names - %w[id title created_at updated_at]
end

def attr_ranges
  [
    [1,      30],
    [0.01,   0.19],
    [0.0125, 0.09],
    [0.0325, 0.28],
    [0.001,  0.05],
    [0.68,   1.35],
    [1.3,    3.1],
    [1.6,    3.5],
    [0.064,  0.25],
    [55,     140]
  ]
end

def attr_numerics_with_ranges
  attr_numerics_names.zip(attr_ranges).map(&:flatten)
end

def check_attribute_value_exists(attr_name)
  it "is invalid without a #{attr_name}" do
    char = Character.new
    char.send("#{attr_name}=", nil)
    expect(char).not_to be_valid
  end
end

def check_attribute_value_within_range(attr_name, attr_min_value, attr_max_value)
  it "has a(n) #{attr_name} value within valid range" do
    expect(char.send(attr_name.to_sym)).to be_between(attr_min_value, attr_max_value)
  end      
end

describe Character do
  it "has a valid factory" do
  end

  context "without valid attributes" do
    attr_names.each do |attr_name|
      check_attribute_value_exists(attr_name)
    end
  end

  context "with valid attributes" do
    let(:char) { FactoryBot.create :character }

    attr_numerics_with_ranges.each do |attr_name, attr_min_value, attr_max_value|
      check_attribute_value_within_range(attr_name, attr_min_value, attr_max_value)
    end

  end
end