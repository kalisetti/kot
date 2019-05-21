var async = require('async');

async.waterfall(
	[
		function (doneabc){
			doneabc(null,'Value 1');
		},
		function (value1, donex){
			console.log(value1);
			donex(null, 'Value 2');
		},
		function (value2, doney){
			console.log(value2);
			doney('what in the world','done')
		}
	],
	function(err){
		if(err) {
			console.log('Throwing error...');
			throw new Error(err);
		}
	}
);

