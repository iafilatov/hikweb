import os

import bottle

from app import app
import config as cfg


os.chdir(os.path.dirname(__file__))

bottle.debug(cfg.app_debug)

application = app

