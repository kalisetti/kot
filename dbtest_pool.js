var express = require('express');
var mysql = require('mysql');
var app = express();

var pool = mysql.createPool({
	connectionLimit: 100, //important
	host 	: 'localhost',
	user 	: 'kot',
	password: 'kot',
	database: 'kot',
	debug 	: false
});


function handle_database(req, res){
	pool.getConnection(function(err,connection){
		if(err){
			res.json({"code":100, "status":"Error in connection database"});
			return;
		}
		
		console.log('Connected as id ',connection.threadId);
		
		connection.query("select * from tabuser", function(err,rows){
			connection.release();
			if(!err){
				res.json(rows);
			}
		});
		
		connection.on('error', function(err){
			res.json({"code": 100, "status": "Error in connection database"});
			return;
		});
	});
}


app.get("/", function(req, res){
	handle_database(req, res);
});

app.listen(3000);