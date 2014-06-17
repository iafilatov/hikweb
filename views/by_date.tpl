% def content():
    <header>
        % if not recs:
        	<h2>{{msg}}</h2>
        % end
    </header>
    % for rec, snap in recs:
        % time = rec[15:23]
        <section>
            <h3>{{time}}</h3>
            <div><video width="320" height="240" preload="none" poster="{{fullpath('video')}}/{{recs_subdir}}/{{snap}}" controls>
                <source src="{{fullpath('video')}}/{{recs_subdir}}/{{rec}}" type="video/webm">
                Your browser does not support the video tag.
            </video></div>
        </section>
    % end
% end

% rebase('base', content=content)