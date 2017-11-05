class GeofencingController < ApplicationController

  def index
  end

  def get_position
    #running check_added_location_in_which_polygon to get result of where added location is
    location_in = check_added_location_in_which_polygon(params)
    respond_to do |format|
      format.html { geofencing_index_path }
      format.json { render json: {location_in: location_in}, status: 200}
    end
  end

  private

  def check_added_location_in_which_polygon(params)
    #making user input location lat-long into a geokit object for comparison
    location_point = Geokit::LatLng.new(params[:pick_up_lat].to_f, params[:pick_up_long].to_f)
    location_in = "Added Location Not In Range"
    #assigning service to a var to run later
    service = GeofencingPolygonService.new()
    
    #service.get_center_polygon to get the center polygon and then check if added location is in that polygon with .contains?(location_point)
    if service.get_center_polygon.contains?(location_point)
      location_in = "Added Location Is In Center Polygon"
    #service.get_out_skirt_polygon to get the out-skirt polygon and then check if added location is in that polygon with .contains?(location_point)
    elsif service.get_out_skirt_polygon.contains?(location_point)
      location_in = "Added Location Is In Out-Skirt Polygon"
    end
    #returning where the location is
    return location_in
  end
end