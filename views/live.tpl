% def content():
    <embed type="application/x-vlc-plugin" name="video1" autoplay="yes" loop="yes" target="{{rtsp_address}}" width="697" height="522">
% end

% rebase('base', content=content, header='Live stream')