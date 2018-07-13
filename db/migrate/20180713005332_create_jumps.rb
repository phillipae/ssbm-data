class CreateJumps < ActiveRecord::Migration[5.2]
  def change
    create_table :jumps do |t|
      t.belongs_to :character
      t.integer :jumpsquat
      t.integer :max_jumps
      t.integer :landing_lag
      t.decimal :jump_force, precision: 3, scale: 2

      t.timestamps
    end
  end
end
