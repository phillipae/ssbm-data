# Expects a model_name

shared_examples "a basic model" do |model_name|
  it "has a valid factory" do
    skip
  end

  context "without valid attributes" do
    let(:invalid_testing_instance) { initialize_invalid_testing_instance(model_name) }
    attr_names(model_name).each(&method(:check_attribute_value_exists))
  end

  context "with valid attributes" do
    let(:valid_testing_instance) { initialize_valid_testing_instance(model_name) }
    attr_numerics_with_ranges(model_name).each(&method(:check_attribute_value_within_range))
  end
end

private

def initialize_invalid_testing_instance(model_name)
  model_constant(model_name).new
end

# HACK: handle dynamically instead of via hard-coding
def initialize_valid_testing_instance(model_name)
  case model_name
  when 'Character' then FactoryBot.create(:character)
  when 'Jump' then (FactoryBot.create model_constant(model_name).reflect_on_all_associations(:belongs_to).map(&:name).first).send(model_sym(model_name))
  end
end

# helper methods
def model_constant(model_name) model_name.downcase.titleize.constantize; end
def model_sym(model_name) model_name.downcase.to_sym; end

def attr_names(model_name) model_constant(model_name).column_names; end
def attr_numerics_names(model_name) attr_names(model_name) - model_constant(model_name).attr_non_numerics_names; end

def attr_numerics_with_ranges(model_name)
  attr_numerics_names(model_name).zip(model_constant(model_name).attr_numerics_ranges).map(&:flatten)
end

# tester methods

def check_attribute_value_exists(attr_name)
  it "is invalid without a #{attr_name}" do
    invalid_testing_instance.send("#{attr_name}=", nil)
    expect(invalid_testing_instance).not_to be_valid
  end
end

def test_attribute_values(model_name)
end

def test_attribute_value(attr_name, attr_value_min, attr_value_max)
  it "has a(n) #{attr_name} value within valid range" do  
    expect(valid_testing_instance.send(attr_name.to_sym)).to be_between(attr_value_min, attr_value_max)
  end      
end

def check_attribute_value_within_range(attr_values)
  test_attribute_value(*attr_values)
end
