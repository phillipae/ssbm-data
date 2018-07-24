class Jump < ApplicationRecord
  belongs_to :character

  validates :jumpsquat,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 3,
              less_than_or_equal_to: 8
            }
  validates :max_jumps,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 2,
              less_than_or_equal_to: 6
            }
  validates :landing_lag,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 4,
              less_than_or_equal_to: 6
            }
  validates :jump_force,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 1.6,
              less_than_or_equal_to: 4.1
            }

  def self.attr_non_numerics_names() %w[id created_at updated_at character_id]; end
  def self.attr_numerics_ranges
    [
      [3,   8],
      [2,   6],
      [4,   6],
      [1.6, 4.1]
    ]
  end

end