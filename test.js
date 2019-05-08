var express 		= require('express');
var app 			= express();
var http 			= require('http').Server(app);
var cookieParser 	= require('cookie-parser');

app.use(cookieParser());

app.get('/', function(req, res){
	console.log("Cookies: ", req.cookies);
	res.cookie('name', 'test');
	res.send('Welcome back buddy!!!');
});

http.listen(3003, function(){
	console.log('listening on *:3003');
});