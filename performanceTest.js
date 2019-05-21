var siege = require('siege');

/*
siege()
	.concurrent(50)
	.on(3000)
	.for(10000).times
	.get('/').for(60).seconds
	.attack()
*/

siege()
	.concurrent(50)
	.on(3000)
	.for(10000).times
	.get('/')
	.attack()