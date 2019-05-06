var express = require('express');
var app = express();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var session = require('express-session');
var bodyParser = require('body-parser');
var path = require('path');
var mysql = require('mysql');

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

app.use(express.static('assets'));

app.get('/', function(req, res){
	//res.sendFile('index.html', {"root": __dirname});
	if (req.session.loggedin){
		res.send('Welcome back, '+ req.session.username + '!')
	} else {
		res.sendFile(path.join(__dirname + '/login.html'));
	}
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

http.listen(3000, function(){
	console.log('listening on *:3000');
});