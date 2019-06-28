var express 		= require('express');
var app 			= express();
var http 			= require('http').Server(app);
var io 				= require('socket.io')(http);
var fs 				= require('fs');
var conf 			= get_conf();					// configurations
var session 		= require('express-session');
var bodyParser 		= require('body-parser'); 		// for parsing JSON and url-encoded data
var multer			= require('multer'); 			// for parsing multipart/form data
var upload 			= multer();
var path 			= require('path');
var db 				= require('./config/db.js');
var cookieParser 	= require('cookie-parser'); 	// cookie-parser is a middleware which parses cookies attached to the client request object.
var notifier 		= require('node-notifier');		// notifications

var redis 			= require('redis');
var redisStore 		= require('connect-redis')(session);
var client 			= redis.createClient();

var async 			= require('async');

var router 			= express.Router();

var things = require('./things.js');
app.use('/things', things);

// Set templating engine
app.set('view engine', 'pug');
app.set('views', './views');

// IMPORTANT
// Here we tell Express to use Redis as session store.
// We pass Redis credentials and port information.
// And express does the rest !
app.use(session({
	secret: 'iEm@S0luti0n5',
	store: new redisStore({host: 'localhost', port: 6379, client: client, ttl: 260}),
	resave: false,
	saveUninitialized: false
}));


app.use(bodyParser.urlencoded({extended: false}));	// for parsing application/xwww-form-urlencoded
app.use(bodyParser.json());							// for parsing application/json
app.use(upload.array());							// for parsing multipart/form-data
app.use(express.static('assets'));					// adding assets like images,css and js
app.use(cookieParser("secretSign#iEma"));			// cookies

/*
// Moved routes to another file
var controllers = require('./controllers');
controllers.set(app);
*/

/**
	--- Router Code begins here. 
**/

router.get('/test',function(req,res){
	res.render('test');

	client.get('framework', function(err, reply){
		console.log(1,reply);
	});
	/*
	//getting hash
	client.hgetall('family',function(err, obj){
		console.log(obj);
	});
	*/
});

router.get('/kitchen',function(req,res){
	if(req.session.key){
		res.render('desk', {name: req.session.key.name});
	} else {
		res.json({"error": true, "message": "Sorry, you do not have permissions to access this resource"});
	}
});

router.get('/contact',function(req,res){
	var name;
	if(req.session.key) name = req.session.key.name;
	
	res.render('contact', {name: name});
});

router.get('/',function(req,res){
	var name;
	if(req.session.key) name = req.session.key.name;
	res.render('desk', {name: name});
});

router.get('/login',function(req,res){
	if(req.session.key){
			res.json({"error": true, "message": "You have already logged in. Please logout"});
	} else {
		res.render('login');
	}
});

router.post('/validateLogin',function(req,res){
	if(!req.body.user_email){
		res.json({"error": true, "message": "Email is mandatory to login"});
	} else if(!req.body.user_password) {
		res.json({"error": true, "message": "Password is mandatory to login"});
	} else {		
		db.query("select * from tab_user where name = '"+req.body.user_email+"' and user_password = '"+req.body.user_password+"'", function(err, results){
			if(err){
				//console.log('DB_ERROR',err.errno,err.sqlMessage); 
				res.json({"error": true, "message": err});
			} else {
				if(results.length){					
					if(results[0].enabled){
						req.session.key = results[0];
						res.json({"error": false, "message": results});
					} else {
						res.json({"error": true, "message": "Your account has been disabled! Please contact the administrator"});
					}
				} else {
					res.json({"error": true, "message": "Login failed! Invalid Email or Password"});
				}
			}
		});
	}
});

router.get('/logout',function(req,res){
	if(req.session.key){
		req.session.destroy(function(){
			res.redirect('/');
		});
	} else {
		res.redirect('/');
	}
});

router.get('/getMenu',function(req,res){
	db.query('select * from tab_menu', function(err, results){
		if(err){
			//console.log('DB_ERROR',err.errno,err.sqlMessage);
			res.json({"error": true, "message": err});
		} else {
			//console.log(results);
			res.json({"error": false, "message": results});
		}
	});
});

router.get('/getItemType',function(req,res){
	db.query('select * from tab_item_type', function(err, results){
		if(err){
			//console.log('DB_ERROR',err.errno,err.sqlMessage);
			res.json({"error": true, "message": err});
		} else {
			//console.log(results);
			res.json({"error": false, "message": results});
		}
	});
});

router.get('/getItemCategory',function(req,res){
	db.query('select * from tab_item_category', function(err, results){
		if(err){
			//console.log('DB_ERROR',err.errno,err.sqlMessage);
			res.json({"error": true, "message": err.sqlMessage});
		} else {
			//console.log(results);
			res.json({"error": false, "message": results});
		}
	});
});

/*
router.post('/updateOrder',function(req,res){
	req.session.myOrder = req.body.myOrder;
	console.log('cached');
});
*/

router.post('/getFullMenu',function(req,res){
	var cond = "";
	
	if(req.body.item_type != "All"){
		cond += " and item_type = '"+req.body.item_type+"'";
	}
	
	if(req.body.item_category != "All"){
		cond += " and item_category = '"+req.body.item_category+"'";
	}
	
	/*
	select 
		t1.menu,
		t1.menu_group,
		t1.name,
		t2.counts 
	from 
		`tab_menu_group_item` t1, 
		(select menu_group,count(*) counts from `tab_menu_group_item` group by menu_group) as t2 
	where t1.menu_group = t2.menu_group order by t2.counts desc;
	*/
	
	db.query("select * from tab_menu_group_item where menu = '"+req.body.menu+"' "+cond+" order by menu_group, idx", function(err, results){
		if(err){
			//console.log('DB_ERROR',err.errno,err.sqlMessage); 
			res.json({"error": true, "message": err});
		} else {
			//console.log(results);
			res.json({"error": false, "message": results, "cache": req.session.myOrder});
		}
	});
});

//Other routes here
//Important - This should be placed after all your routes, as Express matches
//    routes from start to end of the app.js/index.js file, including the 
//	  external routers you required.
router.get('*', function(req, res){
	res.send('Sorry, this is an invalid URL.');
});

app.use('/',router);

// Run Server
/*
http.listen(conf.app_port, conf.app_host, function(){
	console.log('listening on *:',conf.app_port);
	notifyUser();
});
*/

client.on('connect', function(){
	console.log('Redis is conncted now...');
	client.set('framework','myapp_nodejs');
	// storing hashes(objects) in redis
	//client.hmset('family', 'shiv', 'deepa', 'adheesh');
});


http.listen(process.env.PORT || conf.app_port, function(){
	var app_port = process.env.PORT || conf.app_port;
	console.log('listening on *:', app_port);
	notifyUser(app_port);
});

function notifyUser(app_port) {
	notifier.notify({
		'title': conf.app_title,
		'message': 'Listening on *:'+app_port,
		'icon': path.join(__dirname, conf.app_icon),
		sound: true, 								// Only Notification Center or Windows Toasters
		wait: true 									// Wait with callback, until user action is taken against notification
	}, function(err, res){
		// response is response from notification
		console.log(res);
	});
}

function get_conf() {
        // defaults
        var conf = {
                default_host: "localhost",
                default_port: 3000
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

        // get ports from config/config.json
        read_config('./config/config.json');

        return conf;
}
