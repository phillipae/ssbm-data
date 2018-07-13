require 'spec_helper.rb'

# Data setup for testing
def jump_model_name() "Jump"; end
def model_constant() jump_model_name.constantize; end
def model_sym() jump_model_name.downcase.to_sym; end

def attr_names() model_constant.column_names; end
def attr_numerics_names() attr_names - %w[id created_at updated_at character_id]; end

def attr_numerics_ranges
  [
    [3,   8],
    [2,   6],
    [4,   6],
    [1.6, 4.1]
  ]
end

def attr_numerics_with_ranges
  attr_numerics_names.zip(attr_numerics_ranges).map(&:flatten)
end


# Helper method setup for testing
def check_attribute_value_exists(attr_name)
  it "is invalid without a #{attr_name}" do
    invalid_instance = model_constant.new
    invalid_instance.send("#{attr_name}=", nil)
    expect(invalid_instance).not_to be_valid
  end
end

def test_attribute_value(attr_name, attr_value_min, attr_value_max)
  it "has a(n) #{attr_name} value within valid range" do  
    expect(testing_instance.send(attr_name.to_sym)).to be_between(attr_value_min, attr_value_max)
  end      
end

def check_attribute_value_within_range(attr_values)
    puts attr_values
  test_attribute_value(*attr_values)
end

def initialize_testing_instance
  (FactoryBot.create model_constant.reflect_on_all_associations(:belongs_to).map(&:name).first).send(model_sym)
end

describe Jump do
  it "has a valid factory" do
    skip
  end

  context "without valid attributes" do
    attr_names.each(&method(:check_attribute_value_exists))
  end

  context "with valid attributes" do
    let(:testing_instance) { initialize_testing_instance }

    attr_numerics_with_ranges.each(&method(:check_attribute_value_within_range))
  end
end