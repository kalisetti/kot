var express = require('express');
var mysql = require('mysql');

var connection = mysql.createConnection({
	host 	: 'localhost',
	user 	: 'kot',
	password: 'kot',
	database: 'kot'
});

var app = express();

connection.connect(function(err){
	if(!err){
		console.log('Database is connected');
	} else {
		console.log('Error connecting database');
	}
});

app.get("/", function(req, res){
	connection.query("select * from tabuser", function(err, rows, fields){
		connection.end();
		if(!err){
			console.log('The solution is: ', rows);
		} else {
			console.log('Error while performing Query.');
		}
	});
});

app.listen(3000);