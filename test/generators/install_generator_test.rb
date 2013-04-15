require 'test_helper'
require 'generators/rails_maps/install/install_generator.rb'

class InstallGeneratorTest < Rails::Generators::TestCase
  tests RailsMaps::Generators::InstallGenerator
  destination File.expand_path("../../tmp", __FILE__)
  setup :prepare_destination

  test 'run install generator' do
    run_generator
  end

  test 'create leaflet layers.png' do
    run_generator ['location']
    assert_file 'app/assets/images/leaflet/layers.png'
  end

  test 'create leaflet marker-icon@2x.png' do
    run_generator ['location']
    assert_file 'app/assets/images/leaflet/marker-icon@2x.png'
  end

  test 'create leaflet marker-icon.png' do
    run_generator ['location']
    assert_file 'app/assets/images/leaflet/marker-icon.png'
  end

  test 'create leaflet marker-shadow.png' do
    run_generator ['location']
    assert_file 'app/assets/images/leaflet/marker-shadow.png'
  end

  test 'create leaflet.js' do
    run_generator ['location']
    assert_file 'app/assets/javascripts/leaflet/leaflet.js'
  end

  test 'create leaflet.css' do
    run_generator ['location']
    assert_file 'app/assets/stylesheets/leaflet/leaflet.css'
  end

  test 'create leaflet.ie.css' do
    run_generator ['location']
    assert_file 'app/assets/stylesheets/leaflet/leaflet.ie.css'
  end

  test 'create rails-maps.js.coffee' do
    run_generator ['location']
    assert_file 'app/assets/javascripts/rails-maps.js.coffee'
  end

end
