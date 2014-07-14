/**
 * 
 */
'use strict';
angular.module('ridApp',
		[ 'ngRoute', 'ridApp.services', 'ridApp.controllers', 'ui.bootstrap'

		]).config(function($routeProvider, $httpProvider) {
	$routeProvider.when('/', {
		controller : 'userController',
		templateUrl : 'jsp/template/userTemplate.jsp'
	}).when('/user/:id', {
		controller : 'userController',
		templateUrl : 'jsp/template/userTemplate.jsp'
	}).when('/users', {
		controller : 'usersController',
		templateUrl : 'jsp/template/userListTemplate.jsp'
	}).when('/about', {
		templateUrl : 'jsp/template/aboutTemplate.jsp'
	}).otherwise({
		redirectTo : '/'
	});
});

