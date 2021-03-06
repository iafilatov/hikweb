from datetime import date
import logging
import os

from bottle import Bottle, view, static_file, template, redirect

import config as cfg


logging.basicConfig(level=logging.DEBUG)
LOG = logging.getLogger(__name__)


app = Bottle()


def fullpath(path):
    '''Prepends SCRIPT_NAME; to be used mostly in templates'''
    return '/'.join((cfg.SCRIPT_NAME, path.lstrip('/')))


TPL_DEFAULTS = {
                'fullpath': fullpath,
                }


@app.get('/', name='index')
def index():
    redirect(app.get_url('live'), 303)


@app.get('/today', name='today')
def today():
    today = date.today()
    return by_date(today.year, today.month, today.day)


@app.get('/live', name='live')
@view('live', **TPL_DEFAULTS)
def today():
    return {'rtsp_address': cfg.RTSP_ADDRESS}


@app.get('/date/<year:int>/<month:int>/<day:int>', name='by_date')
@view('by_date', **TPL_DEFAULTS)
def by_date(year, month, day):
    recs = []
    
    # Sort of validation
    d = date(year, month, day)
    ymd = (str(d.year), '{:02d}'.format(d.month), '{:02d}'.format(d.day))
    recs_subdir = os.path.join(*ymd)
    recs_path = os.path.join(cfg.RECORDS_DIR, recs_subdir)
    try:
        for vid in os.listdir(recs_path):
            if cfg.RECORDS_PAT.match(vid) is None:
                continue
            snap = 'snap_{}.jpg'.format(vid[4:23])
            recs.append((vid, snap))
        recs.sort()
        msg = '{} videos'.format(len(recs))
    except FileNotFoundError:
        pass
    if not recs:
        msg = 'No videos for this date'
        
    header = d.strftime('%a, %d %B %Y')
    
    return {
            'header': header,
            'msg': msg,
            'recs': recs,
            'recs_subdir': recs_subdir,
            }
   

@app.get('/video/<path:path>', name='video')
def video(path):
    return static_file(path, root=cfg.RECORDS_DIR)
    

@app.get('/static/<path:path>', name='static')
def static(path):
    return static_file(path, root=cfg.STATIC_ROOT)


@app.error(404)
@view('404', **TPL_DEFAULTS)
def error_404(error):
    return None
    