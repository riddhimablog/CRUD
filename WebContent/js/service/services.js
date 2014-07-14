'use strict';
var services = angular.module('ridApp.services', [ 'ngResource' ]);

services.factory('UserFactory', function($resource) {
	return  $resource('users/:id', {id:'@id'});
});



