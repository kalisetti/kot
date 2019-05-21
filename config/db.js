//Database connection and configuration
var mysql = require('mysql');

// Always use MySQL pooling.
// Helpful for multiple connections.
var pool = mysql.createPool({
	connectionLimit: 100, //important
	host 	: 'localhost',
	user 	: 'kot',
	password: 'kot',
	database: 'kot',
	debug 	: false
});

//module.exports = pool;

module.exports = {
	query: function(){
		var sql_args = [];
		var args = [];
		
		for(var i=0; i<arguments.length; i++){
			args.push(arguments[i]);
		}
		
		var callback = args[args.length-1]; //last arg is call back
		pool.getConnection(function(err, connection){
			if(err){
				//console.log('MYERROR',err);
				//console.log('DB_ERROR',err.errno,err.sqlMessage);
				return callback(err);
			}
			
			if(args.length > 2){
				sql_args = args[1];
			}
			
			connection.query(args[0], sql_args, function(err, results){
				connection.release();
				if(err){
					//console.log(err);
					return callback(err);
				}
				callback(null, results);
			});
		});
	}
};
