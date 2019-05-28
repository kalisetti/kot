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

// This is an important function.
// This function does the database handling task.
// We also use async here for control flow.
function handle_database(req,type,callback){
	async.waterfall(
		[
			function(callback){
				db.getConnection(function(err,connection){
					if(err){
						// if there is error, stop right away.
						// This will stop async code execution and goes to last function.
						callback(true);
					} else {
						callback(null,connection);
					}
				});
			},
			function(connection,callback){
				var SQLquery;
				switch(type){
					case "login":
						SQLquery = "SELECT * FROM user_login WHERE user_email = '"+req.body.user_email+"' AND `user_password` = '"+req.body.user_password+"'";
						break;
					case "checkEmail":
						SQLquery = "SELECT * FROM user_login WHERE user_email = '"+req.body.user_email+"'";
						break;
					case "register":
						SQLquery = "INSERT INTO user_login(user_email,user_password,user_name) VALUES('"+req.body.user_email+"','"+req.body.user_password+"','"+req.body.user_name+"')";
						break;
					case "addStatus":
						SQLquery = "INSERT INTO user_status(user_id,user_status) VALUES("+req.session.key["user_id"]+",'"+req.body.status+"')";
						break;
					case "getStatus":
						SQLquery = "SELECT * FROM user_status WHERE user_id="+req.session.key["user_id"];
						break;
					case "getMenu":
						SQLquery = "SELECT * FROM tab_menu";
						break;
					case "getItemType":
						SQLquery = "SELECT * FROM tab_item_type";
						break;
					default:
						break;
				}
				callback(null,connection,SQLquery);
			},
			function(connection,SQLquery,callback){
				connection.query(SQLquery,function(err,rows){
					connection.release();
					if(!err){
						if(type === "login"){
							callback(rows.length === 0 ? false : rows[0]);
						} else if(type == "getStatus"){
							callback(rows.length === 0 ? false : rows);
						} else if(type == "checkEmail"){
							callback(rows.length === 0 ? false : true);
						} else if(type == "getMenu"){
							callback(rows.length === 0 ? false : rows);
						} else if(type == "getItemType"){
							callback(rows.length === 0 ? false : rows);
						} else {
							callback(false);
						}
					} else {
						// if there is error, stop right away.
						// This will stop the async code execution and goes to last function.
						callback(true);
					}
				});
			}
		],
		function(result){
			// This function gets call after every async task finished.
			if(typeof(result) === "boolean" && result === true){
				callback(null);
			} else {
				callback(result);
			}
		}
	);
}

/**
	--- Router Code begins here. 
**/

router.get('/test',function(req,res){
	res.render('test');
});

router.get('/',function(req,res){
	res.render('desk');
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

router.post('/getFullMenu',function(req,res){
	var cond = "";
	
	if(req.body.item_type != "All"){
		cond += " and item_type = '"+req.body.item_type+"'";
	}
	
	if(req.body.item_category != "All"){
		cond += " and item_category = '"+req.body.item_category+"'";
	}
	
	db.query("select * from tab_menu_group_item where menu = '"+req.body.menu+"' "+cond+" order by menu_group, idx", function(err, results){
		if(err){
			//console.log('DB_ERROR',err.errno,err.sqlMessage); 
			res.json({"error": true, "message": err});
		} else {
			//console.log(results);
			res.json({"error": false, "message": results});
		}
	});
});

router.get('/index',function(req,res){
	res.render('index');
});

/*
router.get('/getMenu',function(req,res){
	handle_database(req,"getMenu",function(response){
		if(response === null){
			res.json({"error": true, "message": "Database error occured"});
		} else {
			if(!response){
				res.json({"error":true, "message":"getMenu: No Data Found"});
			} else {
				res.json({"error":false, "message": response});
			}
		}
	});
});
*/

router.post('/login', function(req,res){
	handle_database(req,"login",function(response){
		if(response === null){
			res.json({"error": true, "message": "Database error occured"});
		} else {
			if(!response){
				res.json({"error":true, "message":"Login failed! Please register"});
			} else {
				req.session.key = response;
				res.json({"error":false, "message": "Login success."});
			}
		}
	});
});

router.get('/home',function(req,res){
	if(req.session.key){
		res.render("home",{
			email: req.session.key["user_name"]
		});
	} else {
		res.redirect("/");
	}
});

router.get('/fetchStatus',function(req,res){
	if(req.session.key){
		handle_database(req,"getStatus",function(response){
			if(!response){
				res.json({"error":true, "message":"There is no status to show."});
			} else {
				res.json({"error":false, "message":response});
			}
		});
	} else {
		res.json({"error": true, "message":"Please login first."});
	}
});

router.post('/addStatus',function(req,res){
	if(req.session.key){
		handle_database(req,"addStatus",function(response){
			if(!response){
				res.json({"error":false, "message":"Status is added."});
			} else {
				res.json({"error":false, "message":"Error while adding Status"});
			}
		});
	} else {
		res.json({"error":true, "message":"Please login first."});
	}
});

router.post('/register',function(req,res){
	handle_database(req,"checkEmail",function(response){
		if(response === null){
			res.json({"error":true, "message":"This email is already present"});
		} else {
			handle_database(req,"register",function(response){
				if(response === null){
					res.json({"error":true, "message":"Error while adding user."});
				} else {
					res.json({"error":false, "message":"Registered successfully."});
				}
			});
		}
	});
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

app.use('/',router);

// Run Server
/*
http.listen(conf.app_port, conf.app_host, function(){
	console.log('listening on *:',conf.app_port);
	notifyUser();
});
*/

http.listen(process.env.PORT || 3000, function(){
	console.log('listening on *:',process.env.PORT || 3000);
	notifyUser();
});

function notifyUser() {
	notifier.notify({
		'title': conf.app_title,
		'message': 'Listening on *:'+conf.app_port,
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
