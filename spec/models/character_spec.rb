require 'rails_helper'

# Data setup for testing
def char_model_name() "Character"; end
def char_model_constant() char_model_name.constantize; end
def char_model_sym() char_model_name.downcase.to_sym; end
def char_attr_names() char_model_constant.column_names; end

def attr_non_numerics_names() %w[id title created_at updated_at]; end
def char_attr_numerics_names() char_attr_names - attr_non_numerics_names; end

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

def char_attr_numerics_with_ranges
  char_attr_numerics_names.zip(attr_numerics_ranges).map(&:flatten)
end

# Helper method setup for testing
def char_check_attribute_value_exists(attr_name)
  it "is invalid without a #{attr_name}" do
    char = char_model_constant.new
    char.send("#{attr_name}=", nil)
    expect(char).not_to be_valid
  end
end

def char_test_attribute_value(attr_name, attr_value_min, attr_value_max)
  it "has a(n) #{attr_name} value within valid range" do
    expect(char.send(attr_name.to_sym)).to be_between(attr_value_min, attr_value_max)
  end      
end

def char_check_attribute_value_within_range(attr_values)
  char_test_attribute_value(*attr_values)
end

# Begin testing
describe Character do
  # it_should_behave_like 'a basic model'
  it "has a valid factory" do
    skip
  end

  context "without valid attributes" do
    char_attr_names.each(&method(:char_check_attribute_value_exists))
  end

  context "with valid attributes" do
    let(:char) { FactoryBot.create :character }

    char_attr_numerics_with_ranges.each(&method(:char_check_attribute_value_within_range))
  end
end