<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>{{header}}</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="{{fullpath('static')}}/css/normalize.min.css">
        <link rel="stylesheet" href="{{fullpath('static')}}/css/main.css">
        <link rel="stylesheet" href="{{fullpath('static')}}/css/pikaday.css">

        <script src="{{fullpath('static')}}/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <script src="{{fullpath('static')}}/js/vendor/moment.min.js"></script>
        <script src="{{fullpath('static')}}/js/vendor/pikaday.js"></script>
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <div class="header-container">
            <header class="wrapper clearfix">
                <h1 class="title">{{header}}</h1>
                <nav>
                    <a href="{{fullpath('live')}}">Live</a>
                </nav>
            </header>
        </div>

        <div class="main-container">
            <div class="main wrapper clearfix">

                <article>
                    % content()
                </article>

                <aside>
                    <div id="datepicker"></div>
                </aside>

            </div> <!-- #main -->
        </div> <!-- #main-container -->

        <div class="footer-container">
            <footer class="wrapper">
            </footer>
        </div>

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="{{fullpath('static')}}/js/vendor/jquery-1.11.0.min.js"><\/script>')</script>

        <script>
            $(function() {
    		    var $sidebar   = $(".main aside"), 
	    	        $window    = $(window),
		            offset     = $sidebar.offset(),
		            topPadding = 15;

    		    $window.scroll(function() {
	    	        if ($window.scrollTop() > offset.top) {
		                $sidebar.stop().animate({
		                    marginTop: $window.scrollTop() - offset.top + topPadding
		                });
    		        } else {
	    	            $sidebar.stop().animate({
		                    marginTop: 0
		                });
		            }
    		    });
	    	});
	    </script>

	    <script>
        var field = document.getElementById('datepicker');
            date_fmt = "YYYY/MM/DD";
            var picker = new Pikaday({
                onSelect: function(date) {
                    subdir = picker.toString(date_fmt);
                    location.href  = "{{fullpath('/date/')}}" + subdir;
                },
                % if defined('recs_subdir'):
                defaultDate: moment("{{recs_subdir}}", date_fmt).toDate(),
                % end
                firstDay: 1
            });
            field.parentNode.insertBefore(picker.el, field.nextSibling);
        </script>

    </body>
</html>
