$ ->
  location = document.getElementById('geofencing_address')
  autocomplete = new google.maps.places.Autocomplete(location)
  autocomplete.addListener 'place_changed', ->
    place = autocomplete.getPlace()
    pickup_lat = place.geometry.location.lat()
    pickup_long = place.geometry.location.lng()
    document.getElementById("geofencing_lat").value = pickup_lat
    document.getElementById("geofencing_long").value = pickup_long
    document.getElementById("geofencing_count").value = 0
    getData(pickup_lat, pickup_long)

  getData = (lat, long)->
    $.ajax
      url: '/geofencing/get_position'
      method: 'POST'
      dataType: 'json'
      data:
        'pick_up_lat': lat
        'pick_up_long': long
      success: (result) ->
        setTimeout (->
          alert(result.location_in)
        ), 1000