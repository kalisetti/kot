var path 	= require('path');
var db 	 	= require('../config/db.js');
//var process = require('process');

//console.log('cwd()',process.cwd(),'__dirname',__dirname);

module.exports.set = function(app){
	app.get('/', function(req, res){
		console.log("Cookies: ", req.cookies);
		// Setting a cookie
		res.cookie('name', 'express'); //Sets name=express
		res.cookie('silly', 'feeling silly', {maxAge: 60000}); //This cookies expires after 60000ms from the time it is set
		res.clearCookie('foo'); //Deleting Existing Cookies 
		
		if (req.session.loggedin){
			res.send('Welcome back, '+ req.session.username + '!')
		} else {
			res.sendFile(path.join(__dirname, '../login.html'));
		} 
	});

	app.post('/', function(req, res){
		console.log(req.body);
		res.send("received your request!..");
	});

	app.get('/auth', function(req, res){
		res.send('Unauthorized access');
		res.end();
	});

	app.post('/auth', function(req, res){
		var username = req.body.username;
		var password = req.body.password;
		
		if(username && password){
			db.query("select * from tabuser where username = ? and password = ?", [username, password], function(err,results,fields){
				if(err){
					console.log('Error occured',err);
					return res.json({"error": true, 'message': 'Error occured '+err, 'code': err.code});
				}
				
				//connection will be released as well.
				//res.json(rows);
				if (results.length > 0){
					req.session.loggedin = true;
					req.session.username = username;
					res.redirect('/home');
				} else {
					res.send('Incorrect Username and/or Password!');
				}
				res.end();
			});
		} else {
			res.send('Please enter Username and Password!');
			res.end();
		}
	});

	app.get('/logout', function(req, res){
		//req.session.loggedin = false;
		req.session.destroy(function(err){
			if(err){
				console.log(err);
			} else {
				res.redirect('/');
			}
		});
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
}