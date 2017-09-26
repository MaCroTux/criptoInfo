#!//usr/bin/nodejs

const url = 'coinmarketcap-nexuist.rhcloud.com';

var http = require('http');
var criptos = [{btc: 'Bitcoin'}, {eth: 'Ethereum'}];

criptos.forEach(function(item){
	http.get({
		host: url,
		path: '/api/'+Object.keys(item)[0]
		},
		function(response) {
			var coinName = item[Object.keys(item)[0]];
		        // Continuously update stream with data
		        var body = '';
		        response.on('data', function(d) { body += d; });
		        response.on('end', function() {

		                // Data reception is done, do whatever with it!
		                var parsed = JSON.parse(body);
		                console.log(coinName+': $'+parsed.price.usd+' ('+parsed.price.eur.toFixed(2)+'€)');
		        });
		}
	);

});
