import re

host = 'localhost'
port = 8080

app_debug = False

RECORDS_DIR = '/home/esyn/git/hikstract/out'
RECORDS_PAT = re.compile('rec_\d{4}-\d{2}-\d{2}_\d{2}:\d{2}:\d{2}\.mp4')

STATIC_ROOT = '/home/esyn/git/hikweb/static'

TPL_DEFAULTS = {
                'STATIC_PATH': '/static',
                }