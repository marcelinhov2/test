class Cars extends Value
  constructor: ->
    return [  
      {
        "id": parseInt(do _.uniqueId)
        "combustivel":"Flex"
        "imagem":null
        "marca":"Volkswagem"
        "modelo":"Gol"
        "placa":"FFF-5498"
        "valor":10000
      }
      {
        "id": parseInt(do _.uniqueId)
        "combustivel":"Gasolina"
        "imagem":null
        "marca":"Volkswagem"
        "modelo":"Fox"
        "placa":"FOX-4125"
        "valor":20000
      }
      {
        "id": parseInt(do _.uniqueId)
        "combustivel":"Alcool"
        "imagem":"http://placehold.it/350x150"
        "marca":"Volkswagen"
        "modelo":"Fusca"
        "placa":"PAI-4121"
        "valor":30000
      }
    ]