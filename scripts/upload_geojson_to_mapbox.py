#!/usr/bin/env python

from mapbox import Uploader

# geojson = '/Users/vasya/Projects/berlin_trees/baumbestand_strassen_18.04.18.geojson'
geojson = '/Users/vasya/Projects/berlin_trees/baumbestand_anlagen_18.04.18.geojson'


service = Uploader()
from time import sleep
from random import randint

mapid = 'baumbestand_anlagen_18-04-18'
with open(geojson, 'rb') as src:
    upload_resp = service.upload(src, mapid)

if upload_resp.status_code == 422:
    for i in range(5):
        sleep(5)
        with open(geojson, 'rb') as src:
            upload_resp = service.upload(src, mapid)
        if upload_resp.status_code != 422:
            break

upload_id = upload_resp.json()['id']
for i in range(5):
     status_resp = service.status(upload_id).json()
     if status_resp['complete']:
         break
     sleep(5)
mapid in status_resp['tileset']

