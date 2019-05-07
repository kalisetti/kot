var express 		= require('express');
var app 			= express();
var http 			= require('http').Server(app);
var io 				= require('socket.io')(http);
var session 		= require('express-session');
var bodyParser 		= require('body-parser');
var path 			= require('path');
var mysql 			= require('mysql');
var cookieParser 	= require('cookie-parser');

// Notifications
const notifier 		= require('node-notifier');

var things = require('./things.js');
//both app.js and things.js should be in same directory
app.use('/things', things)

var con = mysql.createConnection({
	host : 'localhost',
	user : 'kot',
	password : 'kot',
	database: 'kot'
});

app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

// Adding assets like images,css and js
app.use(express.static('assets'));

// Cookies
app.use(cookieParser());

app.get('/', function(req, res){
	if (req.session.loggedin){
		res.send('Welcome back, '+ req.session.username + '!')
	} else {
		res.sendFile(path.join(__dirname, '/login.html'));
	}
	//console.log("Cookies: ", req.cookies);
});

app.get('/auth', function(req, res){
	res.send('Unauthorized access');
	res.end();
});

app.io = io;

app.post('/auth', function(req, res){
	var username = req.body.username;
	var password = req.body.password;
	
	if(username && password){
		con.query('SELECT * FROM tabuser WHERE username = ? AND password = ?', [username, password], function(error, results, fields){
			if (results.length > 0){
				req.session.loggedin = true;
				req.session.username = username;
				res.redirect('/home');
			} else {
				res.send('Incorrect Username and/or Password!');
				req.app.io.emit('tx', "hahahaha");
			}
			res.end();
		});
	} else {
		res.send('Please enter Username and Password!');
		res.end();
	}
});

app.get('/logout', function(req, res){
	req.session.loggedin = false;
	res.redirect('/');
	res.end();
});

app.get('/home', function(req, res){
	if (req.session.loggedin){
		res.send('Welcome back, '+ req.session.username + '!')
	} else {
		//res.send('Please login to view this page!');
		res.redirect('/'); //shiv added
	}
	res.end();
});

/*
io.on('connection', function(socket){
	console.log('A user connected...ssss');
	
	socket.on('disconnect', function(){
		console.log('A user disconnected...zzz');
	});
});
*/

//Other routes here
//Important - This should be placed after all your routes, as Express matches
//    routes from start to end of the app.js/index.js file, including the 
//	  external routers you required.
app.get('*', function(req, res){
	res.send('Sorry, this is an invalid URL.');
});

http.listen(3000, function(){
	console.log('listening on *:3000');
	notifier.notify({
		'title': 'KITCHEN ORDER TICKET SYSTEM',
		'message': 'Listening on *:3000',
		'icon': path.join(__dirname, 'assets/images/cupicon.gif'),
		sound: true, // Only Notification Center or Windows Toasters
		wait: true // Wait with callback, until user action is taken against notification
	}, function(err, res){
		// Response is response from notification
		console.log('Notifier response ');
		console.log(res);
	});
});