require 'spec_helper.rb'

def check_attribute_value_within_range(attr_name, attr_min_value, attr_max_value)
  it "has a(n) #{attr_name} value within valid range" do
    expect(char.send(attr_name.to_sym)).to be_between(attr_min_value, attr_max_value)
  end      
end

describe Character do
  it "has a valid factory" do
  end

  context "without valid attributes" do
      it "is invalid without a title" do
        char = Character.new(title: nil)
        expect(char).not_to be_valid
      end

      it "is invalid without a rank" do
        char = Character.new(rank: nil)
        expect(char).not_to be_valid
      end
  end

  context "with valid attributes" do
    let(:char) { FactoryBot.create :character }

    [
      ["rank",                        1,      30],
      ["air_acceleration_base",       0.01,   0.19],
      ["air_acceleration_additional", 0.0125, 0.09],
      ["air_acceleration_max",        0.0325, 0.28],
      ["air_friction",                0.001,  0.05],
      ["air_speed",                   0.68,   1.35],
      ["fall_speed_base",             1.3,    3.1],
      ["fall_speed_fast",             1.6,    3.5],
      ["gravity",                     0.064,  0.25],
      ["weight",                      55,     140]
    ].each do |attr_name, attr_min_value, attr_max_value|
      check_attribute_value_within_range(attr_name, attr_min_value, attr_max_value)
    end

  end
end