require 'test_helper'
require 'generators/rails_maps/position/position_generator.rb'

class PositionGeneratorTest < Rails::Generators::TestCase
  tests RailsMaps::Generators::PositionGenerator
  destination File.expand_path("../../tmp", __FILE__)
  setup :prepare_destination

  test 'run empty' do
   #run_generator # How to test the error message?
  end

  test 'run simple' do
    run_generator ['location']
  end

  test 'run with args' do
    run_generator %w(location name:string desc:string rate:int)
  end

  test 'create model file' do
    run_generator ['location']
    assert_file 'app/models/location.rb'
  end

  test 'model file has acts_as_position' do
    run_generator ['location']
    assert_file 'app/models/location.rb', /acts_as_position/
  end

  test 'create migration' do
    run_generator ['location']
    assert_migration 'db/migrate/rails_maps_create_position_locations.rb'
  end

  test 'migration file has lat' do
    run_generator ['location']
    assert_migration 'db/migrate/rails_maps_create_position_locations.rb', /t\.string :lat/
  end

  test 'migration file has lon' do
    run_generator ['location']
    assert_migration 'db/migrate/rails_maps_create_position_locations.rb', /t\.string :lon/
  end

  test 'migration has custom attribute' do
    run_generator %w(location custom:float)
    assert_migration 'db/migrate/rails_maps_create_position_locations.rb', /t\.float :custom/
  end
end
