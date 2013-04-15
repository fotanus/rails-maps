module RailsMaps
  module ActsAsPosition
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_position(options = {})
        unless column_names.include?('lat') && column_names.include?('lon')
          raise "Needs lat and lon"
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, RailsMaps::ActsAsPosition
