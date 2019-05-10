var login = require('./login.js');

module.exports.set = function(app){
	//login.js
	login.set(app);
	
	// Pug page
	app.get('/first_template', function(req, res){
		res.render('first_view');
	});
	app.get('/dynamic_view',function(req, res){
		res.render('dynamic', {
			name: "TutorialsPoint",
			url: "http://www.tutorialspoint.com",
			user: {name: "siva@bt.bt", age: "35"}
		});
	});
	app.get('/components', function(req, res){
		res.render('content');
	});
	app.get('/form', function(req, res){
		res.render('form');
	});
	// Pug End
	
	//Other routes here
	//Important - This should be placed after all your routes, as Express matches
	//    routes from start to end of the app.js/index.js file, including the 
	//	  external routers you required.
	app.get('*', function(req, res){
		res.send('Sorry, this is an invalid URL.');
	});
}