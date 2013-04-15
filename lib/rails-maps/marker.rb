module RailsMaps
  class Marker
    attr_accessor :lat, :lon, :popup_content, :icon

    def initialize(params)
      defaults = {lat:nil, lon:nil, popup_content:nil}
      params = defaults.merge(params)
      @lat = params[:lat]
      @lon = params[:lon]
      @popup_content = params[:popup_content]
    end
  end
end
