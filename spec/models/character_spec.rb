require 'spec_helper.rb'

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

    it "returns a title" do
      expect(char.title).to be_a(String)
    end

    it "returns a rank" do
      expect(char.rank).to be_between(1, 30)
    end

    it "returns an air_acceleration_base" do
      expect(char.air_acceleration_base).to be_between(0.01, 0.19)
    end

    it "returns an air_acceleration_additional" do
      expect(char.air_acceleration_additional).to be_between(0.0125, 0.09)
    end

    it "returns an air_acceleration_max" do
      expect(char.air_acceleration_max).to be_between(0.0325, 0.28)
    end

    it "returns an air_friction" do
      expect(char.air_friction).to be_between(0.001, 0.05)
    end

    it "returns an air_speed" do
      expect(char.air_speed).to be_between(0.68, 1.35)
    end

    it "returns a fall_speed_base" do
      expect(char.fall_speed_base).to be_between(1.3, 3.1)
    end

    it "returns a fall_speed_fast" do
      expect(char.fall_speed_fast).to be_between(1.6, 3.5)
    end

    it "returns a gravity" do
      expect(char.gravity).to be_between(0.064, 0.25)
    end

    it "returns a weight" do
      expect(char.weight).to be_between(55, 140)
    end

  end

end