'use strict';

var myAppModule = angular.module('ridApp.controllers', [ 'ui.bootstrap' ]);

myAppModule.controller('homeController', [ '$rootScope', '$scope',
		function($rootScope, $scope) {
			console.log('Home Controller');
		} ]);

myAppModule.controller('userController', [
		'$route',
		'$rootScope',
		'$scope',
		'$routeParams',
		'$location',
		'UserFactory',
		function($route, $rootScope, $scope, $routeParams, $location,
				UserFactory) {
			console.log('userController');
			$scope.user = {};
			
			$scope.AddUser = function() {
				UserFactory.save($scope.user).$promise.then(function(response) {
					$scope.message = "Data Save";
					if (response.success) {
						$scope.user.id = response.data.id;
						$scope.msgClass = 'alert alert-success';
					} else {
						$scope.msgClass = 'alert alert-danger';
					}
				});
			};

			$scope.deleteUser = function() {
				UserFactory.remove($scope.user).$promise
						.then(function(response) {
							$scope.message = response.message;
							if (response.success) {
								$scope.user = {};
								$scope.msgClass = 'alert alert-success';
							} else {
								$scope.msgClass = 'alert alert-danger';
							}
						});
			};
			$scope.GetUser = function() {
				UserFactory.get($scope.user).$promise.then(function(response) {
					if (response.success) {
						$scope.user = response.data;
					}
				});
			};
			$scope.viewUserlist = function() {
				$location.path('/users');
			};
			$scope.newUser = function() {
				if ($routeParams.id) {
					$location.path('/user');
				} else {
					$route.reload();
				}
			};
		    var id = $routeParams.id;
			if (id) {
				UserFactory.get({
					id : id
				}).$promise.then(function(response) {

					$scope.user = response;

				});
				;
			}

		} ]);

myAppModule.controller('usersController', [
		'$route',
		'$rootScope',
		'$scope',
		'$location',
		'$routeParams',
		'$modal',
		'$log',
		'UserFactory',
		function($route, $rootScope, $scope, $location, $routeParams, $modal,
				$log, UserFactory) {
			console.log('usersController');
			$log.debug($routeParams);
			var i = 0;
			$scope.currentPage = 1;
			$scope.users = [];
			$scope.searchmodel = {};
			$scope.getUsers = function() {
				UserFactory.query().$promise.then(function(response) {
					$scope.users = response;
				});
			};

			$scope.deleteUser = function(id) {
				UserFactory.remove({
					id : id
				}).$promise.then(function(response) {
					$scope.getUsers();
				});
			};

			$scope.updateUser = function(id) {
				$location.path('/user/' + id);
			};
			$scope.addNewUser = function() {
				$location.path('/user');
			};
			$scope.getUsers();

		} ]);
