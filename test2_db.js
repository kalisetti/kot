var express = require('express');
var app = express();
var db = require('./config/db.js');

app.get("/", function(req, res){
	var test = db.sql('select * from tabuser');
	console.log('blabla',test);
	res.json(test);
});

app.listen(3000);