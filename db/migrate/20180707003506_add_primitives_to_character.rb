class AddPrimitivesToCharacter < ActiveRecord::Migration[5.2]
  def change
    change_table :characters do |t|    
      t.decimal :air_acceleration_base
      t.decimal :air_acceleration_additional
      t.decimal :air_acceleration_float
      t.decimal :air_friction
      t.decimal :air_speed
      t.decimal :fall_speed_base
      t.decimal :fall_speed_fast
      t.decimal :gravity
      t.integer :weight
    end
  end
end
