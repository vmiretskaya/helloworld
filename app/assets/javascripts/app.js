var app = angular.module('shop', ['ngResource']);

$(document).on('ready page:load', function() {
  angular.bootstrap(document, ['shop'])
});

app.factory('models', ['$resource', function($resource){
  var orders_model = $resource("/orders/:id.json", {id: "@id"});
  var products_model = $resource("/products/:id.json", {id: "@id"});

  var x = {
    orders: orders_model,
  	products: products_model
  };
  return x;
}]);


app.controller('OrdersCtrl', ['$scope', 'models',function($scope, models){
 	$scope.orders = models.orders.query();
	$scope.products = models.products.query();

 $scope.addOrder = function(){
  if(!$scope.newOrder.product_id || $scope.newOrder.total === ''){ return; }
  order = models.orders.save($scope.newOrder, function(){
    recent_order = models.orders.get({id: order.id});
    $scope.orders.push(recent_order);
    $scope.newOrder = '';
});
}

$scope.deleteOrder = function(order){
  models.orders.delete(order);
  $scope.orders.splice($scope.orders.indexOf(order), 1);
}

$scope.showOrder = function(order){
  window.open('./orders/' + order.id , '_self');
}

///////////////////////////////////////////////////////////////////////////////////
/*app.factory('model', ['$resource', function($resource){
  var orders_model = $resource("/orders/:id.json", {id: "@id"});
  var products_model = $resource("/products/:id.json", {id: "@id"});

  var x = {
    orders: orders_model,
    products: products_model
  };
  return x;
}]);

app.controller('OrderCtrl', ['$scope', 'model',function($scope, models){
}]);
*///$scope.orders = models.orders;
// $scope.orders =[
//    {id: 1, total: 24, product_id: 1, user_id: 1},
//    {id: 2, total: 7, product_id: 1},
//    {id: 3, total: 42, product_id: 1, user_id: 1}
//  ];

}]);

