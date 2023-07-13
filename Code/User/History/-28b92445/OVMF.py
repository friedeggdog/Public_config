#!/bin/python3

import zipfile
import io

archive = io.BytesIO()

with zipfile.ZipFile(archive,'w') as zip_archive:
    zip_archive.write('/home/jagannathanm/comp_log.txt')

print(archive.getvalue())