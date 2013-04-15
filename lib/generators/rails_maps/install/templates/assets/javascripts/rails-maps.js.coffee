# TODO: Try to remove maps and maps_markers redundancy
maps_markers = $({})
maps = $([])


#
# Document onloads
#

$(document).ready ->
  $('[data-map]').each initialize_map
  $('[data-clear-position]').each clear_markers_callback
  $('[data-advanced-search]').click toggle_advanced_search


toggle_advanced_search = ->
  map = $('#map')
  if map.hasClass('expanded')
    map.switchClass('expanded', 'contracted', 1000)
  else
    map.switchClass('contracted', 'expanded', 1000)
 


initialize_map = (_,elm) ->
  elm = $(elm)
  map_id = elm.attr("id")

  # Create map and set place and zoom
  map = L.map(map_id)
  map.id = map_id
  window.lo_map = map
  map.setView([elm.attr("data-lat"), elm.attr("data-lon")], elm.attr("data-zoom"))

  # Save references for later
  maps_markers[map_id] = $([])
  maps.push(map)

  # Add provider layer
  layer = L.tileLayer elm.attr("data-provider"), {attribution: elm.attr("data-attribution")}
  layer.addTo(map)

  # Add events
  map.on 'click', select_event(elm.attr("data-click"))

  # Add markers
  $("#" + map_id + " > .markers > li ").each (_,elm) ->
    elm = $(elm)
    lat = elm.find(".lat").first().attr("value")
    lon = elm.find(".lon").first().attr("value")
    popup_content = elm.find(".popup_content").first().attr("value")
    add_marker(map, lat, lon, popup_content, {skip_form:true})


clear_markers_callback = (_,elm) ->
  elm = $(elm)
  elm.click ->
    # remove markers from map
    map_id = elm.attr('data-map-name')
    map = get_map(maps, map_id)
    clear_markers(map)

#
# Events
#

select_event = (event) ->
  switch event
    when "single_mark" then single_mark
    else (e) -> return

single_mark = (e) ->
  map_id = e.target.id
  map = get_map(maps, map_id)

  # Clear all markers since can only have one
  clear_markers(map)

  # Set the marker
  lat = e.latlng.lat
  lon = e.latlng.lng
  add_marker(map, lat, lon)


#
# Utility functions
#

add_marker = (map, lat, lon, popup_content, extra = {}) ->
  # Add marker in the map
  marker = L.marker([lat,lon]).addTo(map)

  # save reference to marker
  maps_markers[map.id].push(marker)

  # add popup to marker
  unless popup_content is undefined or popup_content == ""
    popup = marker.bindPopup(popup_content)

  unless extra['skip_form'] is true
    add_marker_form(map, lat, lon)



add_marker_form = (map, lat, lon) ->
  map_name = map.id
  count = maps_markers[map.id].length - 1
  field_name_prefix = "#{map_name}[markers][#{count}]"
  $("#" + map.id + " > ul.markers").append(
    "<li>
      <ul>
        <li>
          <input type='hidden' class='lat' name='#{field_name_prefix}[lat]' value='#{lat}'>
        </li>
        <li>
          <input type='hidden' class='lon' name='#{field_name_prefix}[lon]' value='#{lon}'>
        </li>
      </ul>
    </li>")



clear_markers = (map) ->
  maps_markers[map.id].each (_,elm) ->
    map.removeLayer(elm)
  maps_markers[map.id] = $([])

  # Remove inputs for positions
  $("#" + map.id + " > .markers > li ").each (_,elm) ->
    elm = $(elm)
    elm.remove()


get_map = (maps, map_id) ->
  map = $.grep maps, (n,_) ->
    return n.id == map_id
  map[0]


