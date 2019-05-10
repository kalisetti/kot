var express 		= require('express');
var app 			= express();
var http 			= require('http').Server(app);
var io 				= require('socket.io')(http);
var fs 				= require('fs');
var session 		= require('express-session');
var bodyParser 		= require('body-parser'); // For parsing JSON and url-encoded data
var multer			= require('multer'); // For parsing multipart/form data
var upload 			= multer();
var path 			= require('path');
var db 				= require('./config/db.js');
var cookieParser 	= require('cookie-parser'); // cookie-parser is a middleware which parses cookies attached to the client request object.
var conf 			= get_conf();

// Notifications
const notifier 		= require('node-notifier');

var things = require('./things.js');
//both app.js and things.js should be in same directory
app.use('/things', things)

// Set templating engine
app.set('view engine', 'pug');
app.set('views', './views');

app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));

// for parsing application/xwww-form-urlencoded
app.use(bodyParser.urlencoded({extended: true}));
// for parsing application/json
app.use(bodyParser.json());

// for parsing multipart/form-data
app.use(upload.array());
//app.use(express.static('public'));

// Adding assets like images,css and js
app.use(express.static('assets'));

// Cookies
app.use(cookieParser());

//Moved routes to another file
var controllers = require('./controllers');
controllers.set(app);

http.listen(conf.app_port, function(){
	console.log('listening on *:',conf.app_port);
	notifier.notify({
		'title': 'KITCHEN ORDER TICKET SYSTEM',
		'message': 'Listening on *:'+conf.app_port,
		'icon': path.join(__dirname, 'assets/images/cupicon.gif'),
		sound: true, // Only Notification Center or Windows Toasters
		wait: true // Wait with callback, until user action is taken against notification
	}, function(err, res){
		// Response is response from notification
		console.log(res);
	});
});

function get_conf() {
        // defaults
        var conf = {
                redis_async_broker_port: 12311,
                socketio_port: 3000
        };

        var read_config = function(path) {
                if(fs.existsSync(path)){
                        var app_config = JSON.parse(fs.readFileSync(path));
                        for (var key in app_config) {
                                if (app_config[key]) {
                                        conf[key] = app_config[key];
                                }
                        }
                }
        }

        // get ports from bench/config.json
        read_config('./config/config.json');

        return conf;
}
