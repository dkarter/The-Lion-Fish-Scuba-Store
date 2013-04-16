
root = global ? window

CustomersIndexCtrl = ($scope, Customer) ->
  $scope.customers = Customer.query()
  $scope.destroy = ->
    dconfirm = confirm("Are you sure?")
    if dconfirm
      original = @customer
      @customer.destroy ->
        $scope.customers = _.without($scope.customers, original)

CustomersIndexCtrl.$inject = ['$scope', 'Customer'];

CustomersCreateCtrl = ($scope, $location, Customer) ->
  $scope.save = ->
    Customer.save $scope.customer, (customer) ->
      $location.path "/customers/#{customer.id}"

CustomersCreateCtrl.$inject = ['$scope', '$location', 'Customer'];

CustomersShowCtrl = ($scope, $location, $routeParams, Customer) ->
  Customer.get
    id: $routeParams.id
  , (customer) ->
    self.original = customer
    $scope.customer = new Customer(self.original)

CustomersShowCtrl.$inject = ['$scope', '$location', '$routeParams', 'Customer'];

CustomersEditCtrl = ($scope, $location, $routeParams, Customer) ->
  self = this
  Customer.get
    id: $routeParams.id
  , (customer) ->
    self.original = customer
    $scope.customer = new Customer(self.original)

  $scope.isClean = ->
    angular.equals self.original, $scope.customer

  $scope.destroy = ->
    dconfirm = confirm("Are you sure?")
    if dconfirm
      $scope.customer.destroy ->
        $location.path "/customers"


  $scope.save = ->
    Customer.update $scope.customer, (customer) ->
      $location.path "/customers"

CustomersEditCtrl.$inject = ['$scope', '$location', '$routeParams', 'Customer'];

# exports
root.CustomersIndexCtrl  = CustomersIndexCtrl
root.CustomersCreateCtrl = CustomersCreateCtrl
root.CustomersShowCtrl   = CustomersShowCtrl
root.CustomersEditCtrl   = CustomersEditCtrl 