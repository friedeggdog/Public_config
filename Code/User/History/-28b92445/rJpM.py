#!/bin/python3

import zipfile
import io

archive = io.BytesIO()

with zipfile.ZipFile(archive,'w') as zip_archive:
    zip_archive.write('/home/jagannathanm/comp_log.txt')

with open('config.zip', 'wb') as f:
    f.write(archive.getbuffer())

archive.close()