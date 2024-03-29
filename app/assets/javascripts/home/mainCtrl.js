angular.module('flapperNews')
.controller('MainCtrl', [
'$scope',
'posts',
function($scope, posts){
	$scope.test = 'Hello world!';
	$scope.posts = posts.posts;

	$scope.addPost = function() {
		posts.create({
			title: $scope.title,
			link: $scope.link
		});
		$scope.title = '';
		$scope.link = '';
	};

	$scope.incrementUpvotes = function(post) {
		posts.upvote(post);
	}
}]);