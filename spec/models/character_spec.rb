require 'spec_helper.rb'

# Data setup for testing
def model_name() "Character".constantize; end
def attr_names() model_name.column_names; end
def attr_numerics_names() attr_names - %w[id title created_at updated_at]; end

def attr_numerics_ranges
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
  attr_numerics_names.zip(attr_numerics_ranges).map(&:flatten)
end

# Helper method setup for testing
def check_attribute_value_exists(attr_name)
  it "is invalid without a #{attr_name}" do
    char = model_name.new
    char.send("#{attr_name}=", nil)
    expect(char).not_to be_valid
  end
end

def test_attribute_value(attr_name, attr_value_min, attr_value_max)
  it "has a(n) #{attr_name} value within valid range" do
    expect(char.send(attr_name.to_sym)).to be_between(attr_value_min, attr_value_max)
  end      
end

def check_attribute_value_within_range(attr_values)
  test_attribute_value(*attr_values)
end

# Begin testing
describe Character do
  it "has a valid factory" do
    skip
  end

  context "without valid attributes" do
    attr_names.each(&method(:check_attribute_value_exists))
  end

  context "with valid attributes" do
    let(:char) { FactoryBot.create :character }

    attr_numerics_with_ranges.each(&method(:check_attribute_value_within_range))
  end
end