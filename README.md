# Geofencing Rails:
Mechanism:

Most of the work is with google maps and backend polygon creation.
Displayed google maps and created two polygons on it as central and out-skirt polygons and a google maps autocomplete field.
everytime user keys in his location from autocomplete the system puts a marker of user location on maps and tells his wether you are in central polygon or out-skirt polygon or you are out of range (out of both polygons).

How it finds out in which polygon you are:

With the help of GeoKit rails i created two similar polygons on the back end and everytime user keys in his locations a Ajax call i being made to backend with the user location lat long and then user location lat-long is being converted to a geo-kit object and then user lat-long is check with in the polygons with a .contain? method. after that the response is being passed to the front-end and user can see it. :)

Demo link: 
https://fierce-atoll-23945.herokuapp.com/
