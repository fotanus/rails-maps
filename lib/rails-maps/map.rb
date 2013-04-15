module RailsMaps
  class Map
    def initialize(params)
      @name = params[:name]
      raise "Map needs a name attribute" unless @name
      params = {lat: 0, lon: 0, zoom: nil}.merge(params)

      @provider = "http://{s}.tile.osm.org/{z}/{x}/{y}.png"
      @attribution = '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
      @lat = params[:lat]
      @lon = params[:lon]
      @zoom = params[:zoom]
      @markers = []
      @click = Maps::Event.new
    end

    def center
      @center
    end
  end
end
