class GeofencingPolygonService
  include Geokit::Geocoders

  def get_center_polygon
    #create center_polygon
    create_center_polygon
  end

  def get_out_skirt_polygon
     #create out_skirt_polygon
    create_out_skirt_polygon
  end

  private

  def create_center_polygon
    #passing lat long of polygon to creat a geokit polygon
    center_polygon = Geokit::Polygon.new([ 
      Geokit::LatLng.new(51.534164, -0.122223), 
      Geokit::LatLng.new(51.543132, -0.107460), 
      Geokit::LatLng.new(51.542705, -0.090294), 
      Geokit::LatLng.new(51.534804, -0.077934), 
      Geokit::LatLng.new(51.521775, -0.080681), 
      Geokit::LatLng.new(51.516862, -0.101624), 
      Geokit::LatLng.new(51.521134, -0.121536)
    ])
  end

  def create_out_skirt_polygon
    #passing lat long of polygon to creat a geokit polygon
    center_polygon = Geokit::Polygon.new([ 
      Geokit::LatLng.new(51.540997, -0.128403),
      Geokit::LatLng.new(51.549965, -0.097504),
      Geokit::LatLng.new(51.540997, -0.073128),
      Geokit::LatLng.new(51.527756, -0.069695),
      Geokit::LatLng.new(51.517930, -0.075531),
      Geokit::LatLng.new(51.510452, -0.106430),
      Geokit::LatLng.new(51.514512, -0.131149),
      Geokit::LatLng.new(51.529892, -0.133553)
    ])
  end
end