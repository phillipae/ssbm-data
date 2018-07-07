class AddPrimitivesToCharacter < ActiveRecord::Migration[5.2]
  def change
    change_table :characters do |t|    
      t.decimal :air_acceleration_base, precision: 3, scale: 2
      t.decimal :air_acceleration_additional, precision: 5, scale: 4
      t.decimal :air_acceleration_max, precision: 5, scale: 4
      t.decimal :air_friction, precision: 4, scale: 3
      t.decimal :air_speed, precision: 3, scale: 2
      t.decimal :fall_speed_base, precision: 3, scale: 2
      t.decimal :fall_speed_fast, precision: 3, scale: 2
      t.decimal :gravity, precision: 4, scale: 3
      t.integer :weight
    end
  end
end
