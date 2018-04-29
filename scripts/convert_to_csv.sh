#!/bin/bash

for geojson in $(ls /Users/vasya/Projects/berlin_trees/data/*geojson); do
    ogr2ogr -f "CSV" "${geojson%%geojson}" "$geojson" \
        -t_srs "EPSG:4326" -lco "GEOMETRY=AS_WKT" \
        -lco "LINEFORMAT=CRLF" -lco "SEPARATOR=TAB"
done

ogr2ogr -f "CSV" "" "$geojson" \
    -t_srs "EPSG:4326" -lco "GEOMETRY=AS_WKT" \
    -lco "LINEFORMAT=CRLF" -lco "SEPARATOR=TAB"
