class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :current_state
      t.text :acceptable_pattern

      t.timestamps
    end
  end
end
