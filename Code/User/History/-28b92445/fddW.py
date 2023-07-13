from zipfile import ZipFile
from io import BytesIO

archive = BytesIO()

with ZipFile(archive,'w') as zip_archive:
    ZipFile.write('/home/jagannathanm/comp_log.txt')