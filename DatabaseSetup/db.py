# !/usr/bin/python3

import requests
import os
import json

def addData(path):
    url='http://triviatrek.hhsfbla.com/wp-json/wp/v2/media'
    data = open(path, 'rb').read()
    fileName = os.path.basename(path)
    res = requests.post(url='http://triviatrek.hhsfbla.com/wp-json/wp/v2/media',
                        data=data,
                        headers={ 'Content-Type': 'application/json','Content-Disposition' : 'attachment; filename=%s'% fileName},
                        auth=('authname', 'authpass'))
    newDict = res.json()
    newID = newDict.get('id')
    link = newDict.get('guid').get("rendered")
    print(newID, link)
    return (newID, link)