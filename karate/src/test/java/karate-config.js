function fn() {
	var env = karate.env; // get system property 'karate.env'
	if (!env) {
		env = 'develop';
	}

	var config = {
		env: env,
		baseUrl: 'http://localhost'
	}
		config.baseUrl = karate.properties['url']
		karate.configure('connectTimeout', 20000);
     	karate.configure('readTimeout', 20000);
		karate.log('Environment is: ', env)
		return config;
}