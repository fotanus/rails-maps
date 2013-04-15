module RailsMaps
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      desc "Add vendor files"

      def copy_images
        template "assets/images/leaflet/layers.png", "app/assets/images/leaflet/layers.png"
        template "assets/images/leaflet/marker-icon@2x.png", "app/assets/images/leaflet/marker-icon@2x.png"
        template "assets/images/leaflet/marker-icon.png", "app/assets/images/leaflet/marker-icon.png"
        template "assets/images/leaflet/marker-shadow.png", "app/assets/images/leaflet/marker-shadow.png"
      end

      def copy_javascripts
        template "assets/javascripts/leaflet/leaflet.js", "app/assets/javascripts/leaflet/leaflet.js"
        template "assets/javascripts/rails-maps.js.coffee", "app/assets/javascripts/rails-maps.js.coffee"
      end

      def copy_css
        template "assets/stylesheets/leaflet/leaflet.css", "app/assets/stylesheets/leaflet/leaflet.css"
        template "assets/stylesheets/leaflet/leaflet.ie.css", "app/assets/stylesheets/leaflet/leaflet.ie.css"
      end
    end
  end
end
