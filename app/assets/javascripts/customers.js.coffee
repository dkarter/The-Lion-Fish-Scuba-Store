root = global ? window

angular.module("customers", ["ngResource"]).factory "Customer", ['$resource', ($resource) ->
  Customer = $resource("/customers/:id",
    id: "@id"
  ,
    update:
      method: "PUT"

    destroy:
      method: "DELETE"
  )
  Customer::destroy = (cb) ->
    Customer.remove
      id: @id
    , cb

  Customer
]
root.angular = angular
