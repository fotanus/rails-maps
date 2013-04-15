module RailsMaps
  class Event
    attr_reader :type

    TYPES = [:single_mark, :empty]
    def initialize(type = :empty)
      raise "Unknown type" unless TYPES.include? type
      @type = type
    end
  end
end
