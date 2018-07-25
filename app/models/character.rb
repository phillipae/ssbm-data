class Character < ApplicationRecord
  has_one :jump

  validates :air_acceleration_base,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 0.01,
              less_than_or_equal_to: 0.19
            }
  validates :air_acceleration_additional,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 0.0125,
              less_than_or_equal_to: 0.09
            }
  validates :air_acceleration_max,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 0.0325,
              less_than_or_equal_to: 0.28
            }
  validates :air_friction,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 0.001,
              less_than_or_equal_to: 0.05
            }
  validates :air_speed,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 0.68,
              less_than_or_equal_to: 1.35
            }
  validates :fall_speed_base,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 1.3,
              less_than_or_equal_to: 3.1
            }
  validates :fall_speed_fast,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 1.6,
              less_than_or_equal_to: 3.5
            }
  validates :gravity,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 0.064,
              less_than_or_equal_to: 0.25
            }
  validates :weight,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 55,
              less_than_or_equal_to: 140
            }

def self.attr_non_numerics_names() %w[id title created_at updated_at]; end
def self.attr_numerics_ranges
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

end
