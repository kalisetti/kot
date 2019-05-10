var express = require('express');
var app = express();
var db = require('./config/db.js');

function handle_database(req, res){
	db.query("select * from tabuser", function(err,rows){
		if(err){
			console.log('Error occured',err);
			return res.json({"error": true, 'message': 'Error occured '+err, 'code': err.code});
		}
		
		//connection will be released as well.
		console.log('Your data',rows);
		res.json(rows);
	});
}


app.get("/", function(req, res){
	handle_database(req, res);
});

app.listen(3000);