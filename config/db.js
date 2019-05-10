//Database connection and configuration
var mysql = require('mysql');

var pool = mysql.createPool({
	connectionLimit: 100, //important
	host 	: 'localhost',
	user 	: 'kot',
	password: 'kot',
	database: 'kot',
	debug 	: false
});

/*
module.exports = {
	sql: function(query){
		pool.query(query, function(err,rows){
			if(err){
				console.log('Error occured',err);
				//return res.json({"error": true, 'message': 'Error occured '+err, 'code': err.code});
				return {"error": true, 'message': 'Error occured '+err, 'code': err.code}
			}
			
			//connection will be released as well.
			console.log('Your data',rows);
			//res.json(rows);
			return (rows);
		});
	}
}
*/

module.exports = pool;