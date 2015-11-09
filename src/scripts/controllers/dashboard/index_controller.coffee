class DashboardIndex extends Controller
  constructor: (
    @$scope
  ) -> do @init
    
  init: =>
    do @declare_vars
    do @declare_scope_vars
    do @set_listeners

  declare_vars: ->
    console.log 'declare_vars'

  declare_scope_vars: ->
    @$scope.itemsByPage = 5
    
    @$scope.safe_data = [
      {
        firstName: "firstName1"
        lastName: "lastName1"
        age: "age1"
        email: "email1"
        balance: "balance1"
      }
      {
        firstName: "firstName2"
        lastName: "lastName2"
        age: "age2"
        email: "email2"
        balance: "balance2"
      }
      {
        firstName: "firstName3"
        lastName: "lastName3"
        age: "age3"
        email: "email3"
        balance: "balance3"
      }
      {
        firstName: "firstName4"
        lastName: "lastName4"
        age: "age4"
        email: "email4"
        balance: "balance4"
      }
      {
        firstName: "firstName1"
        lastName: "lastName1"
        age: "age1"
        email: "email1"
        balance: "balance1"
      }
      {
        firstName: "firstName2"
        lastName: "lastName2"
        age: "age2"
        email: "email2"
        balance: "balance2"
      }
      {
        firstName: "firstName3"
        lastName: "lastName3"
        age: "age3"
        email: "email3"
        balance: "balance3"
      }
      {
        firstName: "firstName4"
        lastName: "lastName4"
        age: "age4"
        email: "email4"
        balance: "balance4"
      }
      {
        firstName: "firstName1"
        lastName: "lastName1"
        age: "age1"
        email: "email1"
        balance: "balance1"
      }
      {
        firstName: "firstName2"
        lastName: "lastName2"
        age: "age2"
        email: "email2"
        balance: "balance2"
      }
      {
        firstName: "firstName3"
        lastName: "lastName3"
        age: "age3"
        email: "email3"
        balance: "balance3"
      }
      {
        firstName: "firstName4"
        lastName: "lastName4"
        age: "age4"
        email: "email4"
        balance: "balance4"
      }
      {
        firstName: "firstName1"
        lastName: "lastName1"
        age: "age1"
        email: "email1"
        balance: "balance1"
      }
      {
        firstName: "firstName2"
        lastName: "lastName2"
        age: "age2"
        email: "email2"
        balance: "balance2"
      }
      {
        firstName: "firstName3"
        lastName: "lastName3"
        age: "age3"
        email: "email3"
        balance: "balance3"
      }
      {
        firstName: "firstName4"
        lastName: "lastName4"
        age: "age4"
        email: "email4"
        balance: "balance4"
      }
    ]

    @$scope.rowCollection = angular.copy(@$scope.safe_data)

    console.log 'declare_scope_vars'

  set_listeners: ->
    console.log 'set_listeners'


# [  
#    {  
#       "combustivel":"Flex",
#       "imagem":null,
#       "marca":"Volkswagem",
#       "modelo":"Gol",
#       "placa":"FFF­5498",
#       "valor":"20000"
#    },
#    {  
#       "combustivel":"Gasolina",
#       "imagem":null,
#       "marca":"Volkswagem",
#       "modelo":"Fox",
#       "placa":"FOX­4125",
#       "valor":"20000"
#    },
#    {  
#       "combustivel":"Alcool",
#       "imagem":"https://lh4.googleusercontent.com/­_AhcQKHf7rM/AAAAAAAAAAI/AAAAAAAAAAA/QM­pqL4NYaE/s48­c­k­no/photo.jpg",
#       "marca":"Volkswagen",
#       "modelo":"Fusca",
#       "placa":"PAI­4121",
#       "valor":"20000"
#    }
# ]