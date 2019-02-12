# !/usr/bin/python3

import requests
import os
import json
import sys

def addData(path):
    url='http://triviatrek.hhsfbla.com/wp-json/wp/v2/media'
    data = open(path, 'rb').read()
    print(data)
    # fileName = os.path.basename(path)
    # res = requests.post(url='http://triviatrek.hhsfbla.com/wp-json/wp/v2/media',
    #                     data=data,
    #                     headers={ 'Content-Type': 'application/json'},
    #                     auth=('MAD', 'byrEwiX8Xt0gHyeZ'))
    # newDict = res.json()
    # newID = newDict.get('id')
    # link = newDict.get('guid').get("rendered")
    # return (newID, link)

if __name__ == "__main__":
    path = sys.argv[1]
    addData(path)