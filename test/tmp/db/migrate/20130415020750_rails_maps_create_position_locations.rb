class RailsMapsCreatePositionLocations < ActiveRecord::Migration
  def change
    create_table(:locations) do |t|
      # RailsMaps Position Attributes
      t.string :lat
      t.string :lon

      # Custom attributes
      
      t.string :name
      
      t.string :desc
      
      t.int :rate
      
      t.timestamps
    end
  end
end
