require 'rails/generators/active_record'

module RailsMaps
  module Generators
    class PositionGenerator < ActiveRecord::Generators::Base
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
      desc 'Generates a position base model. Other than that, you should use' <<
           'it as a default model generator'

      source_root File.expand_path("../templates", __FILE__)

      def generate_model
        invoke "active_record:model", [name], :migration => false
      end

      def copy_migration
        migration_template "migration.rb", "db/migrate/rails_maps_create_position_#{table_name}"
      end

      def patch_model
        model_path = File.join("app", "models", "#{file_path}.rb")
        class_path = namespaced? ? class_name : class_name.to_s.split("::").last

        content = "  acts_as_position\n"
        inject_into_class(model_path, class_path, content)
      end
    end
  end
end
