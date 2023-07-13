from zipfile import ZipFile
from io import BytesIO

archive = BytesIO()

with ZipFile(archive,'w') as zip_archive:
    zip_archive.write('/home/jagannathanm/comp_log.txt')