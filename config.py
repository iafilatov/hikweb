# Host name or ip address and port to listen on
host = 'localhost'
port = 8080

# Run in debug mode, also turns on reloader
app_debug = False

# The directory where hikstract puts extracted recordings
RECORDS_DIR = 'hikstract/out'

# Match the names of the recordings against this pattern
import re
RECORDS_PAT = re.compile('rec_\d{4}-\d{2}-\d{2}_\d{2}:\d{2}:\d{2}\.mp4')

STATIC_ROOT = './static'

# Defaults that are passed into each template
TPL_DEFAULTS = {
                'STATIC_PATH': '/static',
                }